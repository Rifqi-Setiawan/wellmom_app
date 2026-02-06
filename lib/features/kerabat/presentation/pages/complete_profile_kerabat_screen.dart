import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_dropdown.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_request.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';

const List<String> _relationOptions = [
  'Suami',
  'Ibu',
  'Ayah',
  'Saudara',
  'Teman',
  'Lainnya',
];

class CompleteProfileKerabatScreen extends ConsumerStatefulWidget {
  const CompleteProfileKerabatScreen({super.key, this.isEditMode = false});

  /// When true, used from Profile tab; on success pops with true instead of navigating to home.
  final bool isEditMode;

  @override
  ConsumerState<CompleteProfileKerabatScreen> createState() =>
      _CompleteProfileKerabatScreenState();
}

class _CompleteProfileKerabatScreenState
    extends ConsumerState<CompleteProfileKerabatScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedRelation;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRelation == null || _selectedRelation!.isEmpty) {
      ErrorSnackbar.show(context, 'Pilih hubungan dengan ibu hamil');
      return;
    }

    setState(() => _isSubmitting = true);
    final request = CompleteProfileRequest(
      fullName: _fullNameController.text.trim(),
      relationType: _selectedRelation!,
      phone: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
    );
    final repo = ref.read(kerabatRepositoryProvider);
    final result = await repo.completeProfile(request);
    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isSubmitting = false);
        ErrorSnackbar.show(context, failure.message);
      },
      (response) async {
        setState(() => _isSubmitting = false);
        
        // ✅ HANDLE TOKEN BARU - Jika phone diupdate, backend mengembalikan token baru
        final newToken = response.accessToken;
        if (newToken != null && newToken.trim().isNotEmpty) {
          final token = newToken.trim();
          
          debugPrint('[COMPLETE_PROFILE] Token baru diterima (panjang: ${token.length})');
          
          // 1. Update provider FIRST (untuk Dio interceptor)
          ref.read(authTokenProvider.notifier).state = token;
          debugPrint('[COMPLETE_PROFILE] Token disimpan ke provider');
          
          // 2. Simpan token baru ke persistent storage
          try {
            await AuthStorageService.saveAccessToken(token);
            debugPrint('[COMPLETE_PROFILE] Token disimpan ke storage (panjang: ${token.length})');
          } catch (e) {
            debugPrint('[COMPLETE_PROFILE] Gagal simpan token ke storage: $e');
          }
          
          // 3. Invalidate Dio agar pakai token baru
          ref.invalidate(dioProvider);
          debugPrint('[COMPLETE_PROFILE] Dio provider di-invalidate');
          
          // 4. PENTING: Force create new Dio instance sebelum delay
          final _ = ref.read(dioProvider);
          debugPrint('[COMPLETE_PROFILE] Dio instance baru dibuat');
          
          // 5. Delay lebih lama untuk memastikan token sync (300ms seperti rekomendasi backend)
          await Future.delayed(const Duration(milliseconds: 300));
          
          // 6. Verify token tersimpan dengan benar
          final verifyToken = await AuthStorageService.getAccessToken();
          final verifyProviderToken = ref.read(authTokenProvider);
          debugPrint('[COMPLETE_PROFILE] Verifikasi token - Storage: ${verifyToken?.length ?? 0}, Provider: ${verifyProviderToken?.length ?? 0}');
          
          if (verifyToken != token || verifyProviderToken != token) {
            debugPrint('[COMPLETE_PROFILE] WARNING - Token tidak sync!');
          }
        } else {
          debugPrint('[COMPLETE_PROFILE] Tidak ada token baru (phone tidak diupdate)');
        }
        
        ErrorSnackbar.showSuccess(context, 'Profil berhasil disimpan');
        if (widget.isEditMode) {
          Navigator.of(context).pop(true);
        } else {
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
    final ibuHamilName = ref.watch(kerabatIbuHamilNameProvider) ?? 'Ibu Hamil';

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.isEditMode ? 'Edit Profil' : 'Lengkapi Profil',
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.link_rounded,
                        color: AppColors.primaryBlue,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Anda terhubung dengan $ibuHamilName',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                CustomTextField(
                  controller: _fullNameController,
                  label: 'Nama Lengkap',
                  hintText: 'Contoh: Budi Santoso',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama lengkap harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomDropdown<String>(
                  label: 'Hubungan dengan Ibu Hamil',
                  hintText: 'Pilih hubungan',
                  value: _selectedRelation,
                  items: _relationOptions,
                  getLabel: (v) => v,
                  onChanged: (v) => setState(() => _selectedRelation = v),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Pilih hubungan' : null,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _phoneController,
                  label: 'Nomor Telepon (opsional)',
                  hintText: '+6281234567890',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'Simpan dan Lanjutkan',
                  onPressed: _isSubmitting ? null : _submit,
                  isLoading: _isSubmitting,
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
