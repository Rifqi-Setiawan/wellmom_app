import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/services/notification_service.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/core/theme/app_theme.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize date formatting
  await initializeDateFormatting('id_ID', null);
  
  // Initialize Firebase and Notification Service
  await NotificationService.initialize();
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // Load saved token from storage and set to provider
    _loadToken();
  }

  Future<void> _loadToken() async {
    final savedToken = await AuthStorageService.getAccessToken();
    if (savedToken != null && mounted) {
      ref.read(authTokenProvider.notifier).state = savedToken;
      print('App: Loaded token from storage, length: ${savedToken.length}');
      
      // Setup token refresh callback untuk otomatis kirim ke backend
      _setupTokenRefreshCallback();
      
      // Update FCM token to backend if user is already logged in
      _updateFcmTokenToBackend();
    }
  }

  /// Setup callback untuk otomatis kirim token ke backend saat token refresh
  void _setupTokenRefreshCallback() {
    NotificationService().setTokenRefreshCallback((String newToken) async {
      try {
        final authRepository = ref.read(authRepositoryProvider);
        final result = await authRepository.updateFcmToken(newToken);
        result.fold(
          (failure) {
            debugPrint('[App] Failed to update refreshed FCM token: ${failure.message}');
          },
          (_) {
            print("DEBUG: Refreshed FCM Token sent to backend: $newToken");
            debugPrint('[App] Refreshed FCM token updated successfully');
          },
        );
      } catch (e) {
        debugPrint('[App] Error updating refreshed FCM token: $e');
      }
    });
  }

  /// Update FCM token to backend when app opens (if user is logged in)
  Future<void> _updateFcmTokenToBackend() async {
    try {
      final fcmToken = await NotificationService().getCurrentFcmToken();
      if (fcmToken != null && fcmToken.isNotEmpty) {
        final authRepository = ref.read(authRepositoryProvider);
        final result = await authRepository.updateFcmToken(fcmToken);
        result.fold(
          (failure) {
            debugPrint('[App] Failed to update FCM token: ${failure.message}');
            // Don't show error to user, just log it
          },
          (_) {
            debugPrint('[App] FCM token updated successfully on app start');
          },
        );
      } else {
        debugPrint('[App] FCM token is null or empty, skipping update');
      }
    } catch (e) {
      debugPrint('[App] Error updating FCM token: $e');
      // Don't show error to user, just log it
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WellMom',
      theme: AppTheme.lightTheme,
      navigatorKey: AppRouter.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.welcome,
      debugShowCheckedModeBanner: false,
    );
  }
}

