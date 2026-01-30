import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_dropdown.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_request.dart';
import 'package:wellmom_app/features/kerabat/domain/repositories/kerabat_repository.dart';
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
      (_) {
        setState(() => _isSubmitting = false);
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
