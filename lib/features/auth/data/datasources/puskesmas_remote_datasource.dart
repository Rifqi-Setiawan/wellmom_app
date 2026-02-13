import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/data/models/puskesmas_model.dart';

abstract class PuskesmasRemoteDataSource {
  Future<List<NearestPuskesmasModel>> getNearestPuskesmas(
    double latitude,
    double longitude,
  );

  Future<void> assignIbuHamilToPuskesmas(
    int puskesmasId,
    int ibuHamilId,
    String accessToken,
  );
}

class PuskesmasRemoteDataSourceImpl implements PuskesmasRemoteDataSource {
  final Dio dio;

  PuskesmasRemoteDataSourceImpl(this.dio);

  Map<String, dynamic> _normalizePuskesmasJson(Map<String, dynamic> json) {
    final normalized = Map<String, dynamic>.from(json);

    if (normalized['address'] is List) {
      normalized['address'] = (normalized['address'] as List).join(', ');
    } else if (normalized['address'] == null) {
      normalized['address'] = '';
    }

    if (normalized['puskesmas'] is Map<String, dynamic>) {
      final puskesmasJson = Map<String, dynamic>.from(normalized['puskesmas'] as Map);

      if (puskesmasJson['address'] is List) {
        puskesmasJson['address'] = (puskesmasJson['address'] as List).join(', ');
      }

      if (puskesmasJson['registration_status'] is List) {
        puskesmasJson['registration_status'] =
            (puskesmasJson['registration_status'] as List).first.toString();
      }

      if (puskesmasJson['is_active'] is List) {
        final activeValue = (puskesmasJson['is_active'] as List).first;
        puskesmasJson['is_active'] = activeValue == true || activeValue == 1;
      }

      normalized['puskesmas'] = puskesmasJson;
    }

    if (normalized.containsKey('distance_km')) {
      final distanceValue = normalized['distance_km'];
      double? finalDistance;

      if (distanceValue is List) {
        if (distanceValue.isNotEmpty) {
          final firstElement = distanceValue.first;
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

      normalized['distance_km'] = finalDistance ?? 0.0;
    } else {
      normalized['distance_km'] = 0.0;
    }

    return normalized;
  }

  double? _parseDistanceValue(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is num) return value.toDouble();
    if (value is String) {
      final parsed = double.tryParse(value);
      if (parsed != null) return parsed;
      final numberMatch = RegExp(r'[\d.]+').firstMatch(value);
      if (numberMatch != null) {
        return double.tryParse(numberMatch.group(0) ?? '0') ?? 0.0;
      }
      return 0.0;
    }
    return 0.0;
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
        return (response.data as List).map((json) {
          if (json is! Map<String, dynamic>) {
            throw const FormatException('Format data puskesmas tidak valid');
          }
          final normalizedJson = _normalizePuskesmasJson(json);
          return NearestPuskesmasModel.fromJson(normalizedJson);
        }).toList();
      }
      throw ServerFailure('Format respons tidak valid');
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 400) {
          throw ServerFailure(responseData?['detail'] ?? 'Data lokasi tidak valid');
        }
        throw ServerFailure(
            responseData?['detail'] ?? responseData?['message'] ??
                'Gagal mendapatkan daftar puskesmas');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
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
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 400) {
          throw ServerFailure(responseData?['detail'] ?? 'Data tidak valid');
        } else if (statusCode == 401) {
          throw ServerFailure(
              responseData?['detail'] ?? 'Token tidak valid atau sudah kadaluarsa');
        } else if (statusCode == 403) {
          throw ServerFailure(
              responseData?['detail'] ?? 'Anda tidak memiliki izin untuk operasi ini');
        } else if (statusCode == 404) {
          throw ServerFailure(
              responseData?['detail'] ?? 'Puskesmas atau ibu hamil tidak ditemukan');
        } else {
          throw ServerFailure(
              responseData?['detail'] ?? responseData?['message'] ??
                  'Gagal assign ibu hamil ke puskesmas');
        }
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
