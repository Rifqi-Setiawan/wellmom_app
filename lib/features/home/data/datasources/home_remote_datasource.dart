import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/home/data/models/puskesmas_detail_model.dart';
import 'package:wellmom_app/core/models/location.dart';

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
    return data;
  }

  Future<IbuHamilModel> getIbuHamilMe() async {
    try {
      final response = await dio.get('/ibu-hamil/me');
      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }
      final normalized = _normalizeIbuHamil(Map<String, dynamic>.from(response.data as Map));
      return IbuHamilModel.fromJson(normalized);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(e.response?.data['detail'] ?? 'Gagal memuat profil ibu hamil');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
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
}
