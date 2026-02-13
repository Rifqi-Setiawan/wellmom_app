import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/features/chat/presentation/pages/konsul_chat_screen.dart';

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();

  final FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();

  const androidSettings = AndroidInitializationSettings('@mipmap/ic_notification');
  const iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);

  await localNotifications.initialize(
    settings: initSettings,
    onDidReceiveNotificationResponse: (_) {},
  );

  const androidChannel = AndroidNotificationChannel(
    'wellmom_notifications',
    'WellMom Notifications',
    description: 'Notifikasi WellMom',
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
  );

  await localNotifications
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel);

  final notification = message.notification;
  String? title;
  String? body;

  if (notification != null) {
    title = notification.title;
    body = notification.body;
  } else if (message.data.isNotEmpty) {
    title = message.data['title'] as String? ??
        message.data['notification_title'] as String? ??
        'WellMom';
    body = message.data['body'] as String? ??
        message.data['notification_body'] as String? ??
        message.data['message'] as String? ??
        'Anda memiliki notifikasi baru';
  }

  if (title != null && body != null) {
    const androidDetails = AndroidNotificationDetails(
      'wellmom_notifications',
      'WellMom Notifications',
      channelDescription: 'Notifikasi WellMom',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      playSound: true,
      enableVibration: true,
      icon: '@mipmap/ic_notification',
      largeIcon: DrawableResourceAndroidBitmap('ic_notification_large'),
      color: Color(0xFFFF6B9D),
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
    } catch (_) {}
  }
}

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
  Future<void> Function(String token)? _onTokenRefreshCallback;

  FirebaseMessaging get _messaging {
    if (_firebaseMessaging == null) {
      throw StateError('NotificationService not initialized. Call initialize() first.');
    }
    return _firebaseMessaging!;
  }

  void setTokenRefreshCallback(Future<void> Function(String token) callback) {
    _onTokenRefreshCallback = callback;
  }

  static Future<void> initialize() async {
    await _instance._initialize();
  }

  Future<void> _initialize() async {
    if (_initialized) return;

    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }

      _firebaseMessaging = FirebaseMessaging.instance;

      await _firebaseMessaging!.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      await _initializeLocalNotifications();
      await _requestPermission();

      _onMessageSubscription = FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) => _onForegroundMessage(message),
        onError: (error) => debugPrint('Notification stream error: $error'),
        cancelOnError: false,
      );

      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
      setupInteractedMessage();
      await _getFcmToken();

      _initialized = true;
    } catch (e) {
      debugPrint('NotificationService init error: $e');
    }
  }

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
    );

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      await androidPlugin.requestNotificationsPermission();
    }

    const androidChannel = AndroidNotificationChannel(
      'wellmom_notifications',
      'WellMom Notifications',
      description: 'Notifikasi WellMom',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    await androidPlugin?.createNotificationChannel(androidChannel);
  }

  Future<void> _requestPermission() async {
    try {
      await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );
    } catch (_) {}
  }

  Future<bool> requestNotificationPermission() async {
    try {
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      final androidPlugin = _localNotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin != null) {
        await androidPlugin.requestNotificationsPermission();
      }

      return settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;
    } catch (_) {
      return false;
    }
  }

  Future<AuthorizationStatus> getNotificationPermissionStatus() async {
    try {
      final settings = await _messaging.getNotificationSettings();
      return settings.authorizationStatus;
    } catch (_) {
      return AuthorizationStatus.notDetermined;
    }
  }

  void _onForegroundMessage(RemoteMessage message) {
    _showLocalNotification(message);
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    String? title;
    String? body;

    if (notification != null) {
      title = notification.title;
      body = notification.body;
    } else if (message.data.isNotEmpty) {
      title = message.data['title'] as String? ??
          message.data['notification_title'] as String? ??
          'WellMom';
      body = message.data['body'] as String? ??
          message.data['notification_body'] as String? ??
          message.data['message'] as String? ??
          message.data['content'] as String? ??
          'Anda memiliki notifikasi baru';
    }

    if (title == null || body == null) return;

    const androidDetails = AndroidNotificationDetails(
      'wellmom_notifications',
      'WellMom Notifications',
      channelDescription: 'Notifikasi WellMom',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      playSound: true,
      enableVibration: true,
      icon: '@mipmap/ic_notification',
      largeIcon: DrawableResourceAndroidBitmap('ic_notification_large'),
      color: Color(0xFFFF6B9D),
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

    final payload = message.data.isNotEmpty
        ? message.data.entries.map((e) => '${e.key}:${e.value}').join('|')
        : '';

    try {
      await _localNotifications.show(
        id: message.hashCode,
        title: title,
        body: body,
        notificationDetails: notificationDetails,
        payload: payload,
      );
    } catch (_) {}
  }

  void setupInteractedMessage() {
    _messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) _handleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message);
    });
  }

  void _onNotificationTapped(NotificationResponse response) {
    if (response.payload != null && response.payload!.isNotEmpty) {
      try {
        final Map<String, String> data = {};
        final pairs = response.payload!.split('|');
        for (final pair in pairs) {
          final parts = pair.split(':');
          if (parts.length == 2) {
            data[parts[0]] = parts[1];
          }
        }

        if (data.isNotEmpty) {
          final mockMessage = RemoteMessage(
            messageId: response.id?.toString(),
            data: data,
          );
          _handleMessage(mockMessage);
        }
      } catch (_) {
        final navigator = AppRouter.navigatorKey.currentState;
        if (navigator != null) {
          navigator.pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
        }
      }
    }
  }

  void _handleMessage(RemoteMessage message) {
    final data = message.data;
    final type = data['type'] as String?;
    final id = data['id'] as String?;

    if (type == null || type.isEmpty) return;

    final navigator = AppRouter.navigatorKey.currentState;
    if (navigator == null) {
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
        _handleAssignmentNotification(navigator);
        break;
      default:
        navigator.pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
    }
  }

  void _handleChatNotification(NavigatorState navigator, String? id) {
    if (id == null || id.isEmpty) {
      navigator.pushNamedAndRemoveUntil(AppRouter.konsul, (route) => false);
      return;
    }

    try {
      final conversationId = int.parse(id);
      navigator.pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
      navigator.pushNamed(
        AppRouter.konsulChat,
        arguments: KonsulChatArgs(conversationId: conversationId),
      );
    } catch (_) {
      navigator.pushNamedAndRemoveUntil(AppRouter.konsul, (route) => false);
    }
  }

  void _handleHealthRiskNotification(NavigatorState navigator, String? id) {
    navigator.pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
    navigator.pushNamed(AppRouter.history);
  }

  void _handleAssignmentNotification(NavigatorState navigator) {
    navigator.pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
  }

  Future<String?> getFcmToken() async {
    if (!_initialized) await _initialize();
    return _fcmToken;
  }

  Future<void> _getFcmToken() async {
    try {
      _fcmToken = await _messaging.getToken();

      _messaging.onTokenRefresh.listen((newToken) async {
        _fcmToken = newToken;
        if (_onTokenRefreshCallback != null) {
          try {
            await _onTokenRefreshCallback!(newToken);
          } catch (_) {}
        }
      });
    } catch (_) {}
  }

  Future<String?> getCurrentFcmToken() async {
    if (!_initialized) await _initialize();
    if (_fcmToken == null || _fcmToken!.isEmpty) {
      try {
        _fcmToken = await _messaging.getToken();
      } catch (_) {}
    }
    return _fcmToken;
  }

  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
    } catch (_) {}
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
    } catch (_) {}
  }

  Future<void> showTestNotification() async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'wellmom_notifications',
        'WellMom Notifications',
        channelDescription: 'Notifikasi WellMom',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
        playSound: true,
        enableVibration: true,
        icon: '@mipmap/ic_notification',
        largeIcon: DrawableResourceAndroidBitmap('ic_notification_large'),
        color: Color(0xFFFF6B9D),
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
        body: 'Notifikasi berfungsi dengan baik.',
        notificationDetails: notificationDetails,
        payload: 'test:notification',
      );
    } catch (_) {}
  }
}
