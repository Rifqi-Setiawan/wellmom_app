import 'package:dio/dio.dart';
import 'package:wellmom_app/core/models/wilayah_indonesia.dart';

/// Service to fetch Indonesia administrative regions from public API
class WilayahService {
  final Dio dio;
  static const String baseUrl = 'https://www.emsifa.com/api-wilayah-indonesia/api';

  WilayahService(this.dio);

  /// Fetch all provinces
  Future<List<Provinsi>> getProvinces() async {
    try {
      final response = await dio.get('$baseUrl/provinces.json');
      if (response.data is List) {
        return (response.data as List)
            .map((json) => Provinsi.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Invalid response format');
    } catch (e) {
      throw Exception('Failed to fetch provinces: ${e.toString()}');
    }
  }

  /// Fetch regencies (Kota/Kabupaten) by province ID
  Future<List<KotaKabupaten>> getRegencies(String provinceId) async {
    try {
      final response = await dio.get('$baseUrl/regencies/$provinceId.json');
      if (response.data is List) {
        return (response.data as List)
            .map((json) => KotaKabupaten.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Invalid response format');
    } catch (e) {
      throw Exception('Failed to fetch regencies: ${e.toString()}');
    }
  }

  /// Fetch districts (Kecamatan) by regency ID
  Future<List<Kecamatan>> getDistricts(String regencyId) async {
    try {
      final response = await dio.get('$baseUrl/districts/$regencyId.json');
      if (response.data is List) {
        return (response.data as List)
            .map((json) => Kecamatan.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Invalid response format');
    } catch (e) {
      throw Exception('Failed to fetch districts: ${e.toString()}');
    }
  }
}
