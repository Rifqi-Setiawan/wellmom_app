import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/features/chat/presentation/pages/konsul_chat_screen.dart';

/// Top-level function untuk background message handler (harus top-level)
@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('========================================');
  debugPrint('[FCM] ===== BACKGROUND MESSAGE RECEIVED =====');
  debugPrint('[FCM] Message ID: ${message.messageId}');
  debugPrint('[FCM] From: ${message.from}');
  debugPrint('[FCM] Sent Time: ${message.sentTime}');
  debugPrint('[FCM] Title: ${message.notification?.title}');
  debugPrint('[FCM] Body: ${message.notification?.body}');
  debugPrint('[FCM] Data: ${message.data}');
  debugPrint('[FCM] Has notification: ${message.notification != null}');
  
  // Log data payload fields yang dikirim backend
  if (message.data.isNotEmpty) {
    debugPrint('[FCM] Background - Data payload fields:');
    message.data.forEach((key, value) {
      debugPrint('[FCM]   - $key: $value');
    });
    
    // Check for specific backend fields
    if (message.data.containsKey('type')) {
      debugPrint('[FCM] Background - Notification type: ${message.data['type']}');
    }
    if (message.data.containsKey('risk_level')) {
      debugPrint('[FCM] Background - Risk level: ${message.data['risk_level']}');
    }
    if (message.data.containsKey('ibu_hamil_id')) {
      debugPrint('[FCM] Background - Ibu hamil ID: ${message.data['ibu_hamil_id']}');
    }
  }
  debugPrint('========================================');
  
  // Initialize local notifications untuk menampilkan notifikasi saat app di background/terminated
  final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();
  
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_notification');
  const iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  
  const initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );
  
  // Initialize dengan callback kosong karena ini background handler
  await localNotifications.initialize(
    settings: initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      debugPrint('[FCM] Background notification tapped: ${response.payload}');
    },
  );
  
  // Create notification channel untuk Android
  // IMPORTANT: Channel ID harus match dengan backend: wellmom_notifications
  const androidChannel = AndroidNotificationChannel(
    'wellmom_notifications',
    'WellMom Notifications',
    description: 'Notifications for WellMom app',
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
  );
  
  await localNotifications
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel);
  
  // Tampilkan local notification jika ada notification payload atau data payload
  final notification = message.notification;
  String? title;
  String? body;
  
  if (notification != null) {
    title = notification.title;
    body = notification.body;
  } else if (message.data.isNotEmpty) {
    // Fallback: gunakan data payload untuk membuat notifikasi
    title = message.data['title'] as String? ?? 
            message.data['notification_title'] as String? ??
            'WellMom';
    body = message.data['body'] as String? ?? 
           message.data['notification_body'] as String? ??
           message.data['message'] as String? ??
           'Anda memiliki notifikasi baru';
    
    debugPrint('[FCM] Background: Creating notification from data payload: title=$title, body=$body');
  }
  
  if (title != null && body != null) {
    // IMPORTANT: Channel ID harus match dengan backend: wellmom_notifications
    const androidDetails = AndroidNotificationDetails(
      'wellmom_notifications',
      'WellMom Notifications',
      channelDescription: 'Notifications for WellMom app',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      playSound: true,
      enableVibration: true,
      // Icon kecil di status bar (logo WellMom)
      icon: '@mipmap/ic_notification',
      // Icon besar di panel notifikasi (logo WellMom berwarna)
      largeIcon: const DrawableResourceAndroidBitmap('ic_notification_large'),
      color: const Color(0xFFFF6B9D), // Match dengan backend color #FF6B9D
    );
    
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    
    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    
    // Store data as JSON string for payload
    final payload = message.data.isNotEmpty 
        ? message.data.entries.map((e) => '${e.key}:${e.value}').join('|')
        : '';
    
    try {
      await localNotifications.show(
        id: message.hashCode,
        title: title,
        body: body,
        notificationDetails: notificationDetails,
        payload: payload,
      );
      
      debugPrint('[FCM] Background notification displayed: $title');
    } catch (e) {
      debugPrint('[FCM] Error displaying background notification: $e');
    }
  } else {
    debugPrint('[FCM] Background message has no notification or data payload, skipping local notification');
  }
}

/// Service untuk menangani Firebase Cloud Messaging (FCM) dan Local Notifications
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  FirebaseMessaging? _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  String? _fcmToken;
  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  
  /// Callback untuk update token ke backend saat token refresh
  Future<void> Function(String token)? _onTokenRefreshCallback;
  
  /// Getter untuk FirebaseMessaging dengan lazy initialization
  FirebaseMessaging get _messaging {
    if (_firebaseMessaging == null) {
      throw StateError('NotificationService not initialized. Call NotificationService.initialize() first.');
    }
    return _firebaseMessaging!;
  }
  
  /// Set callback untuk update token ke backend saat token refresh
  void setTokenRefreshCallback(Future<void> Function(String token) callback) {
    _onTokenRefreshCallback = callback;
    debugPrint('[NotificationService] Token refresh callback set');
  }

  /// Initialize Firebase Messaging dan Local Notifications
  static Future<void> initialize() async {
    await _instance._initialize();
  }

  Future<void> _initialize() async {
    if (_initialized) {
      debugPrint('[NotificationService] Already initialized');
      return;
    }

    try {
      // Initialize Firebase (jika belum)
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
        debugPrint('[NotificationService] Firebase initialized');
      }

      // Initialize FirebaseMessaging setelah Firebase siap
      _firebaseMessaging = FirebaseMessaging.instance;
      debugPrint('[NotificationService] FirebaseMessaging initialized');
      
      // Set foreground notification presentation options untuk Android
      // Ini memastikan notifikasi ditampilkan bahkan saat app di foreground
      await _firebaseMessaging!.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('[NotificationService] Foreground notification presentation options set');

      // Initialize Local Notifications
      await _initializeLocalNotifications();

      // Request permission untuk notifications
      await _requestPermission();

      // Setup foreground message handler - MUST be registered before getting token
      // Store subscription to prevent it from being garbage collected
      debugPrint('[NotificationService] ===== SETTING UP FOREGROUND MESSAGE HANDLER =====');
      _onMessageSubscription = FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) {
          debugPrint('[NotificationService] ===== onMessage listener TRIGGERED =====');
          debugPrint('[NotificationService] Message received in onMessage stream');
          debugPrint('[NotificationService] Message ID: ${message.messageId}');
          debugPrint('[NotificationService] Has notification: ${message.notification != null}');
          debugPrint('[NotificationService] Has data: ${message.data.isNotEmpty}');
          _onForegroundMessage(message);
        },
        onError: (error) {
          debugPrint('[NotificationService] ERROR in onMessage stream: $error');
        },
        onDone: () {
          debugPrint('[NotificationService] onMessage stream closed');
        },
        cancelOnError: false,
      );
      debugPrint('[NotificationService] ✓ Foreground message handler registered and subscription stored');
      debugPrint('[NotificationService] Subscription object: $_onMessageSubscription');
      
      // Verify subscription is active
      if (_onMessageSubscription != null) {
        debugPrint('[NotificationService] ✓ onMessage subscription is active: ${!_onMessageSubscription!.isPaused}');
        debugPrint('[NotificationService] ✓ Subscription hash code: ${_onMessageSubscription.hashCode}');
      } else {
        debugPrint('[NotificationService] ✗ WARNING: onMessage subscription is null!');
      }
      
      // Also register a direct listener as a test
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        debugPrint('[NotificationService] ===== DIRECT LISTENER ALSO TRIGGERED =====');
        debugPrint('[NotificationService] Direct listener - Message ID: ${message.messageId}');
        _onForegroundMessage(message);
      });
      debugPrint('[NotificationService] ✓ Direct listener also registered as backup');

      // Setup background message handler
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
      debugPrint('[NotificationService] Background message handler registered');

      // Setup notification tap handler (ketika user tap notifikasi)
      setupInteractedMessage();
      debugPrint('[NotificationService] Notification tap handler registered');

      // Get FCM token
      await _getFcmToken();

      _initialized = true;
      debugPrint('========================================');
      debugPrint('[NotificationService] ✓✓✓ INITIALIZATION COMPLETE ✓✓✓');
      debugPrint('[NotificationService] All handlers registered and ready');
      debugPrint('[NotificationService] Channel ID: wellmom_notifications');
      debugPrint('[NotificationService] FCM Token: ${_fcmToken?.substring(0, _fcmToken!.length > 50 ? 50 : _fcmToken!.length)}...');
      debugPrint('========================================');
    } catch (e, stackTrace) {
      debugPrint('[NotificationService] ✗✗✗ INITIALIZATION ERROR ✗✗✗');
      debugPrint('[NotificationService] Error: $e');
      debugPrint('[NotificationService] Stack trace: $stackTrace');
      // Don't set _initialized to true if there's an error
    }
  }

  /// Initialize Local Notifications
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_notification');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
      // Note: onDidReceiveBackgroundNotificationResponse requires a top-level function
      // We'll handle background notifications through FCM's onBackgroundMessage instead
    );

    // Request permission untuk Android local notifications (Android 13+)
    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      final granted = await androidPlugin.requestNotificationsPermission();
      debugPrint('[NotificationService] Android notification permission granted: $granted');
    }

    // Create notification channel untuk Android
    // IMPORTANT: Channel ID harus match dengan backend: wellmom_notifications
    const androidChannel = AndroidNotificationChannel(
      'wellmom_notifications',
      'WellMom Notifications',
      description: 'Notifications for WellMom app',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    await androidPlugin?.createNotificationChannel(androidChannel);
    debugPrint('[NotificationService] Android notification channel created: wellmom_notifications');

    debugPrint('[NotificationService] Local notifications initialized');
  }

  /// Request permission untuk notifications
  Future<void> _requestPermission() async {
    try {
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('[NotificationService] User granted notification permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        debugPrint(
            '[NotificationService] User granted provisional notification permission');
      } else {
        debugPrint(
            '[NotificationService] User denied notification permission');
      }
    } catch (e) {
      debugPrint('[NotificationService] Permission request error: $e');
    }
  }

  /// Request notification permission (public method untuk dipanggil dari UI)
  Future<bool> requestNotificationPermission() async {
    try {
      // Request FCM permission
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      // Request Android local notification permission (Android 13+)
      final androidPlugin = _localNotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin != null) {
        await androidPlugin.requestNotificationsPermission();
      }

      final isAuthorized = settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;
      
      debugPrint('[NotificationService] Permission request result: $isAuthorized');
      return isAuthorized;
    } catch (e) {
      debugPrint('[NotificationService] Error requesting permission: $e');
      return false;
    }
  }

  /// Check current notification permission status
  Future<AuthorizationStatus> getNotificationPermissionStatus() async {
    try {
      final settings = await _messaging.getNotificationSettings();
      return settings.authorizationStatus;
    } catch (e) {
      debugPrint('[NotificationService] Error getting permission status: $e');
      return AuthorizationStatus.notDetermined;
    }
  }

  /// Handle foreground messages (ketika app sedang dibuka)
  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('========================================');
    debugPrint('[FCM] ===== FOREGROUND MESSAGE RECEIVED =====');
    debugPrint('[FCM] Message ID: ${message.messageId}');
    debugPrint('[FCM] From: ${message.from}');
    debugPrint('[FCM] Sent Time: ${message.sentTime}');
    debugPrint('[FCM] Title: ${message.notification?.title}');
    debugPrint('[FCM] Body: ${message.notification?.body}');
    debugPrint('[FCM] Data: ${message.data}');
    debugPrint('[FCM] Has notification payload: ${message.notification != null}');
    debugPrint('[FCM] Has data payload: ${message.data.isNotEmpty}');
    debugPrint('[FCM] Notification object: ${message.notification}');
    
    // Log data payload fields yang dikirim backend
    if (message.data.isNotEmpty) {
      debugPrint('[FCM] Data payload fields:');
      message.data.forEach((key, value) {
        debugPrint('[FCM]   - $key: $value');
      });
      
      // Check for specific backend fields
      if (message.data.containsKey('type')) {
        debugPrint('[FCM] Notification type: ${message.data['type']}');
      }
      if (message.data.containsKey('risk_level')) {
        debugPrint('[FCM] Risk level: ${message.data['risk_level']}');
      }
      if (message.data.containsKey('ibu_hamil_id')) {
        debugPrint('[FCM] Ibu hamil ID: ${message.data['ibu_hamil_id']}');
      }
    }
    debugPrint('========================================');

    // Tampilkan local notification
    _showLocalNotification(message);
  }

  /// Show local notification
  Future<void> _showLocalNotification(RemoteMessage message) async {
    debugPrint('[FCM] _showLocalNotification called');
    
    final notification = message.notification;
    debugPrint('[FCM] Notification object: $notification');
    
    // Jika tidak ada notification payload, coba buat dari data payload
    String? title;
    String? body;
    
    if (notification != null) {
      title = notification.title;
      body = notification.body;
      debugPrint('[FCM] Using notification payload - title: $title, body: $body');
    } else if (message.data.isNotEmpty) {
      // Fallback: gunakan data payload untuk membuat notifikasi
      debugPrint('[FCM] No notification payload, checking data payload...');
      debugPrint('[FCM] Data keys: ${message.data.keys.toList()}');
      
      title = message.data['title'] as String? ?? 
              message.data['notification_title'] as String? ??
              message.data['title'] as String? ??
              'WellMom';
      body = message.data['body'] as String? ?? 
             message.data['notification_body'] as String? ??
             message.data['message'] as String? ??
             message.data['content'] as String? ??
             'Anda memiliki notifikasi baru';
      
      debugPrint('[FCM] Creating notification from data payload: title=$title, body=$body');
    }
    
    // Jika masih tidak ada title/body, skip
    if (title == null || body == null) {
      debugPrint('[FCM] ERROR: No notification title/body available, skipping local notification');
      debugPrint('[FCM] Title: $title, Body: $body');
      return;
    }

    // IMPORTANT: Channel ID harus match dengan backend: wellmom_notifications
    const androidDetails = AndroidNotificationDetails(
      'wellmom_notifications',
      'WellMom Notifications',
      channelDescription: 'Notifications for WellMom app',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      playSound: true,
      enableVibration: true,
      // Icon kecil di status bar (logo WellMom)
      icon: '@mipmap/ic_notification',
      // Icon besar di panel notifikasi (logo WellMom berwarna)
      largeIcon: const DrawableResourceAndroidBitmap('ic_notification_large'),
      color: const Color(0xFFFF6B9D), // Match dengan backend color #FF6B9D
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Store data as JSON string for payload (properly encoded)
    final payload = message.data.isNotEmpty 
        ? message.data.entries.map((e) => '${e.key}:${e.value}').join('|')
        : '';
    
    debugPrint('[FCM] Attempting to show local notification...');
    debugPrint('[FCM] Notification ID: ${message.hashCode}');
    debugPrint('[FCM] Title: $title');
    debugPrint('[FCM] Body: $body');
    debugPrint('[FCM] Payload: $payload');
    
    try {
      // Check if local notifications plugin is initialized
      final androidPlugin = _localNotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin != null) {
        final permissionGranted = await androidPlugin.areNotificationsEnabled();
        debugPrint('[FCM] Android notifications enabled: $permissionGranted');
        if (permissionGranted == false) {
          debugPrint('[FCM] WARNING: Android notifications are not enabled!');
        }
      }
      
      await _localNotifications.show(
        id: message.hashCode,
        title: title,
        body: body,
        notificationDetails: notificationDetails,
        payload: payload,
      );
      debugPrint('[FCM] ✓ Local notification displayed successfully: $title');
    } catch (e, stackTrace) {
      debugPrint('[FCM] ✗ ERROR displaying local notification: $e');
      debugPrint('[FCM] Stack trace: $stackTrace');
    }
  }

  /// Setup handlers for notification interactions (tap/opened)
  /// Handles both terminated state and background/foreground state
  void setupInteractedMessage() {
    // Handle notification when app was opened from terminated state
    _messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        debugPrint('[NotificationService] App opened from terminated state');
        _handleMessage(message);
      }
    });

    // Handle notification when app was opened from background/foreground state
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('[NotificationService] App opened from background/foreground state');
      _handleMessage(message);
    });
  }

  /// Handle notification tap from local notification (foreground)
  void _onNotificationTapped(NotificationResponse response) {
    debugPrint('[NotificationService] Local notification tapped: ${response.payload}');
    
    // Parse payload if available
    if (response.payload != null && response.payload!.isNotEmpty) {
      try {
        // Parse payload format: "key1:value1|key2:value2"
        final Map<String, String> data = {};
        final pairs = response.payload!.split('|');
        for (final pair in pairs) {
          final parts = pair.split(':');
          if (parts.length == 2) {
            data[parts[0]] = parts[1];
          }
        }
        
        if (data.isNotEmpty) {
          // Create a mock RemoteMessage for navigation
          final mockMessage = RemoteMessage(
            messageId: response.id?.toString(),
            data: data,
          );
          
          // Handle navigation using the same logic as RemoteMessage
          _handleMessage(mockMessage);
        }
      } catch (e) {
        debugPrint('[NotificationService] Error parsing notification payload: $e');
        // Fallback: navigate to home
        final navigator = AppRouter.navigatorKey.currentState;
        if (navigator != null) {
          navigator.pushNamedAndRemoveUntil(
            AppRouter.home,
            (route) => false,
          );
        }
      }
    }
  }


  /// Process notification message and navigate to appropriate screen
  /// Based on the 'type' field in message.data
  void _handleMessage(RemoteMessage message) {
    debugPrint('[NotificationService] Handling message: ${message.messageId}');
    debugPrint('[NotificationService] Data: ${message.data}');

    final data = message.data;
    final type = data['type'] as String?;
    final id = data['id'] as String?;

    if (type == null || type.isEmpty) {
      debugPrint('[NotificationService] No type found in notification data');
      return;
    }

    final navigator = AppRouter.navigatorKey.currentState;
    if (navigator == null) {
      debugPrint('[NotificationService] Navigator not available, delaying navigation');
      // Wait a bit for navigator to be ready
      Future.delayed(const Duration(milliseconds: 500), () {
        _handleMessage(message);
      });
      return;
    }

    switch (type) {
      case 'chat':
        _handleChatNotification(navigator, id);
        break;
      case 'health_risk':
        _handleHealthRiskNotification(navigator, id);
        break;
      case 'assignment':
        _handleAssignmentNotification(navigator, id);
        break;
      default:
        debugPrint('[NotificationService] Unknown notification type: $type');
        // Navigate to home as fallback
        navigator.pushNamedAndRemoveUntil(
          AppRouter.home,
          (route) => false,
        );
    }
  }

  /// Handle chat notification - navigate to KonsulChatScreen
  void _handleChatNotification(NavigatorState navigator, String? id) {
    if (id == null || id.isEmpty) {
      debugPrint('[NotificationService] Chat notification missing id, navigating to konsul screen');
      navigator.pushNamedAndRemoveUntil(
        AppRouter.konsul,
        (route) => false,
      );
      return;
    }

    try {
      final conversationId = int.parse(id);
      debugPrint('[NotificationService] Navigating to chat with conversationId: $conversationId');
      
      // Navigate to chat screen with conversationId
      navigator.pushNamedAndRemoveUntil(
        AppRouter.home,
        (route) => false,
      );
      
      // Then navigate to chat screen
      navigator.pushNamed(
        AppRouter.konsulChat,
        arguments: KonsulChatArgs(conversationId: conversationId),
      );
    } catch (e) {
      debugPrint('[NotificationService] Error parsing conversationId: $e');
      // Fallback to konsul screen
      navigator.pushNamedAndRemoveUntil(
        AppRouter.konsul,
        (route) => false,
      );
    }
  }

  /// Handle health risk notification - navigate to History screen
  void _handleHealthRiskNotification(NavigatorState navigator, String? id) {
    debugPrint('[NotificationService] Navigating to history screen');
    
    // Navigate to home first, then to history
    navigator.pushNamedAndRemoveUntil(
      AppRouter.home,
      (route) => false,
    );
    
    // Then navigate to history screen
    navigator.pushNamed(AppRouter.history);
    
    // TODO: If id is provided, could navigate to specific health record detail
    // For now, just navigate to history screen
    if (id != null && id.isNotEmpty) {
      debugPrint('[NotificationService] Health risk record id: $id');
      // Future: Could navigate to specific record detail if route exists
    }
  }

  /// Handle assignment notification - navigate to appropriate screen
  void _handleAssignmentNotification(NavigatorState navigator, String? id) {
    debugPrint('[NotificationService] Navigating for assignment notification');
    
    // Navigate to home as default
    navigator.pushNamedAndRemoveUntil(
      AppRouter.home,
      (route) => false,
    );
    
    // TODO: Add specific navigation logic for assignment type if needed
    if (id != null && id.isNotEmpty) {
      debugPrint('[NotificationService] Assignment id: $id');
    }
  }

  /// Get FCM token
  Future<String?> getFcmToken() async {
    if (!_initialized) {
      await _initialize();
    }
    return _fcmToken;
  }

  /// Internal method untuk get FCM token
  Future<void> _getFcmToken() async {
    try {
      _fcmToken = await _messaging.getToken();
      debugPrint('[NotificationService] FCM Token obtained: ${_fcmToken?.substring(0, _fcmToken!.length > 50 ? 50 : _fcmToken!.length)}...');
      debugPrint('[NotificationService] Full FCM Token: $_fcmToken');

      // Listen untuk token refresh
      _messaging.onTokenRefresh.listen((newToken) async {
        _fcmToken = newToken;
        debugPrint('[NotificationService] FCM Token refreshed: ${newToken.substring(0, newToken.length > 50 ? 50 : newToken.length)}...');
        
        // Otomatis kirim token baru ke backend jika callback tersedia
        if (_onTokenRefreshCallback != null) {
          try {
            await _onTokenRefreshCallback!(newToken);
            debugPrint('[NotificationService] FCM Token automatically sent to backend after refresh');
          } catch (e) {
            debugPrint('[NotificationService] Error sending refreshed token to backend: $e');
          }
        } else {
          debugPrint('[NotificationService] Token refresh callback not set, skipping auto-update to backend');
        }
      });
    } catch (e) {
      debugPrint('[NotificationService] Error getting FCM token: $e');
    }
  }
  
  /// Get current FCM token (refresh if needed)
  Future<String?> getCurrentFcmToken() async {
    if (!_initialized) {
      await _initialize();
    }
    // Refresh token if null
    if (_fcmToken == null || _fcmToken!.isEmpty) {
      try {
        _fcmToken = await _messaging.getToken();
        debugPrint('[NotificationService] FCM Token refreshed: ${_fcmToken?.substring(0, _fcmToken != null && _fcmToken!.length > 50 ? 50 : _fcmToken?.length ?? 0)}...');
      } catch (e) {
        debugPrint('[NotificationService] Error refreshing FCM token: $e');
      }
    }
    return _fcmToken;
  }

  /// Subscribe to topic (optional)
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      debugPrint('[NotificationService] Subscribed to topic: $topic');
    } catch (e) {
      debugPrint('[NotificationService] Error subscribing to topic: $e');
    }
  }

  /// Unsubscribe from topic (optional)
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
      debugPrint('[NotificationService] Unsubscribed from topic: $topic');
    } catch (e) {
      debugPrint('[NotificationService] Error unsubscribing from topic: $e');
    }
  }

  /// Test method: Show a test notification to verify local notifications work
  Future<void> showTestNotification() async {
    try {
      debugPrint('[NotificationService] Showing test notification...');
      
      const androidDetails = AndroidNotificationDetails(
        'wellmom_notifications',
        'WellMom Notifications',
        channelDescription: 'Notifications for WellMom app',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
        playSound: true,
        enableVibration: true,
        // Icon kecil di status bar (logo WellMom)
        icon: '@mipmap/ic_notification',
        // Icon besar di panel notifikasi (logo WellMom berwarna)
        largeIcon: const DrawableResourceAndroidBitmap('ic_notification_large'),
        color: const Color(0xFFFF6B9D), // Match dengan backend color #FF6B9D
      );
      
      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      
      const notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );
      
      await _localNotifications.show(
        id: 999,
        title: 'Test Notifikasi',
        body: 'Ini adalah notifikasi test. Jika Anda melihat ini, berarti notifikasi lokal berfungsi dengan baik.',
        notificationDetails: notificationDetails,
        payload: 'test:notification',
      );
      
      debugPrint('[NotificationService] Test notification displayed successfully');
    } catch (e, stackTrace) {
      debugPrint('[NotificationService] Error showing test notification: $e');
      debugPrint('[NotificationService] Stack trace: $stackTrace');
    }
  }
}
