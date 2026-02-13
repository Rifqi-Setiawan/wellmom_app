import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_ibu_hamil_response_entity.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';

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
  final Ref ref;

  ConfirmRegistrationViewModel({
    required this.authRepository,
    required this.ref,
  }) : super(const ConfirmRegistrationState());

  /// Step 1: Register ibu hamil only (tanpa assign ke puskesmas)
  /// Dipanggil dari MedicalDataScreen setelah form selesai diisi
  Future<bool> registerIbuHamil({
    required Map<String, dynamic> registerState,
    required Map<String, dynamic> medicalDataState,
  }) async {
    state = state.copyWith(isSubmitting: true, clearError: true);

    try {
      // Validate REQUIRED fields sesuai backend
      final phone = registerState['phone']?.toString().trim() ?? '';
      final password = registerState['password']?.toString() ?? '';
      final namaLengkap = registerState['namaLengkap']?.toString().trim() ?? '';
      final nik = registerState['nik']?.toString().trim() ?? '';
      final tanggalLahir = registerState['tanggalLahir'] as DateTime?;
      
      if (phone.isEmpty || password.isEmpty) {
        state = state.copyWith(
          isSubmitting: false,
          error: 'Nomor telepon dan password harus diisi',
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
        
        final ibuHamilRaw = requestJson['ibu_hamil'];
        final Map<String, dynamic> ibuHamilJson = ibuHamilRaw is Map<String, dynamic>
            ? ibuHamilRaw
            : requestModel.ibuHamil.toJson();
        final userRaw = requestJson['user'];
        final Map<String, dynamic> userJson = userRaw is Map<String, dynamic>
            ? userRaw
            : requestModel.user.toJson();
        
        final requiredIbuHamilFields = [
          'nama_lengkap', 'nik', 'date_of_birth', 'address',
          'location', 'emergency_contact_name', 'emergency_contact_phone',
        ];
        final requiredUserFields = ['phone', 'password', 'full_name', 'role'];
        
        final missingFields = <String>[];
        for (final field in requiredIbuHamilFields) {
          if (!ibuHamilJson.containsKey(field) || ibuHamilJson[field] == null) {
            missingFields.add('ibu_hamil.$field');
          } else if (field == 'location' && ibuHamilJson[field] is List) {
            final loc = ibuHamilJson[field] as List;
            if (loc.length != 2) {
              missingFields.add('ibu_hamil.$field (harus 2 elemen, ada ${loc.length})');
            }
          } else if (ibuHamilJson[field] is String && (ibuHamilJson[field] as String).isEmpty) {
            missingFields.add('ibu_hamil.$field (kosong)');
          }
        }
        for (final field in requiredUserFields) {
          if (!userJson.containsKey(field) || userJson[field] == null) {
            missingFields.add('user.$field');
          } else if (userJson[field] is String && (userJson[field] as String).isEmpty) {
            missingFields.add('user.$field (kosong)');
          }
        }
        
        final formattedJson = const JsonEncoder.withIndent('  ').convert(requestJson);
        print('═══════════════════════════════════════════════════════════');
        print('📤 REQUEST BODY - REGISTRASI IBU HAMIL');
        print('═══════════════════════════════════════════════════════════');
        print(formattedJson);
        print('═══════════════════════════════════════════════════════════');
        
        if (missingFields.isNotEmpty) {
          print('⚠️ MISSING REQUIRED FIELDS: ${missingFields.join(", ")}');
          throw Exception('Field wajib belum terisi: ${missingFields.join(", ")}');
        } else {
          print('✅ Semua field wajib terisi');
        }
      } catch (e) {
        print('⚠️ Error validasi request JSON: $e');
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

      // Call registration API
      final registerResult = await authRepository.registerIbuHamil(requestModel);
      
      final registerSuccess = await registerResult.fold(
        (failure) async {
          state = state.copyWith(
            isSubmitting: false,
            error: failure.message,
          );
          return false;
        },
        (response) async {
          // Simpan token setelah registrasi
          final token = response.accessToken.trim();
          if (token.isNotEmpty) {
            ref.read(authTokenProvider.notifier).state = token;
            try {
              await AuthStorageService.saveAccessToken(token);
              print('✅ Token tersimpan setelah registrasi (panjang: ${token.length})');
            } catch (e) {
              print('⚠️ Gagal simpan token ke storage: $e');
            }
            ref.invalidate(dioProvider);
            await Future.delayed(const Duration(milliseconds: 100));
          }
          
          print('═══════════════════════════════════════════════════════════');
          print('✅ REGISTRASI IBU HAMIL BERHASIL');
          print('═══════════════════════════════════════════════════════════');
          print('Ibu Hamil ID: ${response.ibuHamil.id}');
          print('Nama: ${response.ibuHamil.namaLengkap}');
          print('User ID: ${response.user.id}');
          print('Access Token: ${response.accessToken.substring(0, 20)}...');
          print('═══════════════════════════════════════════════════════════');
          
          // Simpan response ke state untuk dipakai saat assign puskesmas
          state = state.copyWith(
            isSubmitting: false,
            registrationResponse: response,
          );
          return true;
        },
      );

      return registerSuccess;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
      return false;
    }
  }

  /// Step 2: Assign ibu hamil ke puskesmas (setelah registrasi berhasil)
  /// Dipanggil dari ConfirmPuskesmasScreen
  Future<bool> assignToPuskesmas({required int puskesmasId}) async {
    final registrationResponse = state.registrationResponse;
    
    if (registrationResponse == null) {
      state = state.copyWith(
        error: 'Data registrasi tidak ditemukan. Silakan ulangi registrasi.',
      );
      return false;
    }

    state = state.copyWith(isSubmitting: true, clearError: true);

    try {
      print('📤 Assigning ibu hamil to puskesmas...');
      print('   Puskesmas ID: $puskesmasId');
      print('   Ibu Hamil ID: ${registrationResponse.ibuHamil.id}');
      
      final assignResult = await authRepository.assignIbuHamilToPuskesmas(
        puskesmasId,
        registrationResponse.ibuHamil.id,
        registrationResponse.accessToken,
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
  /// 
  /// Struktur JSON sesuai backend:
  /// - user: { phone (WAJIB), password (WAJIB), full_name (WAJIB), email (OPSIONAL), role: "ibu_hamil" }
  /// - ibu_hamil: { nama_lengkap, nik, date_of_birth, address, location, emergency_contact_name, 
  ///               emergency_contact_phone (WAJIB), sisanya OPSIONAL }
  RegisterIbuHamilRequestModel _buildRegistrationRequest({
    required Map<String, dynamic> registerState,
    required Map<String, dynamic> medicalDataState,
  }) {
    // Build address string
    final addressParts = <String>[];
    if (registerState['jalan'] != null && registerState['jalan'].toString().isNotEmpty) {
      addressParts.add(registerState['jalan'].toString());
    }
    if (registerState['kelurahan'] != null && registerState['kelurahan'].toString().isNotEmpty) {
      addressParts.add(registerState['kelurahan'].toString());
    }
    if (registerState['kecamatan'] != null && registerState['kecamatan'].toString().isNotEmpty) {
      addressParts.add(registerState['kecamatan'].toString());
    }
    if (registerState['kota'] != null && registerState['kota'].toString().isNotEmpty) {
      addressParts.add(registerState['kota'].toString());
    }
    if (registerState['provinsi'] != null && registerState['provinsi'].toString().isNotEmpty) {
      addressParts.add(registerState['provinsi'].toString());
    }
    var address = addressParts.isNotEmpty
        ? addressParts.join(', ')
        : (registerState['alamat']?.toString().trim() ?? '');
    
    // Ensure address is not empty (required field)
    if (address.isEmpty) {
      final minimalAddress = [
        registerState['kecamatan']?.toString().trim(),
        registerState['kota']?.toString().trim(),
        registerState['provinsi']?.toString().trim(),
      ].where((s) => s != null && s.isNotEmpty).join(', ');
      if (minimalAddress.isNotEmpty) {
        address = minimalAddress;
      }
    }

    // Build location array [longitude, latitude] - WAJIB, array 2 elemen
    final location = <double>[];
    final longitude = registerState['longitude'];
    final latitude = registerState['latitude'];
    if (longitude != null && latitude != null) {
      final lng = (longitude is double) ? longitude : double.tryParse(longitude.toString());
      final lat = (latitude is double) ? latitude : double.tryParse(latitude.toString());
      if (lng != null && lat != null) {
        location.add(lng); // longitude first
        location.add(lat); // latitude second
      }
    }
    
    // Jika location masih kosong, coba geocoding dari alamat
    // Fallback: gunakan koordinat default Indonesia (Jakarta) daripada [0.0, 0.0]
    if (location.isEmpty) {
      // Default: Jakarta coordinates as fallback
      location.add(106.8456); // longitude
      location.add(-6.2088);  // latitude
      print('⚠️ Location not available, using Jakarta default coordinates');
    }

    // Format dates - YYYY-MM-DD sesuai backend
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

    // Required fields
    final namaLengkap = (registerState['namaLengkap']?.toString().trim() ?? '');
    final nik = (registerState['nik']?.toString().trim() ?? '');
    final emergencyContactName = (registerState['emergencyContactName']?.toString().trim() ?? '');
    final emergencyContactPhone = (registerState['emergencyContactPhone']?.toString().trim() ?? '');
    final phone = (registerState['phone']?.toString().trim() ?? '');
    final password = (registerState['password']?.toString() ?? '');

    // Optional fields - hanya kirim jika ada nilainya (non-empty)
    final kecamatan = registerState['kecamatan']?.toString().trim();
    final kotaKabupaten = registerState['kota']?.toString().trim();
    final provinsi = registerState['provinsi']?.toString().trim();
    final kelurahan = registerState['kelurahan']?.toString().trim();
    final emergencyContactRelation = registerState['emergencyContactRelation']?.toString().trim();
    
    // Email - OPSIONAL: set null jika kosong agar tidak dikirim ke backend
    final emailRaw = registerState['email']?.toString().trim() ?? '';
    final email = emailRaw.isNotEmpty ? emailRaw : null;

    // Blood type - OPSIONAL: hanya A, B, AB, O
    final bloodType = registerState['bloodType'] as String?;

    // Ensure address is not empty
    if (address.isEmpty) {
      throw Exception('Alamat harus diisi');
    }

    // Medical data - optional fields
    final hpht = medicalDataState['hpht'] as DateTime?;
    final hpl = medicalDataState['hpl'] as DateTime?;
    final usiaKehamilan = medicalDataState['usiaKehamilan'] as int?;
    final kehamilanKe = medicalDataState['kehamilanKe'] as int?;
    final jumlahAnak = medicalDataState['jumlahAnak'] as int?;
    final jumlahKeguguran = medicalDataState['jumlahKeguguran'] as int?;
    final jarakKehamilanTerakhir = medicalDataState['jarakKehamilanTerakhir'] as String?;
    final komplikasiKehamilanSebelumnya = medicalDataState['komplikasiKehamilanSebelumnya'] as String?;

    // Build riwayat kesehatan ibu (OPSIONAL)
    final riwayatKesehatanIbu = RiwayatKesehatanIbuData(
      darahTinggi: medicalDataState['darahTinggi'] as bool? ?? false,
      diabetes: medicalDataState['diabetes'] as bool? ?? false,
      anemia: medicalDataState['anemia'] as bool? ?? false,
      penyakitJantung: medicalDataState['penyakitJantung'] as bool? ?? false,
      asma: medicalDataState['asma'] as bool? ?? false,
      penyakitGinjal: medicalDataState['penyakitGinjal'] as bool? ?? false,
      tbcMalaria: medicalDataState['tbcMalaria'] as bool? ?? false,
    );

    final request = RegisterIbuHamilRequestModel(
      ibuHamil: IbuHamilData(
        // === FIELD WAJIB ===
        namaLengkap: namaLengkap,
        nik: nik,
        dateOfBirth: dateOfBirthString,
        address: address,
        location: location, // [longitude, latitude]
        emergencyContactName: emergencyContactName,
        emergencyContactPhone: emergencyContactPhone,
        // === FIELD OPSIONAL - hanya kirim jika ada nilai ===
        bloodType: bloodType,
        age: calculateAge(tanggalLahir),
        emergencyContactRelation: (emergencyContactRelation != null && emergencyContactRelation.isNotEmpty) ? emergencyContactRelation : null,
        provinsi: (provinsi != null && provinsi.isNotEmpty) ? provinsi : null,
        kotaKabupaten: (kotaKabupaten != null && kotaKabupaten.isNotEmpty) ? kotaKabupaten : null,
        kecamatan: (kecamatan != null && kecamatan.isNotEmpty) ? kecamatan : null,
        kelurahan: (kelurahan != null && kelurahan.isNotEmpty) ? kelurahan : null,
        lastMenstrualPeriod: formatDate(hpht),
        estimatedDueDate: formatDate(hpl),
        usiaKehamilan: usiaKehamilan,
        kehamilanKe: kehamilanKe,
        jumlahAnak: jumlahAnak,
        jarakKehamilanTerakhir: (jarakKehamilanTerakhir != null && jarakKehamilanTerakhir.isNotEmpty) ? jarakKehamilanTerakhir : null,
        miscarriageNumber: jumlahKeguguran,
        previousPregnancyComplications: (komplikasiKehamilanSebelumnya != null && komplikasiKehamilanSebelumnya.isNotEmpty) ? komplikasiKehamilanSebelumnya : null,
        pernahCaesar: medicalDataState['pernahCaesar'] as bool? ?? false,
        pernahPerdarahanSaatHamil: medicalDataState['pernahPerdarahanSaatHamil'] as bool? ?? false,
        riwayatKesehatanIbu: riwayatKesehatanIbu,
        healthcarePreference: 'puskesmas',
        whatsappConsent: medicalDataState['whatsappConsent'] as bool? ?? true,
        dataSharingConsent: medicalDataState['dataSharingConsent'] as bool? ?? false,
      ),
      user: UserData(
        // === FIELD WAJIB ===
        phone: phone,
        password: password,
        fullName: namaLengkap,
        role: 'ibu_hamil',
        // === FIELD OPSIONAL - null jika kosong, tidak akan dikirim ===
        email: email,
      ),
    );

    return request;
  }

  /// Validate request model for required fields sesuai backend
  /// 
  /// Backend required fields:
  /// - user: phone (8-15 digit), password (min 6 char), full_name
  /// - ibu_hamil: nama_lengkap, nik (16 digit), date_of_birth (YYYY-MM-DD), 
  ///             address, location ([lon, lat]), emergency_contact_name, emergency_contact_phone
  String? _validateRequestModel(RegisterIbuHamilRequestModel request) {
    final ibuHamil = request.ibuHamil;
    final user = request.user;
    
    // === Validate user REQUIRED fields ===
    if (user.phone.trim().isEmpty) {
      return 'Nomor telepon harus diisi';
    }
    // Backend: phone 8-15 digit, boleh awalan +
    final phoneDigits = user.phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (phoneDigits.length < 8 || phoneDigits.length > 15) {
      return 'Nomor telepon harus 8-15 digit';
    }
    if (user.password.trim().isEmpty) {
      return 'Password harus diisi';
    }
    if (user.password.length < 6) {
      return 'Password minimal 6 karakter';
    }
    if (user.fullName.trim().isEmpty) {
      return 'Nama lengkap harus diisi';
    }
    
    // === Validate ibu_hamil REQUIRED fields ===
    if (ibuHamil.namaLengkap.trim().isEmpty) {
      return 'Nama lengkap harus diisi';
    }
    if (ibuHamil.nik.trim().isEmpty) {
      return 'NIK harus diisi';
    }
    // Backend: NIK tepat 16 digit angka
    if (ibuHamil.nik.length != 16 || !RegExp(r'^\d{16}$').hasMatch(ibuHamil.nik)) {
      return 'NIK harus tepat 16 digit angka';
    }
    if (ibuHamil.dateOfBirth.trim().isEmpty) {
      return 'Tanggal lahir harus diisi';
    }
    // Backend: format YYYY-MM-DD
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(ibuHamil.dateOfBirth)) {
      return 'Format tanggal lahir harus YYYY-MM-DD';
    }
    if (ibuHamil.address.trim().isEmpty) {
      return 'Alamat harus diisi';
    }
    // Backend: location = [longitude, latitude], array 2 elemen
    if (ibuHamil.location.length != 2) {
      return 'Lokasi harus berisi 2 elemen [longitude, latitude]';
    }
    // Validate longitude (-180 to 180) and latitude (-90 to 90)
    final lng = ibuHamil.location[0];
    final lat = ibuHamil.location[1];
    if (lng < -180 || lng > 180) {
      return 'Longitude harus antara -180 dan 180';
    }
    if (lat < -90 || lat > 90) {
      return 'Latitude harus antara -90 dan 90';
    }
    if (ibuHamil.emergencyContactName.trim().isEmpty) {
      return 'Nama kontak darurat harus diisi';
    }
    if (ibuHamil.emergencyContactPhone.trim().isEmpty) {
      return 'Nomor telepon kontak darurat harus diisi';
    }
    // Backend: emergency_contact_phone 8-15 digit
    final ecPhoneDigits = ibuHamil.emergencyContactPhone.replaceAll(RegExp(r'[^0-9]'), '');
    if (ecPhoneDigits.length < 8 || ecPhoneDigits.length > 15) {
      return 'Nomor telepon kontak darurat harus 8-15 digit';
    }
    
    // === Validate optional fields format ===
    // blood_type: hanya A, B, AB, O
    if (ibuHamil.bloodType != null && !['A', 'B', 'AB', 'O'].contains(ibuHamil.bloodType)) {
      return 'Golongan darah harus A, B, AB, atau O';
    }
    // email format (jika ada)
    final emailValue = user.email;
    if (emailValue != null && emailValue.isNotEmpty) {
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(emailValue)) {
        return 'Format email tidak valid';
      }
    }
    
    return null;
  }
}
