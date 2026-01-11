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
  /// [accessToken] is required for authentication from registration response
  Future<void> assignIbuHamilToPuskesmas(
    int puskesmasId,
    int ibuHamilId,
    String accessToken,
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
    
    // Handle distance_km with proper type conversion
    if (normalized.containsKey('distance_km')) {
      final distanceValue = normalized['distance_km'];
      double? finalDistance;
      
      // If it's a List, get the first element
      if (distanceValue is List) {
        if (distanceValue.isNotEmpty) {
          final firstElement = distanceValue.first;
          // Recursively handle if first element is also a List
          if (firstElement is List && firstElement.isNotEmpty) {
            finalDistance = _parseDistanceValue(firstElement.first);
          } else {
            finalDistance = _parseDistanceValue(firstElement);
          }
        } else {
          finalDistance = 0.0;
        }
      } else {
        finalDistance = _parseDistanceValue(distanceValue);
      }
      
      // Ensure we have a valid double
      normalized['distance_km'] = finalDistance ?? 0.0;
      
      // Log for debugging
      print('📍 Distance normalized: ${normalized['distance_km']} km (original: $distanceValue, type: ${distanceValue.runtimeType})');
    } else {
      // If distance_km is missing, set to 0.0
      normalized['distance_km'] = 0.0;
      print('⚠️ distance_km field is missing in response');
    }
    
    return normalized;
  }
  
  /// Helper method to parse distance value to double
  double? _parseDistanceValue(dynamic value) {
    if (value == null) {
      return 0.0;
    } else if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null) {
        return parsed;
      }
      // Try to extract number from string (e.g., "0.1 km" -> 0.1)
      final numberMatch = RegExp(r'[\d.]+').firstMatch(value);
      if (numberMatch != null) {
        return double.tryParse(numberMatch.group(0) ?? '0') ?? 0.0;
      }
      return 0.0;
    } else if (value is num) {
      return value.toDouble();
    } else {
      print('⚠️ Unknown distance_km type: ${value.runtimeType}, value: $value');
      return 0.0;
    }
  }

  @override
  Future<List<NearestPuskesmasModel>> getNearestPuskesmas(
    double latitude,
    double longitude,
  ) async {
    try {
      // Log request parameters for debugging
      print('═══════════════════════════════════════════════════════════');
      print('📤 REQUEST: Get Nearest Puskesmas');
      print('   Latitude: $latitude');
      print('   Longitude: $longitude');
      print('═══════════════════════════════════════════════════════════');
      
      final response = await dio.get(
        '/puskesmas/nearest',
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
        },
      );

      // Log raw response for debugging
      print('📥 RESPONSE: Get Nearest Puskesmas');
      print('   Status: ${response.statusCode}');
      print('   Data type: ${response.data.runtimeType}');
      if (response.data is List && (response.data as List).isNotEmpty) {
        print('   First item distance_km (raw): ${(response.data as List).first['distance_km']}');
        print('   First item distance_km type: ${(response.data as List).first['distance_km'].runtimeType}');
      }
      print('═══════════════════════════════════════════════════════════');

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
                
                final puskesmas = NearestPuskesmasModel.fromJson(normalizedJson);
                
                // Log parsed result
                print('✅ Parsed puskesmas: ${puskesmas.puskesmas.name}');
                print('   Distance: ${puskesmas.distanceKm} km');
                print('   Address: ${puskesmas.address}');
                
                return puskesmas;
              })
              .toList();
        } catch (e) {
          print('❌ Error parsing puskesmas data: $e');
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
    String accessToken,
  ) async {
    try {
      await dio.post(
        '/puskesmas/$puskesmasId/ibu-hamil/$ibuHamilId/assign',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 400) {
          final detail = responseData?['detail'] ?? 'Data tidak valid';
          throw ServerFailure(detail);
        } else if (statusCode == 401) {
          final detail = responseData?['detail'] ??
              'Token tidak valid atau sudah kadaluarsa';
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
