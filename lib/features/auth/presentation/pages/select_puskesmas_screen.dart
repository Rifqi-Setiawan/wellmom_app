import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/auth/data/models/puskesmas_model.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';

class SelectPuskesmasScreen extends ConsumerStatefulWidget {
  const SelectPuskesmasScreen({super.key});

  @override
  ConsumerState<SelectPuskesmasScreen> createState() =>
      _SelectPuskesmasScreenState();
}

class _SelectPuskesmasScreenState
    extends ConsumerState<SelectPuskesmasScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch nearest puskesmas when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchNearestPuskesmas();
    });
  }

  Future<void> _fetchNearestPuskesmas() async {
    final registerState = ref.read(registerViewModelProvider);
    
    // Log location information for debugging
    print('═══════════════════════════════════════════════════════════');
    print('📍 Fetching Nearest Puskesmas');
    print('   currentPosition: ${registerState.currentPosition}');
    print('   latitude: ${registerState.latitude}');
    print('   longitude: ${registerState.longitude}');
    print('   currentPosition?.latitude: ${registerState.currentPosition?.latitude}');
    print('   currentPosition?.longitude: ${registerState.currentPosition?.longitude}');
    print('═══════════════════════════════════════════════════════════');
    
    // Determine which location to use
    double? finalLatitude;
    double? finalLongitude;
    
    if (registerState.currentPosition != null) {
      finalLatitude = registerState.currentPosition!.latitude;
      finalLongitude = registerState.currentPosition!.longitude;
    } else if (registerState.latitude != null && registerState.longitude != null) {
      finalLatitude = registerState.latitude;
      finalLongitude = registerState.longitude;
    }
    
    if (finalLatitude != null && finalLongitude != null) {
      print('✅ Using location: lat=$finalLatitude, lng=$finalLongitude');
      await ref.read(puskesmasViewModelProvider.notifier).fetchNearestPuskesmas(
            finalLatitude,
            finalLongitude,
          );
    } else {
      print('❌ No valid location found');
      if (mounted) {
        ErrorSnackbar.show(
          context,
          'Lokasi tidak tersedia. Silakan kembali ke halaman sebelumnya.',
        );
      }
    }
  }

  void _selectPuskesmas(NearestPuskesmasModel puskesmas) {
    ref.read(puskesmasViewModelProvider.notifier).selectPuskesmas(puskesmas);
    // Navigate to confirmation screen
    Navigator.of(context).pushNamed(AppRouter.confirmPuskesmas);
  }

  @override
  Widget build(BuildContext context) {
    final puskesmasState = ref.watch(puskesmasViewModelProvider);

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
          'Select Puskesmas',
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
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section header
                  const Text(
                    'Puskesmas Terdekat',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Silakan pilih Puskesmas yang paling dekat dengan lokasi tempat tinggal Anda untuk pemantauan rutin.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Loading state
                  if (puskesmasState.isLoading)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  // Error state
                  else if (puskesmasState.error != null)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Colors.red.shade300,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              puskesmasState.error!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              text: 'Coba Lagi',
                              onPressed: _fetchNearestPuskesmas,
                            ),
                          ],
                        ),
                      ),
                    )
                  // Empty state
                  else if (puskesmasState.nearestPuskesmas.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.location_off,
                              size: 48,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Tidak ada puskesmas terdekat ditemukan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  // List of puskesmas
                  else
                    ...puskesmasState.nearestPuskesmas.map((puskesmas) {
                      final isSelected =
                          puskesmasState.selectedPuskesmas?.puskesmas.id ==
                              puskesmas.puskesmas.id;
                      return _buildPuskesmasCard(
                        puskesmas: puskesmas,
                        isSelected: isSelected,
                        onTap: () => _selectPuskesmas(puskesmas),
                      );
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPuskesmasCard({
    required NearestPuskesmasModel puskesmas,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? AppColors.primaryBlue
              : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.primaryBlue,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                // Name and distance
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        puskesmas.puskesmas.name,
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
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${puskesmas.distanceKm.toStringAsFixed(1)} km',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Address
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              puskesmas.address,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),
          ),
          // Select button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected
                      ? AppColors.primaryBlue
                      : Colors.white,
                  foregroundColor: isSelected
                      ? Colors.white
                      : AppColors.primaryBlue,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: isSelected
                          ? AppColors.primaryBlue
                          : AppColors.primaryBlue,
                      ),
                    ),
                  ),
                child: const Text(
                  'Pilih',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
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
