import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';

class ConfirmPuskesmasScreen extends ConsumerStatefulWidget {
  const ConfirmPuskesmasScreen({super.key});

  @override
  ConsumerState<ConfirmPuskesmasScreen> createState() =>
      _ConfirmPuskesmasScreenState();
}

class _ConfirmPuskesmasScreenState
    extends ConsumerState<ConfirmPuskesmasScreen> {
  Future<void> _handleCompleteRegistration() async {
    final puskesmasState = ref.read(puskesmasViewModelProvider);
    final selectedPuskesmas = puskesmasState.selectedPuskesmas;

    if (selectedPuskesmas == null) {
      ErrorSnackbar.show(context, 'Puskesmas belum dipilih');
      return;
    }

    // Get data from all ViewModels
    final registerState = ref.read(registerViewModelProvider);
    final medicalDataState = ref.read(medicalDataViewModelProvider);

    // Convert states to maps for the ViewModel
    final registerStateMap = {
      'namaLengkap': registerState.namaLengkap,
      'nik': registerState.nik,
      'tanggalLahir': registerState.tanggalLahir,
      'alamat': registerState.alamat,
      'jalan': registerState.jalan,
      'kelurahan': registerState.kelurahan,
      'kecamatan': registerState.kecamatan,
      'kota': registerState.kota,
      'provinsi': registerState.provinsi,
      'kodePos': registerState.kodePos,
      'latitude': registerState.latitude ?? registerState.currentPosition?.latitude,
      'longitude': registerState.longitude ?? registerState.currentPosition?.longitude,
      'email': registerState.email,
      'phone': registerState.phone,
      'password': registerState.password,
      'bloodType': registerState.bloodType,
      'emergencyContactName': registerState.emergencyContactName,
      'emergencyContactPhone': registerState.emergencyContactPhone,
      'emergencyContactRelation': registerState.emergencyContactRelation,
    };

    final medicalDataStateMap = {
      'hpht': medicalDataState.hpht,
      'hpl': medicalDataState.hpl,
      'usiaKehamilan': medicalDataState.usiaKehamilan,
      'kehamilanKe': medicalDataState.kehamilanKe,
      'jumlahAnak': medicalDataState.jumlahAnak,
      'jumlahKeguguran': medicalDataState.jumlahKeguguran,
      'jarakKehamilanTerakhir': medicalDataState.jarakKehamilanTerakhir,
      'darahTinggi': medicalDataState.darahTinggi,
      'diabetes': medicalDataState.diabetes,
      'anemia': medicalDataState.anemia,
      'penyakitJantung': medicalDataState.penyakitJantung,
      'asma': medicalDataState.asma,
      'penyakitGinjal': medicalDataState.penyakitGinjal,
      'tbcMalaria': medicalDataState.tbcMalaria,
      'komplikasiKehamilanSebelumnya': medicalDataState.komplikasiKehamilanSebelumnya,
      'pernahCaesar': medicalDataState.pernahCaesar,
      'pernahPerdarahanSaatHamil': medicalDataState.pernahPerdarahanSaatHamil,
      'dataSharingConsent': medicalDataState.dataSharingConsent,
      'whatsappConsent': medicalDataState.whatsappConsent,
    };

    // Execute complete registration
    final success = await ref
        .read(confirmRegistrationViewModelProvider.notifier)
        .completeRegistration(
          puskesmasId: selectedPuskesmas.puskesmas.id,
          registerState: registerStateMap,
          medicalDataState: medicalDataStateMap,
        );

    if (!mounted) return;

    if (success) {
      // Clear token yang disimpan saat registrasi
      // User perlu login dengan email/password yang sudah didaftarkan
      ref.read(authTokenProvider.notifier).state = null;
      try {
        await AuthStorageService.clearAccessToken();
      } catch (e) {
        debugPrint('Gagal clear token: $e');
      }
      
      // Show success message
      ErrorSnackbar.showSuccess(
        context,
        'Registrasi berhasil! Silakan login dengan email dan password Anda.',
      );
      
      // Navigate to login screen and clear all previous routes
      // This ensures user cannot go back to registration screens
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.loginIbuHamil,
        (route) => false, // Remove all previous routes
      );
    } else {
      // Show error message if registration or assign failed
      final confirmState = ref.read(confirmRegistrationViewModelProvider);
      if (confirmState.error != null) {
        ErrorSnackbar.show(context, confirmState.error!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final puskesmasState = ref.watch(puskesmasViewModelProvider);
    final confirmState = ref.watch(confirmRegistrationViewModelProvider);
    final selectedPuskesmas = puskesmasState.selectedPuskesmas;

    if (selectedPuskesmas == null) {
      // If no puskesmas selected, navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Konfirmasi',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress indicator
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
              child: Column(
                children: [
                  // Success icon
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      size: 48,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Title
                  const Text(
                    'Puskesmas Terpilih!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Description
                  Text(
                    'Fasilitas kesehatan berikut telah berhasil dipilih sebagai lokasi pemantauan Anda.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Puskesmas card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Icon
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.local_hospital,
                                color: AppColors.primaryBlue,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Name
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedPuskesmas.puskesmas.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Colors.green.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${selectedPuskesmas.distanceKm.toStringAsFixed(1)} km dari lokasi',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.green.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Terdaftar',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        // Address
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                selectedPuskesmas.address,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (selectedPuskesmas.puskesmas.phone != null) ...[
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 16,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                selectedPuskesmas.puskesmas.phone!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Info box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: AppColors.primaryBlue,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Bidan setempat akan menerima notifikasi pendaftaran Anda untuk koordinasi lebih lanjut.',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryBlue,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: Column(
              children: [
                CustomButton(
                  text: 'Selesai Registrasi →',
                  onPressed: confirmState.isSubmitting
                      ? null
                      : _handleCompleteRegistration,
                  isLoading: confirmState.isSubmitting,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ubah Pilihan Puskesmas',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
