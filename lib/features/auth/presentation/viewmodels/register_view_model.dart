import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/core/models/wilayah_indonesia.dart';
import 'package:wellmom_app/core/services/location_service.dart';
import 'package:wellmom_app/core/services/wilayah_service.dart';
import 'package:wellmom_app/core/utils/address_builder.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_form_entity.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';

/// State for register form
class RegisterState {
  final String namaLengkap;
  final String nik;
  final DateTime? tanggalLahir;
  final String alamat;
  final String jalan;
  final String kelurahan;
  final String kecamatan;
  final String kota;
  final String provinsi;
  final String provinsiId;
  final String kotaId;
  final String kecamatanId;
  final String kodePos;
  final double? latitude;
  final double? longitude;
  final Position? currentPosition;
  final bool isLoadingLocation;
  final String? locationError;
  final bool isSubmitting;
  final String? error;
  
  // User credentials (for registration)
  final String email;
  final String phone;
  final String password;
  
  // Emergency contact and blood type
  final String? bloodType;
  final String emergencyContactName;
  final String emergencyContactPhone;
  final String? emergencyContactRelation;
  
  // Dropdown states
  final List<Provinsi> provinces;
  final List<KotaKabupaten> regencies;
  final List<Kecamatan> districts;
  final bool isLoadingProvinces;
  final bool isLoadingRegencies;
  final bool isLoadingDistricts;
  final String? wilayahError;

  const RegisterState({
    this.namaLengkap = '',
    this.nik = '',
    this.tanggalLahir,
    this.alamat = '',
    this.jalan = '',
    this.kelurahan = '',
    this.kecamatan = '',
    this.kota = '',
    this.provinsi = '',
    this.provinsiId = '',
    this.kotaId = '',
    this.kecamatanId = '',
    this.kodePos = '',
    this.latitude,
    this.longitude,
    this.currentPosition,
    this.isLoadingLocation = false,
    this.locationError,
    this.isSubmitting = false,
    this.error,
    this.email = '',
    this.phone = '',
    this.password = '',
    this.bloodType,
    this.emergencyContactName = '',
    this.emergencyContactPhone = '',
    this.emergencyContactRelation,
    this.provinces = const [],
    this.regencies = const [],
    this.districts = const [],
    this.isLoadingProvinces = false,
    this.isLoadingRegencies = false,
    this.isLoadingDistricts = false,
    this.wilayahError,
  });

  RegisterState copyWith({
    String? namaLengkap,
    String? nik,
    DateTime? tanggalLahir,
    String? alamat,
    String? jalan,
    String? kelurahan,
    String? kecamatan,
    String? kota,
    String? provinsi,
    String? provinsiId,
    String? kotaId,
    String? kecamatanId,
    String? kodePos,
    double? latitude,
    double? longitude,
    Position? currentPosition,
    bool? isLoadingLocation,
    String? locationError,
    bool? isSubmitting,
    String? error,
    String? email,
    String? phone,
    String? password,
    String? bloodType,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? emergencyContactRelation,
    List<Provinsi>? provinces,
    List<KotaKabupaten>? regencies,
    List<Kecamatan>? districts,
    bool? isLoadingProvinces,
    bool? isLoadingRegencies,
    bool? isLoadingDistricts,
    String? wilayahError,
    bool clearLocationError = false,
    bool clearError = false,
    bool clearWilayahError = false,
  }) {
    return RegisterState(
      namaLengkap: namaLengkap ?? this.namaLengkap,
      nik: nik ?? this.nik,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      alamat: alamat ?? this.alamat,
      jalan: jalan ?? this.jalan,
      kelurahan: kelurahan ?? this.kelurahan,
      kecamatan: kecamatan ?? this.kecamatan,
      kota: kota ?? this.kota,
      provinsi: provinsi ?? this.provinsi,
      provinsiId: provinsiId ?? this.provinsiId,
      kotaId: kotaId ?? this.kotaId,
      kecamatanId: kecamatanId ?? this.kecamatanId,
      kodePos: kodePos ?? this.kodePos,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      currentPosition: currentPosition ?? this.currentPosition,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      locationError: clearLocationError ? null : (locationError ?? this.locationError),
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: clearError ? null : (error ?? this.error),
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      bloodType: bloodType ?? this.bloodType,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone: emergencyContactPhone ?? this.emergencyContactPhone,
      emergencyContactRelation: emergencyContactRelation ?? this.emergencyContactRelation,
      provinces: provinces ?? this.provinces,
      regencies: regencies ?? this.regencies,
      districts: districts ?? this.districts,
      isLoadingProvinces: isLoadingProvinces ?? this.isLoadingProvinces,
      isLoadingRegencies: isLoadingRegencies ?? this.isLoadingRegencies,
      isLoadingDistricts: isLoadingDistricts ?? this.isLoadingDistricts,
      wilayahError: clearWilayahError ? null : (wilayahError ?? this.wilayahError),
    );
  }

  /// Get formatted date string
  String? get formattedDate {
    if (tanggalLahir == null) return null;
    return DateFormatter.formatDate(tanggalLahir!);
  }

  /// Build full address from components
  String get fullAddress {
    final parts = <String>[];
    if (jalan.isNotEmpty) parts.add(jalan);
    if (kelurahan.isNotEmpty) parts.add(kelurahan);
    if (kecamatan.isNotEmpty) parts.add(kecamatan);
    if (kota.isNotEmpty) parts.add(kota);
    if (provinsi.isNotEmpty) parts.add(provinsi);
    if (kodePos.isNotEmpty) parts.add(kodePos);
    return parts.join(', ');
  }

  /// Check if form is valid
  bool get isValid {
    return namaLengkap.isNotEmpty &&
        nik.isNotEmpty &&
        nik.length == 16 &&
        tanggalLahir != null &&
        (alamat.isNotEmpty || fullAddress.isNotEmpty);
  }
}

/// ViewModel for register screen
class RegisterViewModel extends StateNotifier<RegisterState> {
  final AuthRepository authRepository;
  final LocationService locationService;
  final WilayahService wilayahService;

  RegisterViewModel({
    required this.authRepository,
    required this.locationService,
    required this.wilayahService,
  }) : super(const RegisterState()) {
    // Load provinces on initialization
    loadProvinces();
  }

  /// Update nama lengkap
  void updateNamaLengkap(String value) {
    state = state.copyWith(namaLengkap: value, clearError: true);
  }

  /// Update NIK
  void updateNik(String value) {
    state = state.copyWith(nik: value, clearError: true);
  }

  /// Update tanggal lahir
  void updateTanggalLahir(DateTime date) {
    state = state.copyWith(tanggalLahir: date, clearError: true);
  }

  /// Update alamat
  void updateAlamat(String value) {
    state = state.copyWith(alamat: value, clearError: true);
  }

  /// Update jalan
  void updateJalan(String value) {
    state = state.copyWith(jalan: value, clearError: true);
  }

  /// Update kelurahan
  void updateKelurahan(String value) {
    state = state.copyWith(kelurahan: value, clearError: true);
  }

  /// Update provinsi
  void updateProvinsi(String value, String provinsiId) {
    state = state.copyWith(
      provinsi: value,
      provinsiId: provinsiId,
      kota: '',
      kotaId: '',
      kecamatan: '',
      kecamatanId: '',
      regencies: [],
      districts: [],
      clearError: true,
    );
    // Load regencies when provinsi is selected
    if (provinsiId.isNotEmpty) {
      loadRegencies(provinsiId);
    }
  }

  /// Update kota/kabupaten
  void updateKota(String value, String kotaId) {
    state = state.copyWith(
      kota: value,
      kotaId: kotaId,
      kecamatan: '',
      kecamatanId: '',
      districts: [],
      clearError: true,
    );
    // Load districts when kota is selected
    if (kotaId.isNotEmpty) {
      loadDistricts(kotaId);
    }
  }

  /// Update kecamatan
  void updateKecamatan(String value, String kecamatanId) {
    state = state.copyWith(
      kecamatan: value,
      kecamatanId: kecamatanId,
      clearError: true,
    );
  }

  /// Update latitude and longitude
  void updateLocation(double? latitude, double? longitude) {
    state = state.copyWith(
      latitude: latitude,
      longitude: longitude,
      clearError: true,
    );
  }

  /// Update kode pos
  void updateKodePos(String value) {
    state = state.copyWith(kodePos: value, clearError: true);
  }

  /// Update email
  void updateEmail(String value) {
    state = state.copyWith(email: value.trim(), clearError: true);
  }

  /// Update phone
  void updatePhone(String value) {
    state = state.copyWith(phone: value.trim(), clearError: true);
  }

  /// Update password
  void updatePassword(String value) {
    state = state.copyWith(password: value, clearError: true);
  }

  /// Update blood type
  void updateBloodType(String? value) {
    state = state.copyWith(bloodType: value, clearError: true);
  }

  /// Update emergency contact name
  void updateEmergencyContactName(String value) {
    state = state.copyWith(emergencyContactName: value.trim(), clearError: true);
  }

  /// Update emergency contact phone
  void updateEmergencyContactPhone(String value) {
    state = state.copyWith(emergencyContactPhone: value.trim(), clearError: true);
  }

  /// Update emergency contact relation
  void updateEmergencyContactRelation(String? value) {
    state = state.copyWith(emergencyContactRelation: value?.trim(), clearError: true);
  }

  /// Load provinces from API
  Future<void> loadProvinces() async {
    state = state.copyWith(
      isLoadingProvinces: true,
      clearWilayahError: true,
    );

    try {
      final provinces = await wilayahService.getProvinces();
      state = state.copyWith(
        provinces: provinces,
        isLoadingProvinces: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingProvinces: false,
        wilayahError: 'Gagal memuat data provinsi: ${e.toString()}',
      );
    }
  }

  /// Load regencies (Kota/Kabupaten) by province ID
  Future<void> loadRegencies(String provinceId) async {
    state = state.copyWith(
      isLoadingRegencies: true,
      clearWilayahError: true,
    );

    try {
      final regencies = await wilayahService.getRegencies(provinceId);
      state = state.copyWith(
        regencies: regencies,
        isLoadingRegencies: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingRegencies: false,
        wilayahError: 'Gagal memuat data kota/kabupaten: ${e.toString()}',
      );
    }
  }

  /// Load districts (Kecamatan) by regency ID
  Future<void> loadDistricts(String regencyId) async {
    state = state.copyWith(
      isLoadingDistricts: true,
      clearWilayahError: true,
    );

    try {
      final districts = await wilayahService.getDistricts(regencyId);
      state = state.copyWith(
        districts: districts,
        isLoadingDistricts: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingDistricts: false,
        wilayahError: 'Gagal memuat data kecamatan: ${e.toString()}',
      );
    }
  }

  /// Parse Placemark to address fields
  void _parsePlacemarkToAddress(Placemark placemark) {
    state = state.copyWith(
      jalan: placemark.street ?? '',
      kelurahan: placemark.subLocality ?? '',
      kecamatan: placemark.locality ?? '',
      kota: placemark.subAdministrativeArea ?? '',
      provinsi: placemark.administrativeArea ?? '',
      kodePos: placemark.postalCode ?? '',
      alamat: AddressBuilder.buildAddressString(placemark),
    );
  }

  /// Get current location
  Future<void> getCurrentLocation() async {
    state = state.copyWith(
      isLoadingLocation: true,
      clearLocationError: true,
      clearError: true,
    );

    try {
      final (position, address) =
          await locationService.getCurrentLocationWithAddress();

      // Get detailed address components from reverse geocoding
      try {
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          _parsePlacemarkToAddress(placemarks[0]);
        }
      } catch (e) {
        // If reverse geocoding fails, use the address from location service
        state = state.copyWith(
          alamat: address.isNotEmpty ? address : state.alamat,
        );
      }

      state = state.copyWith(
        currentPosition: position,
        isLoadingLocation: false,
        clearLocationError: true,
      );
    } on LocationFailure catch (e) {
      state = state.copyWith(
        isLoadingLocation: false,
        locationError: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingLocation: false,
        locationError: 'Gagal mendapatkan lokasi: ${e.toString()}',
      );
    }
  }

  /// Get coordinates from address (geocoding)
  Future<void> geocodeAddress() async {
    if (state.provinsi.isEmpty || state.kota.isEmpty || state.kecamatan.isEmpty) {
      return;
    }

    try {
      // Build address string for geocoding
      final addressString = [
        state.jalan,
        state.kecamatan,
        state.kota,
        state.provinsi,
        'Indonesia',
      ].where((s) => s.isNotEmpty).join(', ');

      // Geocode address to get coordinates
      final List<Location> locations = await locationFromAddress(addressString);
      
      if (locations.isNotEmpty) {
        state = state.copyWith(
          latitude: locations[0].latitude,
          longitude: locations[0].longitude,
        );
      }
    } catch (_) {
      // Geocoding failed, coordinates will remain null
    }
  }

  /// Submit registration form
  Future<bool> submit() async {
    if (!state.isValid) {
      state = state.copyWith(error: 'Mohon lengkapi semua field');
      return false;
    }

    state = state.copyWith(isSubmitting: true, clearError: true);

    try {
      // Try to geocode address if coordinates are not available
      if (state.latitude == null && state.longitude == null) {
        await geocodeAddress();
      }

      // Build alamat from components if alamat is empty
      final finalAlamat = state.alamat.isNotEmpty 
          ? state.alamat 
          : state.fullAddress;

      final form = RegisterFormEntity(
        namaLengkap: state.namaLengkap,
        nik: state.nik,
        tanggalLahir: state.tanggalLahir!,
        alamat: finalAlamat,
        latitude: state.latitude ?? state.currentPosition?.latitude,
        longitude: state.longitude ?? state.currentPosition?.longitude,
      );

      final result = await authRepository.register(form);

      return result.fold(
        (failure) {
          state = state.copyWith(
            isSubmitting: false,
            error: failure.message,
          );
          return false;
        },
        (user) {
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
}
