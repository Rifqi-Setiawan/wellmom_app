import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_ibu_hamil_response_entity.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';

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

class ConfirmRegistrationViewModel
    extends StateNotifier<ConfirmRegistrationState> {
  final AuthRepository authRepository;

  ConfirmRegistrationViewModel({
    required this.authRepository,
  }) : super(const ConfirmRegistrationState());

  Future<bool> registerIbuHamil({
    required Map<String, dynamic> registerState,
    required Map<String, dynamic> medicalDataState,
  }) async {
    state = state.copyWith(isSubmitting: true, clearError: true);

    try {
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

      final emergencyContactName =
          registerState['emergencyContactName']?.toString().trim() ?? '';
      final emergencyContactPhone =
          registerState['emergencyContactPhone']?.toString().trim() ?? '';

      if (emergencyContactName.isEmpty || emergencyContactPhone.isEmpty) {
        state = state.copyWith(
          isSubmitting: false,
          error: 'Nama dan nomor telepon kontak darurat harus diisi',
        );
        return false;
      }

      final requestModel = _buildRegistrationRequest(
        registerState: registerState,
        medicalDataState: medicalDataState,
      );

      final validationError = _validateRequestModel(requestModel);
      if (validationError != null) {
        state = state.copyWith(isSubmitting: false, error: validationError);
        return false;
      }

      final registerResult = await authRepository.registerIbuHamil(requestModel);

      final registerSuccess = await registerResult.fold(
        (failure) async {
          state = state.copyWith(isSubmitting: false, error: failure.message);
          return false;
        },
        (response) async {
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
      final assignResult = await authRepository.assignIbuHamilToPuskesmas(
        puskesmasId,
        registrationResponse.ibuHamil.id,
        registrationResponse.accessToken,
      );

      return assignResult.fold(
        (failure) {
          state = state.copyWith(isSubmitting: false, error: failure.message);
          return false;
        },
        (_) {
          state = state.copyWith(isSubmitting: false);
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

  RegisterIbuHamilRequestModel _buildRegistrationRequest({
    required Map<String, dynamic> registerState,
    required Map<String, dynamic> medicalDataState,
  }) {
    final addressParts = <String>[];
    for (final key in ['jalan', 'kelurahan', 'kecamatan', 'kota', 'provinsi']) {
      final value = registerState[key]?.toString().trim();
      if (value != null && value.isNotEmpty) addressParts.add(value);
    }
    var address = addressParts.isNotEmpty
        ? addressParts.join(', ')
        : (registerState['alamat']?.toString().trim() ?? '');

    if (address.isEmpty) {
      final minimalAddress = [
        registerState['kecamatan']?.toString().trim(),
        registerState['kota']?.toString().trim(),
        registerState['provinsi']?.toString().trim(),
      ].where((s) => s != null && s.isNotEmpty).join(', ');
      if (minimalAddress.isNotEmpty) address = minimalAddress;
    }

    final location = <double>[];
    final longitude = registerState['longitude'];
    final latitude = registerState['latitude'];
    if (longitude != null && latitude != null) {
      final lng = (longitude is double)
          ? longitude
          : double.tryParse(longitude.toString());
      final lat = (latitude is double)
          ? latitude
          : double.tryParse(latitude.toString());
      if (lng != null && lat != null) {
        location.add(lng);
        location.add(lat);
      }
    }

    if (location.isEmpty) {
      location.add(106.8456);
      location.add(-6.2088);
    }

    String? formatDate(DateTime? date) {
      if (date == null) return null;
      return DateFormatter.formatDateForApi(date);
    }

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

    final tanggalLahir = registerState['tanggalLahir'] as DateTime?;
    if (tanggalLahir == null) throw Exception('Tanggal lahir harus diisi');

    final dateOfBirthString = formatDate(tanggalLahir);
    if (dateOfBirthString == null || dateOfBirthString.isEmpty) {
      throw Exception('Format tanggal lahir tidak valid');
    }

    final namaLengkap = registerState['namaLengkap']?.toString().trim() ?? '';
    final nik = registerState['nik']?.toString().trim() ?? '';
    final emergencyContactName =
        registerState['emergencyContactName']?.toString().trim() ?? '';
    final emergencyContactPhone =
        registerState['emergencyContactPhone']?.toString().trim() ?? '';
    final phone = registerState['phone']?.toString().trim() ?? '';
    final password = registerState['password']?.toString() ?? '';

    final kecamatan = registerState['kecamatan']?.toString().trim();
    final kotaKabupaten = registerState['kota']?.toString().trim();
    final provinsi = registerState['provinsi']?.toString().trim();
    final kelurahan = registerState['kelurahan']?.toString().trim();
    final emergencyContactRelation =
        registerState['emergencyContactRelation']?.toString().trim();

    final emailRaw = registerState['email']?.toString().trim() ?? '';
    final email = emailRaw.isNotEmpty ? emailRaw : null;
    final bloodType = registerState['bloodType'] as String?;

    if (address.isEmpty) throw Exception('Alamat harus diisi');

    final hpht = medicalDataState['hpht'] as DateTime?;
    final hpl = medicalDataState['hpl'] as DateTime?;
    final usiaKehamilan = medicalDataState['usiaKehamilan'] as int?;
    final kehamilanKe = medicalDataState['kehamilanKe'] as int?;
    final jumlahAnak = medicalDataState['jumlahAnak'] as int?;
    final jumlahKeguguran = medicalDataState['jumlahKeguguran'] as int?;
    final jarakKehamilanTerakhir =
        medicalDataState['jarakKehamilanTerakhir'] as String?;
    final komplikasiKehamilanSebelumnya =
        medicalDataState['komplikasiKehamilanSebelumnya'] as String?;

    final riwayatKesehatanIbu = RiwayatKesehatanIbuData(
      darahTinggi: medicalDataState['darahTinggi'] as bool? ?? false,
      diabetes: medicalDataState['diabetes'] as bool? ?? false,
      anemia: medicalDataState['anemia'] as bool? ?? false,
      penyakitJantung: medicalDataState['penyakitJantung'] as bool? ?? false,
      asma: medicalDataState['asma'] as bool? ?? false,
      penyakitGinjal: medicalDataState['penyakitGinjal'] as bool? ?? false,
      tbcMalaria: medicalDataState['tbcMalaria'] as bool? ?? false,
    );

    return RegisterIbuHamilRequestModel(
      ibuHamil: IbuHamilData(
        namaLengkap: namaLengkap,
        nik: nik,
        dateOfBirth: dateOfBirthString,
        address: address,
        location: location,
        emergencyContactName: emergencyContactName,
        emergencyContactPhone: emergencyContactPhone,
        bloodType: bloodType,
        age: calculateAge(tanggalLahir),
        emergencyContactRelation:
            (emergencyContactRelation != null && emergencyContactRelation.isNotEmpty)
                ? emergencyContactRelation
                : null,
        provinsi: (provinsi != null && provinsi.isNotEmpty) ? provinsi : null,
        kotaKabupaten:
            (kotaKabupaten != null && kotaKabupaten.isNotEmpty) ? kotaKabupaten : null,
        kecamatan: (kecamatan != null && kecamatan.isNotEmpty) ? kecamatan : null,
        kelurahan: (kelurahan != null && kelurahan.isNotEmpty) ? kelurahan : null,
        lastMenstrualPeriod: formatDate(hpht),
        estimatedDueDate: formatDate(hpl),
        usiaKehamilan: usiaKehamilan,
        kehamilanKe: kehamilanKe,
        jumlahAnak: jumlahAnak,
        jarakKehamilanTerakhir:
            (jarakKehamilanTerakhir != null && jarakKehamilanTerakhir.isNotEmpty)
                ? jarakKehamilanTerakhir
                : null,
        miscarriageNumber: jumlahKeguguran,
        previousPregnancyComplications:
            (komplikasiKehamilanSebelumnya != null &&
                    komplikasiKehamilanSebelumnya.isNotEmpty)
                ? komplikasiKehamilanSebelumnya
                : null,
        pernahCaesar: medicalDataState['pernahCaesar'] as bool? ?? false,
        pernahPerdarahanSaatHamil:
            medicalDataState['pernahPerdarahanSaatHamil'] as bool? ?? false,
        riwayatKesehatanIbu: riwayatKesehatanIbu,
        healthcarePreference: 'puskesmas',
        whatsappConsent: medicalDataState['whatsappConsent'] as bool? ?? true,
        dataSharingConsent: medicalDataState['dataSharingConsent'] as bool? ?? false,
      ),
      user: UserData(
        phone: phone,
        password: password,
        fullName: namaLengkap,
        role: 'ibu_hamil',
        email: email,
      ),
    );
  }

  String? _validateRequestModel(RegisterIbuHamilRequestModel request) {
    final ibuHamil = request.ibuHamil;
    final user = request.user;

    if (user.phone.trim().isEmpty) return 'Nomor telepon harus diisi';
    final phoneDigits = user.phone.replaceAll(RegExp(r'[^0-9]'), '');
    if (phoneDigits.length < 8 || phoneDigits.length > 15) {
      return 'Nomor telepon harus 8-15 digit';
    }
    if (user.password.trim().isEmpty) return 'Password harus diisi';
    if (user.password.length < 6) return 'Password minimal 6 karakter';
    if (user.fullName.trim().isEmpty) return 'Nama lengkap harus diisi';

    if (ibuHamil.namaLengkap.trim().isEmpty) return 'Nama lengkap harus diisi';
    if (ibuHamil.nik.trim().isEmpty) return 'NIK harus diisi';
    if (ibuHamil.nik.length != 16 || !RegExp(r'^\d{16}$').hasMatch(ibuHamil.nik)) {
      return 'NIK harus tepat 16 digit angka';
    }
    if (ibuHamil.dateOfBirth.trim().isEmpty) return 'Tanggal lahir harus diisi';
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(ibuHamil.dateOfBirth)) {
      return 'Format tanggal lahir harus YYYY-MM-DD';
    }
    if (ibuHamil.address.trim().isEmpty) return 'Alamat harus diisi';
    if (ibuHamil.location.length != 2) {
      return 'Lokasi harus berisi 2 elemen [longitude, latitude]';
    }

    final lng = ibuHamil.location[0];
    final lat = ibuHamil.location[1];
    if (lng < -180 || lng > 180) return 'Longitude harus antara -180 dan 180';
    if (lat < -90 || lat > 90) return 'Latitude harus antara -90 dan 90';

    if (ibuHamil.emergencyContactName.trim().isEmpty) {
      return 'Nama kontak darurat harus diisi';
    }
    if (ibuHamil.emergencyContactPhone.trim().isEmpty) {
      return 'Nomor telepon kontak darurat harus diisi';
    }
    final ecPhoneDigits =
        ibuHamil.emergencyContactPhone.replaceAll(RegExp(r'[^0-9]'), '');
    if (ecPhoneDigits.length < 8 || ecPhoneDigits.length > 15) {
      return 'Nomor telepon kontak darurat harus 8-15 digit';
    }

    if (ibuHamil.bloodType != null &&
        !['A', 'B', 'AB', 'O'].contains(ibuHamil.bloodType)) {
      return 'Golongan darah harus A, B, AB, atau O';
    }
    final emailValue = user.email;
    if (emailValue != null && emailValue.isNotEmpty) {
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(emailValue)) {
        return 'Format email tidak valid';
      }
    }

    return null;
  }
}
