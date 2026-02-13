import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/models/wilayah_indonesia.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_dropdown.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/home/presentation/providers/home_providers.dart';
import 'package:wellmom_app/features/profile/presentation/providers/profile_providers.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaLengkapController = TextEditingController();
  final _nikController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _addressController = TextEditingController();
  final _jalanController = TextEditingController();
  final _kelurahanController = TextEditingController();

  Provinsi? _selectedProvinsi;
  KotaKabupaten? _selectedKota;
  Kecamatan? _selectedKecamatan;

  @override
  void dispose() {
    _namaLengkapController.dispose();
    _nikController.dispose();
    _tanggalLahirController.dispose();
    _addressController.dispose();
    _jalanController.dispose();
    _kelurahanController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadProfile();
      // Delay sync untuk memastikan state sudah siap
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          _syncControllersWithState();
        }
      });
    });
  }

  void _loadProfile() {
    ref.read(editProfileViewModelProvider.notifier).loadProfile();
  }

  void _syncControllersWithState() {
    try {
      final state = ref.read(editProfileViewModelProvider);
      
      // Guard: pastikan controllers sudah initialized
      if (!mounted) return;
      
      _namaLengkapController.text = state.namaLengkap;
      _nikController.text = state.nik;
      _tanggalLahirController.text = state.dateOfBirth != null
          ? DateFormatter.formatDate(state.dateOfBirth!)
          : '';
      _jalanController.text = state.jalan;
      _kelurahanController.text = state.kelurahan;

      // Sync dropdowns - only if item exists in list
      if (state.selectedProvinsi != null && state.provinces.contains(state.selectedProvinsi)) {
        _selectedProvinsi = state.selectedProvinsi;
      } else {
        _selectedProvinsi = null;
      }
      
      if (state.selectedKota != null && state.regencies.contains(state.selectedKota)) {
        _selectedKota = state.selectedKota;
      } else {
        _selectedKota = null;
      }
      
      if (state.selectedKecamatan != null && state.districts.contains(state.selectedKecamatan)) {
        _selectedKecamatan = state.selectedKecamatan;
      } else {
        _selectedKecamatan = null;
      }
    } catch (_) {
      // State not ready yet
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final state = ref.read(editProfileViewModelProvider);
    final initialDate = state.dateOfBirth ?? DateTime(1990, 1, 1);
    final firstDate = DateTime(1950);
    final lastDate = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: 'Pilih Tanggal Lahir',
      cancelText: 'Batal',
      confirmText: 'Pilih',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBlue,
              onPrimary: Colors.white,
              onSurface: AppColors.textDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      ref.read(editProfileViewModelProvider.notifier).updateDateOfBirth(picked);
      setState(() {
        _tanggalLahirController.text = DateFormatter.formatDate(picked);
      });
    }
  }

  /// Normalize region name for better matching (removes prefixes/suffixes)
  String _normalizeRegionName(String name) {
    return name
        .toLowerCase()
        .replaceAll(RegExp(r'^(kabupaten|kota|kab\.?|kab|regency|city)\s+', caseSensitive: false), '')
        .replaceAll(RegExp(r'\s+(kabupaten|kota|kab\.?|regency|city)$', caseSensitive: false), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), ' ');
  }

  bool _isRegionMatch(String name1, String name2) {
    if (name1.isEmpty || name2.isEmpty) return false;

    final normalized1 = _normalizeRegionName(name1);
    final normalized2 = _normalizeRegionName(name2);

    if (normalized1 == normalized2) return true;

    if (normalized1.contains(normalized2) || normalized2.contains(normalized1)) {
      return true;
    }

    final noSpace1 = normalized1.replaceAll(' ', '');
    final noSpace2 = normalized2.replaceAll(' ', '');
    if (noSpace1.contains(noSpace2) || noSpace2.contains(noSpace1)) {
      return true;
    }

    final clean1 = normalized1.replaceAll(RegExp(r'[^\w]'), '');
    final clean2 = normalized2.replaceAll(RegExp(r'[^\w]'), '');
    if (clean1.contains(clean2) || clean2.contains(clean1)) {
      return true;
    }

    if (normalized1.length >= 3 && normalized2.length >= 3) {
      if (normalized1.substring(0, normalized1.length > 5 ? 5 : normalized1.length) == 
          normalized2.substring(0, normalized2.length > 5 ? 5 : normalized2.length)) {
        return true;
      }
    }

    return false;
  }

  Future<void> _handleDetectLocation() async {
    final viewModel = ref.read(editProfileViewModelProvider.notifier);
    await viewModel.getCurrentLocation();

    if (!mounted) return;

    final state = ref.read(editProfileViewModelProvider);
    if (state.locationError != null) {
      ErrorSnackbar.show(context, state.locationError!);
      return;
    }

    // Update text fields
    setState(() {
      _jalanController.text = state.jalan;
      _kelurahanController.text = state.kelurahan;
    });

    // Try to match provinsi from geocoded address
    if (state.provinsiName.isNotEmpty && state.provinces.isNotEmpty) {
      Provinsi? matchedProvinsi;
      try {
        matchedProvinsi = state.provinces.firstWhere(
          (p) => _isRegionMatch(p.name, state.provinsiName),
        );
      } catch (_) {
        // Province not found in list
      }

      if (matchedProvinsi != null) {
        setState(() {
          _selectedProvinsi = matchedProvinsi;
        });
        await viewModel.updateProvinsi(matchedProvinsi.name, matchedProvinsi.id);

        // Wait for regencies to load (with retry if needed)
        int retryCount = 0;
        const maxRetries = 5;
        while (retryCount < maxRetries) {
          await Future.delayed(const Duration(milliseconds: 500));
          final tempState = ref.read(editProfileViewModelProvider);
          if (tempState.regencies.isNotEmpty || !tempState.isLoadingRegencies) {
            break;
          }
          retryCount++;
        }

        // Try to match kota
        final stateAfterRegencies = ref.read(editProfileViewModelProvider);
        if (stateAfterRegencies.kotaName.isNotEmpty &&
            stateAfterRegencies.regencies.isNotEmpty) {
          try {
            final matchedKota = stateAfterRegencies.regencies.firstWhere(
              (k) => _isRegionMatch(k.name, stateAfterRegencies.kotaName),
            );
            setState(() {
              _selectedKota = matchedKota;
            });
            await viewModel.updateKota(matchedKota.name, matchedKota.id);

            // Wait for districts to load (with retry if needed)
            retryCount = 0;
            while (retryCount < maxRetries) {
              await Future.delayed(const Duration(milliseconds: 500));
              final tempState = ref.read(editProfileViewModelProvider);
              if (tempState.districts.isNotEmpty || !tempState.isLoadingDistricts) {
                break;
              }
              retryCount++;
            }

            // Try to match kecamatan
            final stateAfterDistricts = ref.read(editProfileViewModelProvider);
            if (stateAfterDistricts.kecamatanName.isNotEmpty &&
                stateAfterDistricts.districts.isNotEmpty) {
              try {
                final matchedKecamatan = stateAfterDistricts.districts.firstWhere(
                  (d) => _isRegionMatch(d.name, stateAfterDistricts.kecamatanName),
                );
                setState(() {
                  _selectedKecamatan = matchedKecamatan;
                });
                viewModel.updateKecamatan(
                    matchedKecamatan.name, matchedKecamatan.id);
              } catch (_) {
                // District not found in list
              }
            }
          } catch (_) {
            // City not found in list
          }
        }
      }
    }

    if (mounted) {
      ErrorSnackbar.showSuccess(context, 'Lokasi berhasil dideteksi');
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final viewModel = ref.read(editProfileViewModelProvider.notifier);
    final success = await viewModel.submit();

    if (!mounted) return;

    if (success) {
      // Invalidate profile data to refresh
      ref.invalidate(ibuHamilMeProvider);
      ErrorSnackbar.showSuccess(context, 'Profil berhasil diperbarui');
      Navigator.of(context).pop(true);
    } else {
      final state = ref.read(editProfileViewModelProvider);
      if (state.error != null) {
        ErrorSnackbar.show(context, state.error!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editProfileViewModelProvider);

    // Sync controllers when state changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.namaLengkap != _namaLengkapController.text) {
        _namaLengkapController.text = state.namaLengkap;
      }
      if (state.nik != _nikController.text) {
        _nikController.text = state.nik;
      }
      if (state.jalan != _jalanController.text) {
        _jalanController.text = state.jalan;
      }
      if (state.kelurahan != _kelurahanController.text) {
        _kelurahanController.text = state.kelurahan;
      }
      // Sync dropdowns - only if item exists in list
      if (state.selectedProvinsi != _selectedProvinsi) {
        if (state.selectedProvinsi != null && state.provinces.contains(state.selectedProvinsi)) {
          _selectedProvinsi = state.selectedProvinsi;
        } else if (_selectedProvinsi != null && !state.provinces.contains(_selectedProvinsi)) {
          _selectedProvinsi = null; // Clear if current selection is not in list
        }
      }
      
      if (state.selectedKota != _selectedKota) {
        if (state.selectedKota != null && state.regencies.contains(state.selectedKota)) {
          _selectedKota = state.selectedKota;
        } else if (_selectedKota != null && !state.regencies.contains(_selectedKota)) {
          _selectedKota = null; // Clear if current selection is not in list
        }
      }
      
      if (state.selectedKecamatan != _selectedKecamatan) {
        if (state.selectedKecamatan != null && state.districts.contains(state.selectedKecamatan)) {
          _selectedKecamatan = state.selectedKecamatan;
        } else if (_selectedKecamatan != null && !state.districts.contains(_selectedKecamatan)) {
          _selectedKecamatan = null; // Clear if current selection is not in list
        }
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Edit Personal Information',
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
      body: state.isLoading && state.namaLengkap.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Lengkap
                    CustomTextField(
                      label: 'NAMA LENGKAP',
                      hintText: 'Masukkan nama lengkap',
                      controller: _namaLengkapController,
                      onChanged: (value) {
                        ref
                            .read(editProfileViewModelProvider.notifier)
                            .updateNamaLengkap(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama lengkap harus diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // NIK
                    CustomTextField(
                      label: 'NIK',
                      hintText: 'Masukkan NIK (16 digit)',
                      controller: _nikController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ref
                            .read(editProfileViewModelProvider.notifier)
                            .updateNik(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'NIK harus diisi';
                        }
                        if (value.length != 16) {
                          return 'NIK harus 16 digit';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Tanggal Lahir
                    CustomTextField(
                      label: 'TANGGAL LAHIR',
                      hintText: 'DD/MM/YYYY',
                      controller: _tanggalLahirController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      suffixIcon: const Icon(Icons.calendar_today,
                          color: AppColors.textLight),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal lahir harus diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Address Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ALAMAT',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Deteksi Alamat Saya Button
                          OutlinedButton.icon(
                            onPressed: state.isLoadingLocation
                                ? null
                                : _handleDetectLocation,
                            icon: state.isLoadingLocation
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.location_on, size: 18),
                            label: const Text('Deteksi Alamat Saya'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primaryBlue,
                              side: const BorderSide(
                                  color: AppColors.primaryBlue),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // PROVINSI
                          CustomDropdown<Provinsi>(
                            label: 'PROVINSI',
                            hintText: 'Pilih Provinsi',
                            value: _selectedProvinsi,
                            items: state.provinces,
                            getLabel: (provinsi) => provinsi.name,
                            isLoading: state.isLoadingProvinces,
                            onChanged: (provinsi) {
                              setState(() {
                                _selectedProvinsi = provinsi;
                              });
                              if (provinsi != null) {
                                ref
                                    .read(editProfileViewModelProvider.notifier)
                                    .updateProvinsi(provinsi.name, provinsi.id);
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Provinsi harus dipilih';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // KOTA / KAB and KECAMATAN
                          Row(
                            children: [
                              Expanded(
                                child: CustomDropdown<KotaKabupaten>(
                                  label: 'KOTA / KAB',
                                  hintText: state.provinsiId.isEmpty
                                      ? 'Pilih Provinsi dulu'
                                      : 'Kota/Kab',
                                  value: _selectedKota,
                                  items: state.regencies,
                                  getLabel: (kota) => kota.name,
                                  isLoading: state.isLoadingRegencies,
                                  onChanged: state.provinsiId.isEmpty
                                      ? null
                                      : (kota) {
                                          setState(() {
                                            _selectedKota = kota;
                                          });
                                          if (kota != null) {
                                            ref
                                                .read(editProfileViewModelProvider
                                                    .notifier)
                                                .updateKota(kota.name, kota.id);
                                          }
                                        },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Kota/Kab harus dipilih';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomDropdown<Kecamatan>(
                                  label: 'KECAMATAN',
                                  hintText: state.kotaId.isEmpty
                                      ? 'Pilih Kota/Kab dulu'
                                      : 'Kecamatan',
                                  value: _selectedKecamatan,
                                  items: state.districts,
                                  getLabel: (kecamatan) => kecamatan.name,
                                  isLoading: state.isLoadingDistricts,
                                  onChanged: state.kotaId.isEmpty
                                      ? null
                                      : (kecamatan) {
                                          setState(() {
                                            _selectedKecamatan = kecamatan;
                                          });
                                          if (kecamatan != null) {
                                            ref
                                                .read(editProfileViewModelProvider
                                                    .notifier)
                                                .updateKecamatan(
                                                    kecamatan.name,
                                                    kecamatan.id);
                                          }
                                        },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Kecamatan harus dipilih';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // JALAN / NO. RUMAH
                          CustomTextField(
                            label: 'JALAN / NO. RUMAH',
                            hintText: 'Contoh: Jl. Melati No. 123',
                            controller: _jalanController,
                            onChanged: (value) {
                              ref
                                  .read(editProfileViewModelProvider.notifier)
                                  .updateJalan(value);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Jalan harus diisi';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // KELURAHAN
                          CustomTextField(
                            label: 'KELURAHAN',
                            hintText: 'Masukkan kelurahan',
                            controller: _kelurahanController,
                            onChanged: (value) {
                              ref
                                  .read(editProfileViewModelProvider.notifier)
                                  .updateKelurahan(value);
                            },
                          ),
                        ],
                      ),
                    ),

                    // Error messages
                    if (state.error != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline,
                                size: 18, color: Colors.red.shade700),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                state.error!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    if (state.locationError != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.warning_amber_rounded,
                                size: 18, color: Colors.orange.shade700),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                state.locationError!,
                                style: TextStyle(
                                  color: Colors.orange.shade700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // Submit Button
                    CustomButton(
                      text: 'Simpan Perubahan',
                      onPressed: _handleSubmit,
                      isLoading: state.isLoading,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
