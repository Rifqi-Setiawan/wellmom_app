import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/core/theme/app_theme.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WellMom',
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.welcome,
      debugShowCheckedModeBanner: false,
    );
  }
}

