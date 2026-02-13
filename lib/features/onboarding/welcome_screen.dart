import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/constants/app_strings.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  bool _hasCheckedAuth = false;

  @override
  void initState() {
    super.initState();
    // Check authentication status when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndRedirect();
    });
  }

  Future<void> _checkAuthAndRedirect() async {
    if (_hasCheckedAuth) return;
    _hasCheckedAuth = true;

    try {
      // Check if token exists
      final token = await AuthStorageService.getAccessToken();
      if (token == null || token.isEmpty) {
        // No token, stay on welcome screen
        return;
      }

      // Set token to provider (already set in main.dart, but ensure it's set)
      if (mounted) {
        final currentToken = ref.read(authTokenProvider);
        if (currentToken == null || currentToken.isEmpty) {
          ref.read(authTokenProvider.notifier).state = token;
        }
      }

      // Try to determine user type by checking ibu hamil endpoint first
      try {
        final dio = ref.read(dioProvider);
        final response = await dio.get('/ibu-hamil/me');
        if (response.statusCode == 200 && mounted) {
          // User is ibu hamil, redirect to home
          Navigator.of(context).pushReplacementNamed(AppRouter.home);
          return;
        }
      } catch (e) {
        // Not ibu hamil or error, try kerabat endpoint
        try {
          final kerabatDataSource = ref.read(kerabatRemoteDataSourceProvider);
          final kerabatMe = await kerabatDataSource.getKerabatMe();
          if (mounted) {
            // User is kerabat, set providers and redirect to kerabat home
            ref.read(kerabatIdProvider.notifier).state = kerabatMe.id;
            ref.read(kerabatIbuHamilIdProvider.notifier).state = kerabatMe.ibuHamilId;
            ref.read(kerabatIbuHamilNameProvider.notifier).state = kerabatMe.ibuHamilName;
            
            Navigator.of(context).pushReplacementNamed(AppRouter.kerabatHome);
            return;
          }
        } catch (_) {
          await AuthStorageService.clearAccessToken();
          if (mounted) {
            ref.read(authTokenProvider.notifier).state = null;
          }
        }
      }
    } catch (_) {
      // On error, stay on welcome screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background image with constrained height to reduce scale
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/onboarding_pregnant_bg.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryBlue.withOpacity(0.30),
                              AppColors.primaryBlue.withOpacity(0.24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          // Bottom card with rounded top
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 12,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.pantauKesehatanIbu,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w800,
                            height: 1.25,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppStrings.masukDanNikmati,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textLight,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.loginIbuHamil);
                        },
                        child: const Text(AppStrings.masukSebagaiIbuHamil),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkBlueButton,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRouter.loginKerabat);
                        },
                        child: const Text(AppStrings.masukSebagaiSuamiKerabat),
                      ),
                    ),
                    SizedBox(height: media.padding.bottom),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
