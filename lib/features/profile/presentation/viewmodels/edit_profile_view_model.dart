import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wellmom_app/core/models/wilayah_indonesia.dart';
import 'package:wellmom_app/core/services/location_service.dart';
import 'package:wellmom_app/core/services/wilayah_service.dart';
import 'package:wellmom_app/core/utils/address_builder.dart';
import 'package:wellmom_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:wellmom_app/features/profile/data/models/update_profile_request_model.dart';

part 'edit_profile_view_model.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    // Form fields
    @Default('') String namaLengkap,
    @Default('') String nik,
    DateTime? dateOfBirth,
    @Default('') String address,
    @Default('') String jalan,
    
    // Location
    Position? currentPosition,
    @Default([0.0, 0.0]) List<double> location, // [longitude, latitude]
    
    // Wilayah dropdowns
    @Default([]) List<Provinsi> provinces,
    @Default([]) List<KotaKabupaten> regencies,
    @Default([]) List<Kecamatan> districts,
    Provinsi? selectedProvinsi,
    KotaKabupaten? selectedKota,
    Kecamatan? selectedKecamatan,
    @Default('') String provinsiId,
    @Default('') String kotaId,
    @Default('') String kecamatanId,
    @Default('') String provinsiName,
    @Default('') String kotaName,
    @Default('') String kecamatanName,
    @Default('') String kelurahan,
    
    // Loading states
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingLocation,
    @Default(false) bool isLoadingProvinces,
    @Default(false) bool isLoadingRegencies,
    @Default(false) bool isLoadingDistricts,
    
    // Error states
    String? error,
    String? locationError,
    String? wilayahError,
  }) = _EditProfileState;
}

class EditProfileViewModel extends StateNotifier<EditProfileState> {
  final ProfileRemoteDataSource profileDataSource;
  final LocationService locationService;
  final WilayahService wilayahService;

  EditProfileViewModel({
    required this.profileDataSource,
    required this.locationService,
    required this.wilayahService,
  }) : super(const EditProfileState()) {
    loadProvinces();
  }

  /// Load initial profile data
  Future<void> loadProfile() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final profile = await profileDataSource.getProfile();
      final ibuHamil = profile.ibuHamil;
      
      // Parse date of birth
      DateTime? dob;
      try {
        dob = DateTime.parse(ibuHamil.dateOfBirth);
      } catch (e) {
        // Invalid date format
      }
      
      // Set form fields
      state = state.copyWith(
        namaLengkap: ibuHamil.namaLengkap,
        nik: ibuHamil.nik,
        dateOfBirth: dob,
        address: ibuHamil.address,
        location: ibuHamil.location,
        provinsiName: ibuHamil.provinsi ?? '',
        kotaName: ibuHamil.kotaKabupaten ?? '',
        kecamatanName: ibuHamil.kecamatan ?? '',
        kelurahan: ibuHamil.kelurahan ?? '',
        isLoading: false,
      );
      
      // If location exists, set current position
      if (ibuHamil.location.length >= 2) {
        state = state.copyWith(
          currentPosition: Position(
            latitude: ibuHamil.location[1],
            longitude: ibuHamil.location[0],
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            altitudeAccuracy: 0,
            heading: 0,
            headingAccuracy: 0,
            speed: 0,
            speedAccuracy: 0,
          ),
        );
      }
      
      // Load and select wilayah if available
      if (ibuHamil.provinsi != null) {
        await _selectProvinsiByName(ibuHamil.provinsi!);
      }
      if (ibuHamil.kotaKabupaten != null && state.provinsiId.isNotEmpty) {
        await _selectKotaByName(ibuHamil.kotaKabupaten!);
      }
      if (ibuHamil.kecamatan != null && state.kotaId.isNotEmpty) {
        await _selectKecamatanByName(ibuHamil.kecamatan!);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  /// Load provinces
  Future<void> loadProvinces() async {
    state = state.copyWith(isLoadingProvinces: true);
    try {
      final provinces = await wilayahService.getProvinces();
      state = state.copyWith(
        provinces: provinces,
        isLoadingProvinces: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingProvinces: false,
        wilayahError: 'Gagal memuat provinsi: ${e.toString()}',
      );
    }
  }

  /// Select provinsi by name (for initial load)
  Future<void> _selectProvinsiByName(String name) async {
    try {
      final provinsi = state.provinces.firstWhere(
        (p) => p.name == name,
      );
      await updateProvinsi(provinsi.name, provinsi.id);
    } catch (e) {
      // Not found, ignore
    }
  }

  /// Update provinsi
  Future<void> updateProvinsi(String name, String id) async {
    state = state.copyWith(
      selectedProvinsi: state.provinces.firstWhere((p) => p.id == id),
      provinsiName: name,
      provinsiId: id,
      selectedKota: null,
      selectedKecamatan: null,
      kotaName: '',
      kotaId: '',
      kecamatanName: '',
      kecamatanId: '',
      regencies: [],
      districts: [],
      wilayahError: null,
    );
    await loadRegencies(id);
    _buildAddressString();
  }

  /// Load regencies
  Future<void> loadRegencies(String provinceId) async {
    state = state.copyWith(isLoadingRegencies: true);
    try {
      final regencies = await wilayahService.getRegencies(provinceId);
      state = state.copyWith(
        regencies: regencies,
        isLoadingRegencies: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingRegencies: false,
        wilayahError: 'Gagal memuat kota/kabupaten: ${e.toString()}',
      );
    }
  }

  /// Select kota by name (for initial load)
  Future<void> _selectKotaByName(String name) async {
    try {
      final kota = state.regencies.firstWhere(
        (k) => k.name == name,
      );
      await updateKota(kota.name, kota.id);
    } catch (e) {
      // Not found, ignore
    }
  }

  /// Update kota
  Future<void> updateKota(String name, String id) async {
    state = state.copyWith(
      selectedKota: state.regencies.firstWhere((k) => k.id == id),
      kotaName: name,
      kotaId: id,
      selectedKecamatan: null,
      kecamatanName: '',
      kecamatanId: '',
      districts: [],
      wilayahError: null,
    );
    await loadDistricts(id);
    _buildAddressString();
  }

  /// Load districts
  Future<void> loadDistricts(String regencyId) async {
    state = state.copyWith(isLoadingDistricts: true);
    try {
      final districts = await wilayahService.getDistricts(regencyId);
      state = state.copyWith(
        districts: districts,
        isLoadingDistricts: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingDistricts: false,
        wilayahError: 'Gagal memuat kecamatan: ${e.toString()}',
      );
    }
  }

  /// Select kecamatan by name (for initial load)
  Future<void> _selectKecamatanByName(String name) async {
    try {
      final kecamatan = state.districts.firstWhere(
        (d) => d.name == name,
      );
      updateKecamatan(kecamatan.name, kecamatan.id);
    } catch (e) {
      // Not found, ignore
    }
  }

  /// Update kecamatan
  void updateKecamatan(String name, String id) {
    state = state.copyWith(
      selectedKecamatan: state.districts.firstWhere((d) => d.id == id),
      kecamatanName: name,
      kecamatanId: id,
      wilayahError: null,
    );
    _buildAddressString();
  }

  /// Get current location
  Future<void> getCurrentLocation() async {
    state = state.copyWith(
      isLoadingLocation: true,
      locationError: null,
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
          address: address.isNotEmpty ? address : state.address,
        );
      }

      state = state.copyWith(
        currentPosition: position,
        location: [position.longitude, position.latitude],
        isLoadingLocation: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingLocation: false,
        locationError: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  /// Parse Placemark to address fields
  void _parsePlacemarkToAddress(Placemark placemark) {
    state = state.copyWith(
      jalan: placemark.street ?? '',
      kelurahan: placemark.subLocality ?? '',
      kecamatanName: placemark.locality ?? '',
      kotaName: placemark.subAdministrativeArea ?? '',
      provinsiName: placemark.administrativeArea ?? '',
      address: AddressBuilder.buildAddressString(placemark),
    );
  }

  /// Update form fields
  void updateNamaLengkap(String value) {
    state = state.copyWith(namaLengkap: value);
  }

  void updateNik(String value) {
    state = state.copyWith(nik: value);
  }

  void updateDateOfBirth(DateTime date) {
    state = state.copyWith(dateOfBirth: date);
  }

  void updateAddress(String value) {
    state = state.copyWith(address: value);
  }

  void updateJalan(String value) {
    state = state.copyWith(jalan: value);
    _buildAddressString();
  }

  void updateKelurahan(String value) {
    state = state.copyWith(kelurahan: value);
    _buildAddressString();
  }

  /// Get formatted date for API
  String? getFormattedDate() {
    if (state.dateOfBirth == null) return null;
    return '${state.dateOfBirth!.year}-${state.dateOfBirth!.month.toString().padLeft(2, '0')}-${state.dateOfBirth!.day.toString().padLeft(2, '0')}';
  }

  /// Build address string from components
  void _buildAddressString() {
    final parts = <String>[];
    if (state.jalan.isNotEmpty) parts.add(state.jalan);
    if (state.kelurahan.isNotEmpty) parts.add(state.kelurahan);
    if (state.kecamatanName.isNotEmpty) parts.add(state.kecamatanName);
    if (state.kotaName.isNotEmpty) parts.add(state.kotaName);
    if (state.provinsiName.isNotEmpty) parts.add(state.provinsiName);
    
    final addressString = parts.join(', ');
    if (addressString.isNotEmpty) {
      state = state.copyWith(address: addressString);
    }
  }

  /// Update address when components change
  void updateAddressFromComponents() {
    _buildAddressString();
  }

  /// Submit profile update
  Future<bool> submit() async {
    if (state.namaLengkap.isEmpty ||
        state.nik.isEmpty ||
        state.dateOfBirth == null ||
        state.address.isEmpty) {
      state = state.copyWith(
        error: 'Mohon lengkapi semua field yang wajib diisi',
      );
      return false;
    }

    if (state.nik.length != 16) {
      state = state.copyWith(error: 'NIK harus 16 digit');
      return false;
    }

    // Build address if not set
    if (state.address.isEmpty) {
      _buildAddressString();
    }

    state = state.copyWith(isLoading: true, error: null);
    try {
      final formattedDate = getFormattedDate();
      if (formattedDate == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'Tanggal lahir tidak valid',
        );
        return false;
      }

      final request = UpdateProfileRequestModel(
        namaLengkap: state.namaLengkap,
        nik: state.nik,
        dateOfBirth: formattedDate,
        address: state.address,
        provinsi: state.provinsiName.isNotEmpty ? state.provinsiName : null,
        kotaKabupaten:
            state.kotaName.isNotEmpty ? state.kotaName : null,
        kecamatan:
            state.kecamatanName.isNotEmpty ? state.kecamatanName : null,
        kelurahan: state.kelurahan.isNotEmpty ? state.kelurahan : null,
        location: state.location,
      );

      await profileDataSource.updateProfile(request);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }
}
