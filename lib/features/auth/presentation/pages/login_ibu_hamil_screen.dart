import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/constants/app_strings.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';

class LoginIbuHamilScreen extends ConsumerStatefulWidget {
  const LoginIbuHamilScreen({super.key});

  @override
  ConsumerState<LoginIbuHamilScreen> createState() =>
      _LoginIbuHamilScreenState();
}

class _LoginIbuHamilScreenState extends ConsumerState<LoginIbuHamilScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      // Update ViewModel with current form values
      ref.read(loginViewModelProvider.notifier)
          .updateEmail(_emailController.text.trim());
      ref.read(loginViewModelProvider.notifier)
          .updatePassword(_passwordController.text);

      // Submit login
      final success = await ref.read(loginViewModelProvider.notifier).login();

      if (!mounted) return;

      if (success) {
        final state = ref.read(loginViewModelProvider);
        if (state.loginResponse != null) {
          // TODO: Save token to secure storage
          // Show success message
          ErrorSnackbar.showSuccess(
            context,
            'Login berhasil! Selamat datang, ${state.loginResponse!.namaLengkap}',
          );
          
          // Navigate to home screen and clear all previous routes
          // This ensures user cannot go back to login screen
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.home,
            (route) => false, // Remove all previous routes
          );
        }
      } else {
        final state = ref.read(loginViewModelProvider);
        if (state.error != null) {
          ErrorSnackbar.show(context, state.error!);
        }
      }
    }
  }

  Future<void> _handleGoogleLogin() async {
    final success =
        await ref.read(loginViewModelProvider.notifier).loginWithGoogle();

    if (!mounted) return;

    if (!success) {
      final state = ref.read(loginViewModelProvider);
      if (state.error != null) {
        ErrorSnackbar.show(context, state.error!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue gradient header at top
          Positioned.fill(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.gradientStart, AppColors.gradientEnd],
                ),
              ),
            ),
          ),
          // Top content inside header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      AppStrings.pantauKesehatanIbu,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: AppColors.darkBlue,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppStrings.masukDanNikmati,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // White card with curved top
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1F000000),
                    blurRadius: 12,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Error message display
                      if (state.error != null) ...[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red.shade200),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.red.shade700,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  state.error!,
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      // Email field
                      CustomTextField(
                        label: 'Email',
                        hintText: 'Masukkan email Anda',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          ref.read(loginViewModelProvider.notifier)
                              .updateEmail(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email harus diisi';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Password field
                      CustomTextField(
                        label: AppStrings.kataSandi,
                        hintText: '••••••••',
                        controller: _passwordController,
                        obscureText: state.isObscured,
                        onChanged: (value) {
                          ref.read(loginViewModelProvider.notifier)
                              .updatePassword(value);
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.isObscured
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                          ),
                          onPressed: () {
                            ref.read(loginViewModelProvider.notifier)
                                .togglePasswordVisibility();
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password harus diisi';
                          }
                          if (value.length < 8) {
                            return 'Password minimal 8 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppStrings.minimalKarakter,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textLight,
                            ),
                      ),
                      const SizedBox(height: 20),
                      // Login button
                      CustomButton(
                        text: 'Masuk',
                        onPressed: state.isLoading ? null : _handleLogin,
                        isLoading: state.isLoading,
                      ),
                      const SizedBox(height: 14),
                      // Google login button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: state.isLoading ? null : _handleGoogleLogin,
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide(color: Colors.grey.shade300),
                            foregroundColor: AppColors.textDark,
                            backgroundColor: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/google_logo.png',
                                height: 18,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                AppStrings.masukDenganGoogle,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Register link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.belumPunyaAkun,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textLight,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/register-ibu-hamil');
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primaryBlue,
                            ),
                            child: const Text(
                              AppStrings.daftarDisini,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
