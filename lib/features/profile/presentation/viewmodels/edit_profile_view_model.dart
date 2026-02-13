import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/core/models/wilayah_indonesia.dart';
import 'package:wellmom_app/core/services/location_service.dart';
import 'package:wellmom_app/core/services/wilayah_service.dart';
import 'package:wellmom_app/core/utils/address_builder.dart';
import 'package:wellmom_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:wellmom_app/features/profile/data/models/update_profile_request_model.dart';

part 'edit_profile_view_model.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
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
      
      // Parse jalan from address (try to extract first part before comma)
      String jalan = '';
      if (ibuHamil.address.isNotEmpty) {
        final addressParts = ibuHamil.address.split(',');
        if (addressParts.isNotEmpty) {
          // First part is usually jalan/nomor rumah
          jalan = addressParts[0].trim();
        }
      }
      
      // Set form fields
      state = state.copyWith(
        namaLengkap: ibuHamil.namaLengkap,
        nik: ibuHamil.nik,
        dateOfBirth: dob,
        address: ibuHamil.address,
        jalan: jalan,
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
      
      // Wait for provinces to load before matching
      if (state.provinces.isEmpty) {
        await loadProvinces();
      }
      
      // Load and select wilayah if available (using robust matching)
      if (ibuHamil.provinsi != null && ibuHamil.provinsi!.isNotEmpty) {
        await _selectProvinsiByName(ibuHamil.provinsi!);
        // Wait for regencies to load
        int retryCount = 0;
        while (retryCount < 5 && state.regencies.isEmpty && state.isLoadingRegencies) {
          await Future.delayed(const Duration(milliseconds: 500));
          retryCount++;
        }
      }
      
      if (ibuHamil.kotaKabupaten != null && 
          ibuHamil.kotaKabupaten!.isNotEmpty && 
          state.provinsiId.isNotEmpty) {
        await _selectKotaByName(ibuHamil.kotaKabupaten!);
        // Wait for districts to load
        int retryCount = 0;
        while (retryCount < 5 && state.districts.isEmpty && state.isLoadingDistricts) {
          await Future.delayed(const Duration(milliseconds: 500));
          retryCount++;
        }
      }
      
      if (ibuHamil.kecamatan != null && 
          ibuHamil.kecamatan!.isNotEmpty && 
          state.kotaId.isNotEmpty) {
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

  /// Normalize region name for better matching (removes prefixes/suffixes)
  String _normalizeRegionName(String name) {
    return name
        .toLowerCase()
        .replaceAll(RegExp(r'^(kabupaten|kota|kab\.?|kab|regency|city)\s+', caseSensitive: false), '')
        .replaceAll(RegExp(r'\s+(kabupaten|kota|kab\.?|regency|city)$', caseSensitive: false), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Check if two region names match (handles exact, contains, and fuzzy matching)
  /// Enhanced for rural areas like "Air Hangat", "Kerinci", etc.
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

  /// Select provinsi by name (for initial load) - uses robust matching
  Future<void> _selectProvinsiByName(String name) async {
    if (state.provinces.isEmpty) return;
    
    try {
      final provinsi = state.provinces.firstWhere(
        (p) => _isRegionMatch(p.name, name),
      );
      await updateProvinsi(provinsi.name, provinsi.id);
    } catch (e) {
      // Not found, ignore - will be handled by user manually selecting
    }
  }

  /// Update provinsi
  Future<void> updateProvinsi(String name, String id) async {
    try {
      final provinsi = state.provinces.firstWhere((p) => p.id == id);
      state = state.copyWith(
        selectedProvinsi: provinsi,
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
    } catch (_) {
      state = state.copyWith(
        provinsiName: name,
        provinsiId: id,
        selectedProvinsi: null,
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
    }
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

  /// Select kota by name (for initial load) - uses robust matching
  Future<void> _selectKotaByName(String name) async {
    if (state.regencies.isEmpty) return;
    
    try {
      final kota = state.regencies.firstWhere(
        (k) => _isRegionMatch(k.name, name),
      );
      await updateKota(kota.name, kota.id);
    } catch (e) {
      // Not found, ignore - will be handled by user manually selecting
    }
  }

  /// Update kota
  Future<void> updateKota(String name, String id) async {
    try {
      final kota = state.regencies.firstWhere((k) => k.id == id);
      state = state.copyWith(
        selectedKota: kota,
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
    } catch (_) {
      state = state.copyWith(
        kotaName: name,
        kotaId: id,
        selectedKota: null,
        selectedKecamatan: null,
        kecamatanName: '',
        kecamatanId: '',
        districts: [],
        wilayahError: null,
      );
      await loadDistricts(id);
    }
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

  /// Select kecamatan by name (for initial load) - uses robust matching
  Future<void> _selectKecamatanByName(String name) async {
    if (state.districts.isEmpty) return;
    
    try {
      final kecamatan = state.districts.firstWhere(
        (d) => _isRegionMatch(d.name, name),
      );
      updateKecamatan(kecamatan.name, kecamatan.id);
    } catch (e) {
      // Not found, ignore - will be handled by user manually selecting
    }
  }

  /// Update kecamatan
  void updateKecamatan(String name, String id) {
    try {
      final kecamatan = state.districts.firstWhere((d) => d.id == id);
      state = state.copyWith(
        selectedKecamatan: kecamatan,
        kecamatanName: name,
        kecamatanId: id,
        wilayahError: null,
      );
      _buildAddressString();
    } catch (_) {
      state = state.copyWith(
        kecamatanName: name,
        kecamatanId: id,
        selectedKecamatan: null,
        wilayahError: null,
      );
      _buildAddressString();
    }
  }

  /// Get current location
  Future<void> getCurrentLocation() async {
    state = state.copyWith(
      isLoadingLocation: true,
      locationError: null,
      error: null,
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
        // If reverse geocoding fails (common in rural areas), use the address from location service
        state = state.copyWith(
          address: address.isNotEmpty ? address : state.address,
        );
      }

      state = state.copyWith(
        currentPosition: position,
        location: [position.longitude, position.latitude],
        isLoadingLocation: false,
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

  void _parsePlacemarkToAddress(Placemark placemark) {
    String kecamatan = placemark.locality ?? '';
    if (kecamatan.isEmpty && placemark.subLocality != null) {
      kecamatan = placemark.subLocality!;
    }

    String kota = placemark.subAdministrativeArea ?? '';
    String provinsi = placemark.administrativeArea ?? '';

    state = state.copyWith(
      jalan: placemark.street ?? placemark.thoroughfare ?? '',
      kelurahan: placemark.subLocality ?? '',
      kecamatanName: kecamatan,
      kotaName: kota,
      provinsiName: provinsi,
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

      // Validate location coordinates before sending
      List<double>? validLocation;
      if (state.location.length == 2) {
        final longitude = state.location[0];
        final latitude = state.location[1];
        // Validate coordinates: longitude -180 to 180, latitude -90 to 90
        if (longitude >= -180 && longitude <= 180 && 
            latitude >= -90 && latitude <= 90) {
          validLocation = state.location;
        }
      }

      final request = UpdateProfileRequestModel(
        namaLengkap: state.namaLengkap.isNotEmpty ? state.namaLengkap : null,
        nik: state.nik.isNotEmpty ? state.nik : null,
        dateOfBirth: formattedDate,
        address: state.address.isNotEmpty ? state.address : null,
        provinsi: state.provinsiName.isNotEmpty ? state.provinsiName : null,
        kotaKabupaten: state.kotaName.isNotEmpty ? state.kotaName : null,
        kecamatan: state.kecamatanName.isNotEmpty ? state.kecamatanName : null,
        kelurahan: state.kelurahan.isNotEmpty ? state.kelurahan : null,
        location: validLocation,
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
