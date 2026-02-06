import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';

/// Valid: 8 karakter (huruf, angka, atau underscore)
bool _isValidInviteCode(String? value) {
  if (value == null || value.isEmpty) return false;
  final trimmed = value.trim().toUpperCase();
  if (trimmed.length != 8) return false;
  return RegExp(r'^[A-Z0-9_]{8}$').hasMatch(trimmed);
}

class LoginKerabatScreen extends ConsumerStatefulWidget {
  const LoginKerabatScreen({super.key});

  @override
  ConsumerState<LoginKerabatScreen> createState() => _LoginKerabatScreenState();
}

class _LoginKerabatScreenState extends ConsumerState<LoginKerabatScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final code = _codeController.text.trim().toUpperCase();
    if (!_isValidInviteCode(code)) {
      ErrorSnackbar.show(context, 'Kode undangan harus 8 karakter (huruf, angka, atau underscore)');
      return;
    }

    setState(() => _isLoading = true);
    final repo = ref.read(kerabatRepositoryProvider);
    final result = await repo.loginWithInviteCode(code);
    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isLoading = false);
        ErrorSnackbar.show(context, failure.message);
      },
      (response) async {
        setState(() => _isLoading = false);

        final token = response.accessToken.trim();
        if (token.isEmpty) {
          ErrorSnackbar.show(context, 'Token tidak diterima dari server. Coba lagi.');
          return;
        }

        debugPrint('[LOGIN_KERABAT] Token diterima (panjang: ${token.length})');
        
        // 1. Simpan access_token ke provider FIRST (dipakai Dio interceptor untuk semua request API)
        ref.read(authTokenProvider.notifier).state = token;
        debugPrint('[LOGIN_KERABAT] Token disimpan ke provider');

        // 2. Simpan token ke persistent storage (agar tetap dipakai setelah app restart)
        try {
          await AuthStorageService.saveAccessToken(token);
          debugPrint('[LOGIN_KERABAT] Token disimpan ke storage (panjang: ${token.length})');
        } catch (e) {
          debugPrint('[LOGIN_KERABAT] Gagal simpan token ke storage: $e');
        }

        // 3. Agar request berikutnya pakai token baru, invalidate Dio (instance baru akan baca provider)
        ref.invalidate(dioProvider);
        debugPrint('[LOGIN_KERABAT] Dio provider di-invalidate');
        
        // 4. PENTING: Force create new Dio instance sebelum delay
        final _ = ref.read(dioProvider);
        debugPrint('[LOGIN_KERABAT] Dio instance baru dibuat');
        
        // 5. Delay lebih lama untuk memastikan token sync (300ms seperti rekomendasi backend)
        await Future.delayed(const Duration(milliseconds: 300));
        
        // 6. Verify token tersimpan dengan benar
        final verifyToken = await AuthStorageService.getAccessToken();
        final verifyProviderToken = ref.read(authTokenProvider);
        debugPrint('[LOGIN_KERABAT] Verifikasi token - Storage: ${verifyToken?.length ?? 0}, Provider: ${verifyProviderToken?.length ?? 0}');

        // 4. Simpan data kerabat untuk dipakai di complete profile / dashboard
        ref.read(kerabatIdProvider.notifier).state = response.kerabatId;
        ref.read(kerabatIbuHamilIdProvider.notifier).state = response.ibuHamilId;
        ref.read(kerabatIbuHamilNameProvider.notifier).state = response.ibuHamilName;

        if (!mounted) return;
        if (response.requiresProfileCompletion) {
          Navigator.of(context).pushReplacementNamed(
            AppRouter.completeProfileKerabat,
          );
        } else {
          // Sudah punya profil, bisa ke kerabat home
          ErrorSnackbar.showSuccess(
            context,
            'Berhasil masuk. Terhubung dengan ${response.ibuHamilName}',
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.kerabatHome,
            (route) => false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Login sebagai Kerabat',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.vpn_key_rounded,
                      size: 40,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Masukkan kode undangan dari ibu hamil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  controller: _codeController,
                  label: 'Kode Undangan',
                  hintText: 'Contoh: LLJWK_TO',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Kode undangan harus diisi';
                    }
                    final trimmed = value.trim();
                    if (trimmed.length != 8) {
                      return 'Kode harus 8 karakter';
                    }
                    if (!RegExp(r'^[A-Za-z0-9_]+$').hasMatch(trimmed)) {
                      return 'Kode hanya huruf, angka, atau underscore (_)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Masuk',
                  onPressed: _isLoading ? null : _handleLogin,
                  isLoading: _isLoading,
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

