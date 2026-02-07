import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/features/chat/presentation/pages/konsul_chat_screen.dart';

/// Top-level function untuk background message handler (harus top-level)
@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('[FCM] Background message received: ${message.messageId}');
  debugPrint('[FCM] Title: ${message.notification?.title}');
  debugPrint('[FCM] Body: ${message.notification?.body}');
  debugPrint('[FCM] Data: ${message.data}');
}

/// Service untuk menangani Firebase Cloud Messaging (FCM) dan Local Notifications
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  String? _fcmToken;

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

      // Initialize Local Notifications
      await _initializeLocalNotifications();

      // Request permission untuk notifications
      await _requestPermission();

      // Setup foreground message handler
      FirebaseMessaging.onMessage.listen(_onForegroundMessage);

      // Setup background message handler
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

      // Setup notification tap handler (ketika user tap notifikasi)
      setupInteractedMessage();

      // Get FCM token
      await _getFcmToken();

      _initialized = true;
      debugPrint('[NotificationService] Initialization complete');
    } catch (e) {
      debugPrint('[NotificationService] Initialization error: $e');
    }
  }

  /// Initialize Local Notifications
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
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
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create notification channel untuk Android
    const androidChannel = AndroidNotificationChannel(
      'wellmom_channel',
      'WellMom Notifications',
      description: 'Notifications for WellMom app',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    debugPrint('[NotificationService] Local notifications initialized');
  }

  /// Request permission untuk notifications
  Future<void> _requestPermission() async {
    try {
      final settings = await _firebaseMessaging.requestPermission(
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

  /// Handle foreground messages (ketika app sedang dibuka)
  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('[FCM] Foreground message received: ${message.messageId}');
    debugPrint('[FCM] Title: ${message.notification?.title}');
    debugPrint('[FCM] Body: ${message.notification?.body}');
    debugPrint('[FCM] Data: ${message.data}');

    // Tampilkan local notification
    _showLocalNotification(message);
  }

  /// Show local notification
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'wellmom_channel',
      'WellMom Notifications',
      channelDescription: 'Notifications for WellMom app',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      playSound: true,
      enableVibration: true,
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
    final payload = message.data.toString();
    
    await _localNotifications.show(
      message.hashCode,
      notification.title,
      notification.body,
      notificationDetails,
      payload: payload,
    );
  }

  /// Setup handlers for notification interactions (tap/opened)
  /// Handles both terminated state and background/foreground state
  void setupInteractedMessage() {
    // Handle notification when app was opened from terminated state
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
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
        // Payload is stored as data.toString(), so we need to reconstruct it
        // For now, we'll handle it through the RemoteMessage data structure
        // This is a limitation - we need to store the actual data structure
        // For better handling, consider using a different approach or store data in a more parseable format
        debugPrint('[NotificationService] Payload received: ${response.payload}');
        // Note: Local notification payload handling is limited
        // The main navigation should be handled via RemoteMessage handlers
      } catch (e) {
        debugPrint('[NotificationService] Error parsing notification payload: $e');
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
      _fcmToken = await _firebaseMessaging.getToken();
      debugPrint('[NotificationService] FCM Token obtained: ${_fcmToken?.substring(0, _fcmToken!.length > 50 ? 50 : _fcmToken!.length)}...');

      // Listen untuk token refresh
      _firebaseMessaging.onTokenRefresh.listen((newToken) {
        _fcmToken = newToken;
        debugPrint('[NotificationService] FCM Token refreshed: ${newToken.substring(0, newToken.length > 50 ? 50 : newToken.length)}...');
        // Token refresh akan di-handle oleh caller yang memanggil updateFcmToken
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
        _fcmToken = await _firebaseMessaging.getToken();
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
      await _firebaseMessaging.subscribeToTopic(topic);
      debugPrint('[NotificationService] Subscribed to topic: $topic');
    } catch (e) {
      debugPrint('[NotificationService] Error subscribing to topic: $e');
    }
  }

  /// Unsubscribe from topic (optional)
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      debugPrint('[NotificationService] Unsubscribed from topic: $topic');
    } catch (e) {
      debugPrint('[NotificationService] Error unsubscribing from topic: $e');
    }
  }
}
