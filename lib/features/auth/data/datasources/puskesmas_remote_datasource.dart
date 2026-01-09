import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/data/models/puskesmas_model.dart';

/// Abstract remote data source for puskesmas
abstract class PuskesmasRemoteDataSource {
  Future<List<NearestPuskesmasModel>> getNearestPuskesmas(
    double latitude,
    double longitude,
  );
  
  /// Assign ibu hamil to puskesmas
  Future<void> assignIbuHamilToPuskesmas(
    int puskesmasId,
    int ibuHamilId,
  );
}

/// Implementation of PuskesmasRemoteDataSource
class PuskesmasRemoteDataSourceImpl implements PuskesmasRemoteDataSource {
  final Dio dio;

  PuskesmasRemoteDataSourceImpl(this.dio);

  /// Normalize JSON to handle type mismatches from backend
  Map<String, dynamic> _normalizePuskesmasJson(Map<String, dynamic> json) {
    final normalized = Map<String, dynamic>.from(json);
    
    // Handle address field - convert List to String if needed
    if (normalized['address'] is List) {
      normalized['address'] = (normalized['address'] as List).join(', ');
    } else if (normalized['address'] == null) {
      normalized['address'] = '';
    }
    
    // Handle puskesmas object
    if (normalized['puskesmas'] is Map<String, dynamic>) {
      final puskesmasJson = Map<String, dynamic>.from(normalized['puskesmas'] as Map);
      
      // Handle address in puskesmas object
      if (puskesmasJson['address'] is List) {
        puskesmasJson['address'] = (puskesmasJson['address'] as List).join(', ');
      }
      
      // Handle registration_status
      if (puskesmasJson['registration_status'] is List) {
        puskesmasJson['registration_status'] = (puskesmasJson['registration_status'] as List).first.toString();
      }
      
      // Handle is_active
      if (puskesmasJson['is_active'] is List) {
        final activeValue = (puskesmasJson['is_active'] as List).first;
        puskesmasJson['is_active'] = activeValue == true || activeValue == 1;
      }
      
      normalized['puskesmas'] = puskesmasJson;
    }
    
    // Handle distance_km
    if (normalized['distance_km'] is List) {
      normalized['distance_km'] = (normalized['distance_km'] as List).first;
    }
    
    return normalized;
  }

  @override
  Future<List<NearestPuskesmasModel>> getNearestPuskesmas(
    double latitude,
    double longitude,
  ) async {
    try {
      final response = await dio.get(
        '/puskesmas/nearest',
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
        },
      );

      if (response.data is List) {
        try {
          return (response.data as List)
              .map((json) {
                // Ensure json is a Map
                if (json is! Map<String, dynamic>) {
                  throw FormatException('Expected Map but got ${json.runtimeType}');
                }
                
                // Normalize the JSON data to handle type mismatches
                final normalizedJson = _normalizePuskesmasJson(json);
                
                return NearestPuskesmasModel.fromJson(normalizedJson);
              })
              .toList();
        } catch (e) {
          throw ServerFailure('Error parsing puskesmas data: ${e.toString()}');
        }
      } else {
        throw ServerFailure('Invalid response format: expected List but got ${response.data.runtimeType}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 400) {
          final detail = responseData?['detail'] ?? 'Invalid location data';
          throw ServerFailure(detail);
        } else {
          throw ServerFailure(
              responseData?['detail'] ?? responseData?['message'] ??
                  'Gagal mendapatkan daftar puskesmas');
        }
      } else {
        throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
      }
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<void> assignIbuHamilToPuskesmas(
    int puskesmasId,
    int ibuHamilId,
  ) async {
    try {
      await dio.post(
        '/puskesmas/$puskesmasId/ibu-hamil/$ibuHamilId/assign',
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 400) {
          final detail = responseData?['detail'] ?? 'Data tidak valid';
          throw ServerFailure(detail);
        } else if (statusCode == 403) {
          final detail = responseData?['detail'] ??
              'Anda tidak memiliki izin untuk melakukan assign ini';
          throw ServerFailure(detail);
        } else if (statusCode == 404) {
          final detail = responseData?['detail'] ??
              'Puskesmas atau ibu hamil tidak ditemukan';
          throw ServerFailure(detail);
        } else {
          throw ServerFailure(
              responseData?['detail'] ?? responseData?['message'] ??
                  'Gagal assign ibu hamil ke puskesmas');
        }
      } else {
        throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
      }
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
