import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/constants/app_strings.dart';
import 'package:wellmom_app/core/models/wilayah_indonesia.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_dropdown.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';

class RegisterIbuHamilScreen extends ConsumerStatefulWidget {
  const RegisterIbuHamilScreen({super.key});

  @override
  ConsumerState<RegisterIbuHamilScreen> createState() =>
      _RegisterIbuHamilScreenState();
}

class _RegisterIbuHamilScreenState
    extends ConsumerState<RegisterIbuHamilScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaLengkapController = TextEditingController();
  final _nikController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _alamatController = TextEditingController();
  final _jalanController = TextEditingController();
  final _kodePosController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emergencyContactNameController = TextEditingController();
  final _emergencyContactPhoneController = TextEditingController();
  final _emergencyContactRelationController = TextEditingController();
  
  Provinsi? _selectedProvinsi;
  KotaKabupaten? _selectedKota;
  Kecamatan? _selectedKecamatan;
  String? _selectedBloodType;
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _namaLengkapController.dispose();
    _nikController.dispose();
    _tanggalLahirController.dispose();
    _alamatController.dispose();
    _jalanController.dispose();
    _kodePosController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Sync controllers with ViewModel state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncControllersWithState();
    });
  }

  void _syncControllersWithState() {
    final state = ref.read(registerViewModelProvider);
    _namaLengkapController.text = state.namaLengkap;
    _nikController.text = state.nik;
    _tanggalLahirController.text = state.formattedDate ?? '';
    _alamatController.text = state.alamat;
    _jalanController.text = state.jalan;
    _kodePosController.text = state.kodePos;
    _emailController.text = state.email;
    _phoneController.text = state.phone;
    _passwordController.text = state.password;
    _emergencyContactNameController.text = state.emergencyContactName;
    _emergencyContactPhoneController.text = state.emergencyContactPhone;
    _emergencyContactRelationController.text = state.emergencyContactRelation ?? '';
    
    // Sync dropdown selections
    _selectedBloodType = state.bloodType;
    if (state.provinsiId.isNotEmpty && state.provinces.isNotEmpty) {
      try {
        _selectedProvinsi = state.provinces.firstWhere(
          (p) => p.id == state.provinsiId,
        );
      } catch (e) {
        // Not found, keep null
      }
    }
    if (state.kotaId.isNotEmpty && state.regencies.isNotEmpty) {
      try {
        _selectedKota = state.regencies.firstWhere(
          (k) => k.id == state.kotaId,
        );
      } catch (e) {
        // Not found, keep null
      }
    }
    if (state.kecamatanId.isNotEmpty && state.districts.isNotEmpty) {
      try {
        _selectedKecamatan = state.districts.firstWhere(
          (d) => d.id == state.kecamatanId,
        );
      } catch (e) {
        // Not found, keep null
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBlue,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      ref.read(registerViewModelProvider.notifier).updateTanggalLahir(picked);
      _tanggalLahirController.text = DateFormatter.formatDate(picked);
    }
  }


  void _handleNext() {
    if (_formKey.currentState!.validate()) {
      // Update ViewModel with current form values
      ref.read(registerViewModelProvider.notifier).updateNamaLengkap(
          _namaLengkapController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updateNik(_nikController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updateAlamat(_alamatController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updateJalan(_jalanController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updateKodePos(_kodePosController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updateEmail(_emailController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updatePhone(_phoneController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updatePassword(_passwordController.text);
      ref.read(registerViewModelProvider.notifier)
          .updateBloodType(_selectedBloodType);
      ref.read(registerViewModelProvider.notifier)
          .updateEmergencyContactName(_emergencyContactNameController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updateEmergencyContactPhone(_emergencyContactPhoneController.text.trim());
      ref.read(registerViewModelProvider.notifier)
          .updateEmergencyContactRelation(_emergencyContactRelationController.text.trim().isEmpty 
              ? null 
              : _emergencyContactRelationController.text.trim());
      
      // Validate required dropdowns
      if (_selectedProvinsi == null || _selectedKota == null || _selectedKecamatan == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mohon lengkapi Provinsi, Kota/Kab, dan Kecamatan'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Navigate to medical data screen (no API call yet)
      Navigator.of(context).pushNamed(AppRouter.medicalData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerViewModelProvider);

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
          AppStrings.informasiPribadi,
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicator
              Row(
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
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Introduction text
              const Text(
                AppStrings.letsStart,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              // Nama Lengkap
              CustomTextField(
                label: AppStrings.namaLengkap,
                hintText: 'e.g., Jane Doe',
                controller: _namaLengkapController,
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier)
                      .updateNamaLengkap(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.namaLengkapHarusDiisi;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // NIK
              CustomTextField(
                label: AppStrings.nik,
                hintText: 'e.g., 16 digit number',
                controller: _nikController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier).updateNik(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.nikHarusDiisi;
                  }
                  if (value.length != 16) {
                    return AppStrings.nikHarus16Digit;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Tanggal Lahir
              CustomTextField(
                label: AppStrings.tanggalLahir,
                hintText: 'DD/MM/YYYY',
                controller: _tanggalLahirController,
                readOnly: true,
                onTap: () => _selectDate(context),
                suffixIcon: const Icon(Icons.calendar_today, size: 20),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.tanggalLahirHarusDiisi;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Email
              CustomTextField(
                label: 'Email',
                hintText: 'Masukkan email Anda',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier).updateEmail(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email harus diisi';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Phone
              CustomTextField(
                label: 'Nomor Telepon',
                hintText: '+6281234567890',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier).updatePhone(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon harus diisi';
                  }
                  if (!value.startsWith('+62')) {
                    return 'Format nomor telepon harus dimulai dengan +62';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Password
              CustomTextField(
                label: AppStrings.kataSandi,
                hintText: '••••••••',
                controller: _passwordController,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textLight,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier).updatePassword(value);
                },
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
              const SizedBox(height: 16),
              // Confirm Password
              CustomTextField(
                label: 'Konfirmasi Password',
                hintText: '••••••••',
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textLight,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Konfirmasi password harus diisi';
                  }
                  if (value != _passwordController.text) {
                    return 'Password tidak cocok';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Blood Type Dropdown - Professional Styling
              CustomDropdown<String>(
                label: 'Golongan Darah',
                hintText: 'Pilih Golongan Darah',
                value: _selectedBloodType,
                items: const ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
                getLabel: (type) => type,
                onChanged: (value) {
                  setState(() {
                    _selectedBloodType = value;
                  });
                  if (value != null) {
                    ref.read(registerViewModelProvider.notifier).updateBloodType(value);
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return 'Golongan darah harus dipilih';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Emergency Contact Section Header
              Row(
                children: [
                  Icon(
                    Icons.emergency,
                    size: 20,
                    color: AppColors.primaryBlue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Kontak Darurat',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Emergency Contact Name
              CustomTextField(
                label: 'Nama Kontak Darurat',
                hintText: 'Contoh: Budi (Suami)',
                controller: _emergencyContactNameController,
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier)
                      .updateEmergencyContactName(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama kontak darurat harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Emergency Contact Phone
              CustomTextField(
                label: 'Nomor Telepon Kontak Darurat',
                hintText: '+6281234567890',
                controller: _emergencyContactPhoneController,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier)
                      .updateEmergencyContactPhone(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon kontak darurat harus diisi';
                  }
                  if (!value.startsWith('+62')) {
                    return 'Format nomor telepon harus dimulai dengan +62';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Emergency Contact Relation
              CustomTextField(
                label: 'Hubungan dengan Kontak Darurat',
                hintText: 'Contoh: Suami, Ibu, Kakak',
                controller: _emergencyContactRelationController,
                onChanged: (value) {
                  ref.read(registerViewModelProvider.notifier)
                      .updateEmergencyContactRelation(value.isEmpty ? null : value);
                },
              ),
              const SizedBox(height: 24),
              // Alamat Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: AppColors.primaryBlue,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Alamat Saat Ini',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                      ),
                    ],
                  ),
                  // GUNAKAN LOKASI Button
                  OutlinedButton.icon(
                    onPressed: state.isLoadingLocation
                        ? null
                        : () async {
                            await ref
                                .read(registerViewModelProvider.notifier)
                                .getCurrentLocation();
                            
                            if (!mounted) return;
                            
                            final updatedState = ref.read(registerViewModelProvider);
                            
                            // Update text fields - jalan tidak diisi otomatis
                            _kodePosController.text = updatedState.kodePos;
                            
                            // Update location coordinates
                            if (updatedState.currentPosition != null) {
                              ref
                                  .read(registerViewModelProvider.notifier)
                                  .updateLocation(
                                    updatedState.currentPosition!.latitude,
                                    updatedState.currentPosition!.longitude,
                                  );
                            }
                            
                            // Try to match provinsi from geocoded address
                            if (updatedState.provinsi.isNotEmpty && state.provinces.isNotEmpty) {
                              Provinsi? matchedProvinsi;
                              try {
                                matchedProvinsi = state.provinces.firstWhere(
                                  (p) {
                                    final provName = p.name.toLowerCase();
                                    final geocodedProv = updatedState.provinsi.toLowerCase();
                                    return provName.contains(geocodedProv) ||
                                        geocodedProv.contains(provName) ||
                                        provName.replaceAll(' ', '')
                                            .contains(geocodedProv.replaceAll(' ', '')) ||
                                        geocodedProv.replaceAll(' ', '')
                                            .contains(provName.replaceAll(' ', ''));
                                  },
                                );
                              } catch (e) {
                                // No match found, keep current selection
                              }
                              
                              if (matchedProvinsi != null) {
                                setState(() {
                                  _selectedProvinsi = matchedProvinsi;
                                });
                                ref
                                    .read(registerViewModelProvider.notifier)
                                    .updateProvinsi(
                                        matchedProvinsi.name, matchedProvinsi.id);
                                
                                // Wait a bit for regencies to load, then try to match kota
                                await Future.delayed(const Duration(milliseconds: 500));
                                final stateAfterRegencies = ref.read(registerViewModelProvider);
                                
                                if (updatedState.kota.isNotEmpty &&
                                    stateAfterRegencies.regencies.isNotEmpty) {
                                  try {
                                    final matchedKota = stateAfterRegencies.regencies.firstWhere(
                                      (k) {
                                        final kotaName = k.name.toLowerCase();
                                        final geocodedKota = updatedState.kota.toLowerCase();
                                        return kotaName.contains(geocodedKota) ||
                                            geocodedKota.contains(kotaName) ||
                                            kotaName.replaceAll(' ', '')
                                                .contains(geocodedKota.replaceAll(' ', '')) ||
                                            geocodedKota.replaceAll(' ', '')
                                                .contains(kotaName.replaceAll(' ', ''));
                                      },
                                    );
                                    
                                    setState(() {
                                      _selectedKota = matchedKota;
                                    });
                                    ref
                                        .read(registerViewModelProvider.notifier)
                                        .updateKota(matchedKota.name, matchedKota.id);
                                    
                                    // Wait for districts to load, then try to match kecamatan
                                    await Future.delayed(const Duration(milliseconds: 500));
                                    final stateAfterDistricts = ref.read(registerViewModelProvider);
                                    
                                    if (updatedState.kecamatan.isNotEmpty &&
                                        stateAfterDistricts.districts.isNotEmpty) {
                                      try {
                                        final matchedKecamatan =
                                            stateAfterDistricts.districts.firstWhere(
                                          (d) {
                                            final kecName = d.name.toLowerCase();
                                            final geocodedKec = updatedState.kecamatan.toLowerCase();
                                            return kecName.contains(geocodedKec) ||
                                                geocodedKec.contains(kecName) ||
                                                kecName.replaceAll(' ', '')
                                                    .contains(geocodedKec.replaceAll(' ', '')) ||
                                                geocodedKec.replaceAll(' ', '')
                                                    .contains(kecName.replaceAll(' ', ''));
                                          },
                                        );
                                        
                                        setState(() {
                                          _selectedKecamatan = matchedKecamatan;
                                        });
                                        ref
                                            .read(registerViewModelProvider.notifier)
                                            .updateKecamatan(
                                                matchedKecamatan.name, matchedKecamatan.id);
                                      } catch (e) {
                                        // Kecamatan not matched
                                      }
                                    }
                                  } catch (e) {
                                    // Kota not matched
                                  }
                                }
                              }
                            }
                            
                            if (updatedState.locationError != null && mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(updatedState.locationError!),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else if (updatedState.currentPosition != null && mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Lokasi berhasil dideteksi'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                    icon: state.isLoadingLocation
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                            ),
                          )
                        : Icon(
                            Icons.my_location,
                            size: 16,
                            color: AppColors.primaryBlue,
                          ),
                    label: Text(
                      'GUNAKAN LOKASI',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: state.isLoadingLocation
                            ? Colors.grey
                            : AppColors.primaryBlue,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: state.isLoadingLocation
                            ? Colors.grey.shade300
                            : AppColors.primaryBlue,
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Address Fields Container
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
                    // PROVINSI (Dropdown)
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
                          ref.read(registerViewModelProvider.notifier)
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
                    // KOTA / KAB and KECAMATAN (Side by side)
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
                                      ref.read(registerViewModelProvider.notifier)
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
                                      ref.read(registerViewModelProvider.notifier)
                                          .updateKecamatan(kecamatan.name, kecamatan.id);
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
                    // JALAN / NO. RUMAH (moved here - below KOTA/KAB and KECAMATAN, above KODE POS)
                    CustomTextField(
                      label: 'JALAN / NO. RUMAH',
                      hintText: 'Contoh: Jl. Melati No. 123',
                      controller: _jalanController,
                      onChanged: (value) {
                        ref.read(registerViewModelProvider.notifier)
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
                    // KODE POS
                    CustomTextField(
                      label: 'KODE POS',
                      hintText: '4xxxx',
                      controller: _kodePosController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ref.read(registerViewModelProvider.notifier)
                            .updateKodePos(value);
                      },
                    ),
                    // Error message for wilayah
                    if (state.wilayahError != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.red.shade200,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 18,
                              color: Colors.red.shade700,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                state.wilayahError!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Informational message
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: AppColors.primaryBlue,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Alamat ini akan digunakan untuk keperluan pengiriman perlengkapan atau koordinasi kunjungan medis jika diperlukan.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textDark,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Next button
              CustomButton(
                text: AppStrings.next,
                onPressed: _handleNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
