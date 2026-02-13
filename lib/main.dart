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
  await initializeDateFormatting('id_ID', null);
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
    _setupTokenRefreshCallback();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final savedToken = await AuthStorageService.getAccessToken();
    if (savedToken != null && mounted) {
      ref.read(authTokenProvider.notifier).state = savedToken;
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) _updateFcmTokenToBackend();
      });
    }
  }

  void _setupTokenRefreshCallback() {
    NotificationService().setTokenRefreshCallback((String newToken) async {
      try {
        final authRepository = ref.read(authRepositoryProvider);
        final result = await authRepository.updateFcmToken(newToken);
        result.fold(
          (failure) => debugPrint('Failed to update refreshed FCM token: ${failure.message}'),
          (_) {},
        );
      } catch (e) {
        debugPrint('Error updating refreshed FCM token: $e');
      }
    });
  }

  Future<void> _updateFcmTokenToBackend() async {
    try {
      final fcmToken = await NotificationService().getCurrentFcmToken();
      if (fcmToken != null && fcmToken.isNotEmpty) {
        final authRepository = ref.read(authRepositoryProvider);
        await authRepository.updateFcmToken(fcmToken);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WellMom',
      theme: AppTheme.lightTheme,
      navigatorKey: AppRouter.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
