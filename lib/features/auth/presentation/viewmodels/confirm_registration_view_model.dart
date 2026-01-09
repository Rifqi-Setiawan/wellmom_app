import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/ibu_hamil_entity.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';

/// State for complete registration
class ConfirmRegistrationState {
  final bool isSubmitting;
  final String? error;
  final IbuHamilEntity? registeredIbuHamil;

  const ConfirmRegistrationState({
    this.isSubmitting = false,
    this.error,
    this.registeredIbuHamil,
  });

  ConfirmRegistrationState copyWith({
    bool? isSubmitting,
    String? error,
    IbuHamilEntity? registeredIbuHamil,
    bool clearError = false,
    bool clearRegisteredIbuHamil = false,
  }) {
    return ConfirmRegistrationState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: clearError ? null : (error ?? this.error),
      registeredIbuHamil: clearRegisteredIbuHamil
          ? null
          : (registeredIbuHamil ?? this.registeredIbuHamil),
    );
  }
}

/// ViewModel for complete registration
class ConfirmRegistrationViewModel
    extends StateNotifier<ConfirmRegistrationState> {
  final AuthRepository authRepository;

  ConfirmRegistrationViewModel({required this.authRepository})
      : super(const ConfirmRegistrationState());

  /// Complete registration: register ibu hamil and assign to puskesmas
  Future<bool> completeRegistration({
    required int puskesmasId,
    required Map<String, dynamic> registerState,
    required Map<String, dynamic> medicalDataState,
  }) async {
    state = state.copyWith(isSubmitting: true, clearError: true);

    try {
      // Validate required fields from register state
      final email = registerState['email']?.toString().trim() ?? '';
      final phone = registerState['phone']?.toString().trim() ?? '';
      final password = registerState['password']?.toString() ?? '';
      final namaLengkap = registerState['namaLengkap']?.toString().trim() ?? '';
      final nik = registerState['nik']?.toString().trim() ?? '';
      final tanggalLahir = registerState['tanggalLahir'] as DateTime?;
      final kecamatan = registerState['kecamatan']?.toString().trim() ?? '';
      final kota = registerState['kota']?.toString().trim() ?? '';
      final provinsi = registerState['provinsi']?.toString().trim() ?? '';
      
      if (email.isEmpty || phone.isEmpty || password.isEmpty) {
        state = state.copyWith(
          isSubmitting: false,
          error: 'Email, nomor telepon, dan password harus diisi',
        );
        return false;
      }
      
      if (namaLengkap.isEmpty || nik.isEmpty || tanggalLahir == null) {
        state = state.copyWith(
          isSubmitting: false,
          error: 'Nama lengkap, NIK, dan tanggal lahir harus diisi',
        );
        return false;
      }
      
      if (kecamatan.isEmpty || kota.isEmpty || provinsi.isEmpty) {
        state = state.copyWith(
          isSubmitting: false,
          error: 'Kecamatan, Kota/Kabupaten, dan Provinsi harus diisi',
        );
        return false;
      }
      
      // Validate emergency contact fields
      final emergencyContactName = registerState['emergencyContactName']?.toString().trim() ?? '';
      final emergencyContactPhone = registerState['emergencyContactPhone']?.toString().trim() ?? '';
      
      if (emergencyContactName.isEmpty || emergencyContactPhone.isEmpty) {
        state = state.copyWith(
          isSubmitting: false,
          error: 'Nama dan nomor telepon kontak darurat harus diisi',
        );
        return false;
      }

      // Build request model
      final requestModel = _buildRegistrationRequest(
        registerState: registerState,
        medicalDataState: medicalDataState,
      );

      // Validate required fields in request model
      final validationError = _validateRequestModel(requestModel);
      if (validationError != null) {
        state = state.copyWith(
          isSubmitting: false,
          error: validationError,
        );
        return false;
      }

      // Step 1: Register ibu hamil
      IbuHamilEntity? registeredIbuHamil;
      
      final registerResult = await authRepository.registerIbuHamil(requestModel);
      
      final registerSuccess = registerResult.fold(
        (failure) {
          state = state.copyWith(
            isSubmitting: false,
            error: failure.message,
          );
          return false;
        },
        (entity) {
          registeredIbuHamil = entity;
          return true;
        },
      );

      if (!registerSuccess || registeredIbuHamil == null) {
        return false;
      }

      // Step 2: Assign to puskesmas
      final assignResult = await authRepository.assignIbuHamilToPuskesmas(
        puskesmasId,
        registeredIbuHamil!.id,
      );

      return assignResult.fold(
        (failure) {
          state = state.copyWith(
            isSubmitting: false,
            error: failure.message,
          );
          return false;
        },
        (_) {
          state = state.copyWith(
            isSubmitting: false,
            registeredIbuHamil: registeredIbuHamil,
          );
          return true;
        },
      );
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
      return false;
    }
  }

  /// Build registration request from states
  RegisterIbuHamilRequestModel _buildRegistrationRequest({
    required Map<String, dynamic> registerState,
    required Map<String, dynamic> medicalDataState,
  }) {
    // Build address string
    final addressParts = <String>[];
    if (registerState['jalan'] != null && registerState['jalan'].toString().isNotEmpty) {
      addressParts.add(registerState['jalan']);
    }
    if (registerState['kelurahan'] != null && registerState['kelurahan'].toString().isNotEmpty) {
      addressParts.add(registerState['kelurahan']);
    }
    if (registerState['kecamatan'] != null && registerState['kecamatan'].toString().isNotEmpty) {
      addressParts.add(registerState['kecamatan']);
    }
    if (registerState['kota'] != null && registerState['kota'].toString().isNotEmpty) {
      addressParts.add(registerState['kota']);
    }
    if (registerState['provinsi'] != null && registerState['provinsi'].toString().isNotEmpty) {
      addressParts.add(registerState['provinsi']);
    }
    var address = addressParts.isNotEmpty
        ? addressParts.join(', ')
        : (registerState['alamat']?.toString().trim() ?? '');
    
    // Ensure address is not empty (required field)
    if (address.isEmpty) {
      // Fallback: use minimal address from available data
      final minimalAddress = [
        registerState['kecamatan']?.toString().trim(),
        registerState['kota']?.toString().trim(),
        registerState['provinsi']?.toString().trim(),
      ].where((s) => s != null && s.isNotEmpty).join(', ');
      if (minimalAddress.isNotEmpty) {
        address = minimalAddress;
      }
    }

    // Build location array [longitude, latitude]
    final location = <double>[];
    if (registerState['longitude'] != null && registerState['latitude'] != null) {
      location.add(registerState['longitude'] as double);
      location.add(registerState['latitude'] as double);
    }

    // Format dates
    String? formatDate(DateTime? date) {
      if (date == null) return null;
      return DateFormatter.formatDateForApi(date);
    }

    // Calculate age from date of birth
    int? calculateAge(DateTime? dateOfBirth) {
      if (dateOfBirth == null) return null;
      final today = DateTime.now();
      int age = today.year - dateOfBirth.year;
      if (today.month < dateOfBirth.month ||
          (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
        age--;
      }
      return age;
    }

    final request = RegisterIbuHamilRequestModel(
      ibuHamil: IbuHamilData(
        address: address,
        age: calculateAge(registerState['tanggalLahir'] as DateTime?),
        bloodType: registerState['bloodType'] as String?,
        currentMedications: null, // Not collected in current form
        dataSharingConsent: medicalDataState['dataSharingConsent'] as bool? ?? false,
        dateOfBirth: formatDate(registerState['tanggalLahir'] as DateTime?)!,
        emergencyContactName: registerState['emergencyContactName']?.toString().trim() ?? '',
        emergencyContactPhone: registerState['emergencyContactPhone']?.toString().trim() ?? '',
        emergencyContactRelation: registerState['emergencyContactRelation'] as String?,
        estimatedDueDate: formatDate(medicalDataState['hpl'] as DateTime?),
        healthcarePreference: 'puskesmas',
        heightCm: null, // Not collected in current form
        jarakKehamilanTerakhir: medicalDataState['jarakKehamilanTerakhir'] as String?,
        jumlahAnak: medicalDataState['jumlahAnak'] as int? ?? 0,
        kecamatan: registerState['kecamatan']?.toString().trim() ?? '',
        kehamilanKe: medicalDataState['kehamilanKe'] as int? ?? 1,
        kelurahan: registerState['kelurahan']?.toString().trim(),
        kotaKabupaten: registerState['kota']?.toString().trim() ?? '',
        lastMenstrualPeriod: formatDate(medicalDataState['hpht'] as DateTime?),
        location: location.isNotEmpty ? location : [0.0, 0.0], // Default if no location
        medicalHistory: null, // Not collected in current form
        miscarriageNumber: (medicalDataState['riwayatKeguguran'] == true) ? 1 : 0,
        namaLengkap: registerState['namaLengkap']?.toString().trim() ?? '',
        nik: registerState['nik']?.toString().trim() ?? '',
        pernahCaesar: medicalDataState['pernahCaesar'] as bool? ?? false,
        pernahPerdarahanSaatHamil:
            medicalDataState['pernahPerdarahanSaatHamil'] as bool? ?? false,
        prePregnancyWeightKg: null, // Not collected in current form
        previousPregnancyComplications:
            medicalDataState['komplikasiKehamilanSebelumnya'] as String?,
        provinsi: registerState['provinsi']?.toString().trim() ?? '',
        riskLevel: 'normal', // Default, can be calculated later
        riwayatKesehatanIbu: RiwayatKesehatanIbuData(
          darahTinggi: medicalDataState['darahTinggi'] as bool? ?? false,
          diabetes: medicalDataState['diabetes'] as bool? ?? false,
          anemia: medicalDataState['anemia'] as bool? ?? false,
          penyakitJantung: medicalDataState['penyakitJantung'] as bool? ?? false,
          asma: medicalDataState['asma'] as bool? ?? false,
          penyakitGinjal: medicalDataState['penyakitGinjal'] as bool? ?? false,
          tbcMalaria: medicalDataState['tbcMalaria'] as bool? ?? false,
        ),
        rtRw: null, // Not collected in current form
        usiaKehamilan: medicalDataState['usiaKehamilan'] as int?,
        whatsappConsent: medicalDataState['whatsappConsent'] as bool? ?? false,
      ),
      user: UserData(
        email: registerState['email']?.toString().trim() ?? '',
        fullName: registerState['namaLengkap']?.toString().trim() ?? '',
        password: registerState['password']?.toString() ?? '',
        phone: registerState['phone']?.toString().trim() ?? '',
        role: 'ibu_hamil',
      ),
    );

    return request;
  }

  /// Validate request model for required fields
  String? _validateRequestModel(RegisterIbuHamilRequestModel request) {
    final ibuHamil = request.ibuHamil;
    final user = request.user;
    
    // Validate ibu hamil required fields
    if (ibuHamil.address.trim().isEmpty) {
      return 'Alamat harus diisi';
    }
    if (ibuHamil.dateOfBirth.trim().isEmpty) {
      return 'Tanggal lahir harus diisi';
    }
    if (ibuHamil.emergencyContactName.trim().isEmpty) {
      return 'Nama kontak darurat harus diisi';
    }
    if (ibuHamil.emergencyContactPhone.trim().isEmpty) {
      return 'Nomor telepon kontak darurat harus diisi';
    }
    if (ibuHamil.kecamatan.trim().isEmpty) {
      return 'Kecamatan harus diisi';
    }
    if (ibuHamil.kotaKabupaten.trim().isEmpty) {
      return 'Kota/Kabupaten harus diisi';
    }
    if (ibuHamil.namaLengkap.trim().isEmpty) {
      return 'Nama lengkap harus diisi';
    }
    if (ibuHamil.nik.trim().isEmpty) {
      return 'NIK harus diisi';
    }
    if (ibuHamil.provinsi.trim().isEmpty) {
      return 'Provinsi harus diisi';
    }
    if (ibuHamil.location.isEmpty) {
      return 'Lokasi harus diisi';
    }
    
    // Validate user required fields
    if (user.email.trim().isEmpty) {
      return 'Email harus diisi';
    }
    if (user.fullName.trim().isEmpty) {
      return 'Nama lengkap user harus diisi';
    }
    if (user.password.trim().isEmpty) {
      return 'Password harus diisi';
    }
    if (user.phone.trim().isEmpty) {
      return 'Nomor telepon harus diisi';
    }
    
    return null;
  }
}
