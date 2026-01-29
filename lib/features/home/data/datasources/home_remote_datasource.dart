import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/core/models/upload_profile_photo_response.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/home/data/models/ibu_hamil_perawat_model.dart';
import 'package:wellmom_app/features/home/data/models/latest_perawat_notes_model.dart';
import 'package:wellmom_app/features/home/data/models/puskesmas_detail_model.dart';
import 'package:wellmom_app/features/health/data/models/health_record_model.dart';

class HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSource(this.dio);

  Map<String, dynamic> _normalizeIbuHamil(Map<String, dynamic> json) {
    final data = Map<String, dynamic>.from(json);
    
    // location might be [lon, lat]; convert to map
    if (data['location'] is List && (data['location'] as List).length >= 2) {
      final loc = data['location'] as List;
      data['location'] = {
        'latitude': (loc[1] as num).toDouble(),
        'longitude': (loc[0] as num).toDouble(),
      };
    }
    
    // Normalize riwayat_kesehatan_ibu: API returns health fields at root level,
    // but model expects them in nested object
    if (!data.containsKey('riwayat_kesehatan_ibu') || 
        data['riwayat_kesehatan_ibu'] == null) {
      // Build nested object from root-level fields
      data['riwayat_kesehatan_ibu'] = {
        'darah_tinggi': data['darah_tinggi'] ?? false,
        'diabetes': data['diabetes'] ?? false,
        'anemia': data['anemia'] ?? false,
        'penyakit_jantung': data['penyakit_jantung'] ?? false,
        'asma': data['asma'] ?? false,
        'penyakit_ginjal': data['penyakit_ginjal'] ?? false,
        'tbc_malaria': data['tbc_malaria'] ?? false,
      };
    }
    
    return data;
  }

  Future<IbuHamilModel> getIbuHamilMe() async {
    try {
      print('HomeDataSource: Fetching /ibu-hamil/me');
      final response = await dio.get('/ibu-hamil/me');
      print('HomeDataSource: Response status: ${response.statusCode}');
      print('HomeDataSource: Response data type: ${response.data.runtimeType}');
      
      if (response.data is! Map) {
        print('HomeDataSource: ERROR - Response is not a Map');
        throw ServerFailure('Format respons tidak valid');
      }
      
      final rawData = Map<String, dynamic>.from(response.data as Map);
      print('HomeDataSource: Raw data keys: ${rawData.keys.toList()}');
      
      final normalized = _normalizeIbuHamil(rawData);
      print('HomeDataSource: Normalized data keys: ${normalized.keys.toList()}');
      
      try {
        final ibuHamil = IbuHamilModel.fromJson(normalized);
        print('HomeDataSource: Successfully parsed IbuHamilModel - nama: ${ibuHamil.namaLengkap}, usia: ${ibuHamil.usiaKehamilan}');
        return ibuHamil;
      } catch (e, stackTrace) {
        print('HomeDataSource: ERROR parsing IbuHamilModel: $e');
        print('HomeDataSource: Stack trace: $stackTrace');
        rethrow;
      }
    } on DioException catch (e) {
      print('HomeDataSource: DioException - ${e.message}');
      if (e.response != null) {
        print('HomeDataSource: Response status: ${e.response?.statusCode}');
        print('HomeDataSource: Response data: ${e.response?.data}');
        throw ServerFailure(e.response?.data['detail'] ?? 'Gagal memuat profil ibu hamil');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e, stackTrace) {
      print('HomeDataSource: Unexpected error: $e');
      print('HomeDataSource: Stack trace: $stackTrace');
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  Future<PuskesmasDetailModel> getPuskesmasDetail(int puskesmasId) async {
    try {
      final response = await dio.get('/puskesmas/$puskesmasId');
      if (response.data is! Map) {
        throw ServerFailure('Format respons puskesmas tidak valid');
      }
      final data = Map<String, dynamic>.from(response.data as Map);
      return PuskesmasDetailModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(e.response?.data['detail'] ?? 'Gagal memuat data puskesmas');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  Future<HealthRecordModel?> getLatestHealthRecord() async {
    try {
      final response = await dio.get('/ibu-hamil/me/latest-health-record');
      
      if (response.data is! Map) {
        return null;
      }
      
      final data = Map<String, dynamic>.from(response.data as Map);
      
      // Normalize field names to match model
      // API returns 'fundal_height' but model expects 'fundal_height_cm'
      if (data.containsKey('fundal_height') && !data.containsKey('fundal_height_cm')) {
        final fundalHeight = data['fundal_height'];
        if (fundalHeight != null) {
          data['fundal_height_cm'] = fundalHeight is int 
              ? fundalHeight.toDouble() 
              : (fundalHeight is double ? fundalHeight : null);
        }
      }
      
      // Handle missing required fields that are optional in API but required by model
      if (!data.containsKey('checkup_type')) {
        data['checkup_type'] = 'ad-hoc';
      }
      if (!data.containsKey('data_source')) {
        // Determine from checked_by field if available
        final checkedBy = data['checked_by'];
        if (checkedBy != null && checkedBy.toString().toLowerCase().contains('iot')) {
          data['data_source'] = 'iot_device';
        } else {
          data['data_source'] = 'manual';
        }
      }
      
      return HealthRecordModel.fromJson(data);
    } on DioException catch (e) {
      // If 404, return null with special handling in UI
      if (e.response?.statusCode == 404) {
        return null;
      }
      // For other errors, return null to not break the home page
      return null;
    } catch (e) {
      // Silently fail - health metrics are optional
      return null;
    }
  }

  Future<LatestPerawatNotesModel?> getLatestPerawatNotes() async {
    try {
      final response = await dio.get('/ibu-hamil/me/latest-perawat-notes');

      if (response.data is! Map) {
        return null;
      }

      final data = Map<String, dynamic>.from(response.data as Map);
      return LatestPerawatNotesModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<IbuHamilPerawatModel?> getIbuHamilPerawat() async {
    try {
      final response = await dio.get('/ibu-hamil/me/perawat');

      if (response.data is! Map) {
        return null;
      }

      final data = Map<String, dynamic>.from(response.data as Map);
      return IbuHamilPerawatModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Update profile photo (authenticated). PUT /upload/ibu-hamil/{ibu_hamil_id}/profile-photo
  Future<UploadProfilePhotoResponse> updateIbuHamilProfilePhoto(
    int ibuHamilId,
    File file,
  ) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split(RegExp(r'[/\\]')).last,
        ),
      });
      final response = await dio.put(
        '/upload/ibu-hamil/$ibuHamilId/profile-photo',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      if (response.data is! Map) {
        throw ServerFailure('Format respons upload tidak valid');
      }
      return UploadProfilePhotoResponse.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final detail = e.response?.data?['detail'] ?? e.response?.data?['message'];
        throw ServerFailure(
          detail?.toString() ?? 'Update foto gagal',
        );
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
