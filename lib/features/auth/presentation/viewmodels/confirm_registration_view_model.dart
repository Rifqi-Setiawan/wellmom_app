import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_ibu_hamil_response_entity.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';

/// State for complete registration
class ConfirmRegistrationState {
  final bool isSubmitting;
  final String? error;
  final RegisterIbuHamilResponseEntity? registrationResponse;

  const ConfirmRegistrationState({
    this.isSubmitting = false,
    this.error,
    this.registrationResponse,
  });

  ConfirmRegistrationState copyWith({
    bool? isSubmitting,
    String? error,
    RegisterIbuHamilResponseEntity? registrationResponse,
    bool clearError = false,
    bool clearRegistrationResponse = false,
  }) {
    return ConfirmRegistrationState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: clearError ? null : (error ?? this.error),
      registrationResponse: clearRegistrationResponse
          ? null
          : (registrationResponse ?? this.registrationResponse),
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
      
      // Email, phone, and password are required
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

      // Output request body for debugging
      try {
        final requestJson = requestModel.toJson();
        
        // Validate all required fields are present and not null
        final ibuHamilJson = requestJson['ibu_hamil'] as Map<String, dynamic>?;
        if (ibuHamilJson == null) {
          throw Exception('ibu_hamil is null in request JSON');
        }
        
        // Check required fields
        final requiredFields = [
          'address',
          'date_of_birth',
          'emergency_contact_name',
          'emergency_contact_phone',
          'kecamatan',
          'kota_kabupaten',
          'nama_lengkap',
          'nik',
          'provinsi',
          'location',
          'riwayat_kesehatan_ibu',
        ];
        
        final missingFields = <String>[];
        for (final field in requiredFields) {
          if (!ibuHamilJson.containsKey(field) || ibuHamilJson[field] == null) {
            missingFields.add(field);
          } else if (field == 'location' && ibuHamilJson[field] is List) {
            final loc = ibuHamilJson[field] as List;
            if (loc.isEmpty) {
              missingFields.add(field);
            }
          } else if (field == 'riwayat_kesehatan_ibu' && ibuHamilJson[field] is Map) {
            // OK, it's a map
          } else if (ibuHamilJson[field] is String && (ibuHamilJson[field] as String).isEmpty) {
            missingFields.add(field);
          }
        }
        
        if (missingFields.isNotEmpty) {
          print('⚠️ Missing or empty required fields: ${missingFields.join(", ")}');
        }
        
        final formattedJson = const JsonEncoder.withIndent('  ').convert(requestJson);
        print('═══════════════════════════════════════════════════════════');
        print('📤 REQUEST BODY - REGISTRASI IBU HAMIL');
        print('═══════════════════════════════════════════════════════════');
        print(formattedJson);
        print('═══════════════════════════════════════════════════════════');
        
        if (missingFields.isNotEmpty) {
          throw Exception('Missing required fields: ${missingFields.join(", ")}');
        }
      } catch (e) {
        print('⚠️ Error formatting request JSON: $e');
        print('📤 Request Model: ${requestModel.toString()}');
        state = state.copyWith(
          isSubmitting: false,
          error: 'Error mempersiapkan data: ${e.toString()}',
        );
        return false;
      }

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
      RegisterIbuHamilResponseEntity? registrationResponse;
      
      final registerResult = await authRepository.registerIbuHamil(requestModel);
      
      final registerSuccess = registerResult.fold(
        (failure) {
          state = state.copyWith(
            isSubmitting: false,
            error: failure.message,
          );
          return false;
        },
        (response) {
          registrationResponse = response;
          // Log success response for debugging
          print('═══════════════════════════════════════════════════════════');
          print('✅ REGISTRASI IBU HAMIL BERHASIL');
          print('═══════════════════════════════════════════════════════════');
          print('Ibu Hamil ID: ${response.ibuHamil.id}');
          print('Nama: ${response.ibuHamil.namaLengkap}');
          print('NIK: ${response.ibuHamil.nik}');
          print('User ID: ${response.user.id}');
          print('Access Token: ${response.accessToken.substring(0, 20)}...');
          print('Message: ${response.message}');
          print('═══════════════════════════════════════════════════════════');
          return true;
        },
      );

      if (!registerSuccess || registrationResponse == null) {
        return false;
      }

      // Step 2: Assign to puskesmas using access token from registration
      print('📤 Assigning ibu hamil to puskesmas...');
      print('   Puskesmas ID: $puskesmasId');
      print('   Ibu Hamil ID: ${registrationResponse!.ibuHamil.id}');
      
      final assignResult = await authRepository.assignIbuHamilToPuskesmas(
        puskesmasId,
        registrationResponse!.ibuHamil.id,
        registrationResponse!.accessToken,
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
          print('✅ Assign ke puskesmas berhasil!');
          state = state.copyWith(
            isSubmitting: false,
            registrationResponse: registrationResponse,
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

    // Validate tanggalLahir is not null (required field)
    final tanggalLahir = registerState['tanggalLahir'] as DateTime?;
    if (tanggalLahir == null) {
      throw Exception('Tanggal lahir harus diisi');
    }
    final dateOfBirthString = formatDate(tanggalLahir);
    if (dateOfBirthString == null || dateOfBirthString.isEmpty) {
      throw Exception('Format tanggal lahir tidak valid');
    }

    // Ensure required string fields are not empty
    final namaLengkap = (registerState['namaLengkap']?.toString().trim() ?? '');
    final nik = (registerState['nik']?.toString().trim() ?? '');
    final kecamatan = (registerState['kecamatan']?.toString().trim() ?? '');
    final kotaKabupaten = (registerState['kota']?.toString().trim() ?? '');
    final provinsi = (registerState['provinsi']?.toString().trim() ?? '');
    final emergencyContactName = (registerState['emergencyContactName']?.toString().trim() ?? '');
    final emergencyContactPhone = (registerState['emergencyContactPhone']?.toString().trim() ?? '');

    // Ensure address is not empty
    if (address.isEmpty) {
      throw Exception('Alamat harus diisi');
    }

    // Ensure location is valid (not [0.0, 0.0] if no location was provided)
    final finalLocation = location.isNotEmpty ? location : [0.0, 0.0];

    final request = RegisterIbuHamilRequestModel(
      ibuHamil: IbuHamilData(
        address: address,
        age: calculateAge(tanggalLahir),
        bloodType: registerState['bloodType'] as String?,
        dataSharingConsent: medicalDataState['dataSharingConsent'] as bool? ?? false,
        dateOfBirth: dateOfBirthString,
        emergencyContactName: emergencyContactName,
        emergencyContactPhone: emergencyContactPhone,
        emergencyContactRelation: registerState['emergencyContactRelation'] as String?,
        estimatedDueDate: formatDate(medicalDataState['hpl'] as DateTime?),
        healthcarePreference: 'puskesmas',
        jarakKehamilanTerakhir: medicalDataState['jarakKehamilanTerakhir'] as String?,
        jumlahAnak: medicalDataState['jumlahAnak'] as int? ?? 0,
        kecamatan: kecamatan,
        kehamilanKe: medicalDataState['kehamilanKe'] as int? ?? 1,
        kelurahan: registerState['kelurahan']?.toString().trim(),
        kotaKabupaten: kotaKabupaten,
        lastMenstrualPeriod: formatDate(medicalDataState['hpht'] as DateTime?),
        location: finalLocation,
        miscarriageNumber: medicalDataState['jumlahKeguguran'] as int? ?? 0,
        namaLengkap: namaLengkap,
        nik: nik,
        pernahCaesar: medicalDataState['pernahCaesar'] as bool? ?? false,
        pernahPerdarahanSaatHamil:
            medicalDataState['pernahPerdarahanSaatHamil'] as bool? ?? false,
        previousPregnancyComplications:
            medicalDataState['komplikasiKehamilanSebelumnya'] as String?,
        provinsi: provinsi,
        // risk_level is NOT allowed to be filled during registration (will be ignored by backend)
        riwayatKesehatanIbu: RiwayatKesehatanIbuData(
          darahTinggi: medicalDataState['darahTinggi'] as bool? ?? false,
          diabetes: medicalDataState['diabetes'] as bool? ?? false,
          anemia: medicalDataState['anemia'] as bool? ?? false,
          penyakitJantung: medicalDataState['penyakitJantung'] as bool? ?? false,
          asma: medicalDataState['asma'] as bool? ?? false,
          penyakitGinjal: medicalDataState['penyakitGinjal'] as bool? ?? false,
          tbcMalaria: medicalDataState['tbcMalaria'] as bool? ?? false,
        ),
        usiaKehamilan: medicalDataState['usiaKehamilan'] as int?,
        whatsappConsent: medicalDataState['whatsappConsent'] as bool? ?? false,
      ),
      user: UserData(
        // Email is required
        email: registerState['email']?.toString().trim() ?? '',
        fullName: namaLengkap,
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
