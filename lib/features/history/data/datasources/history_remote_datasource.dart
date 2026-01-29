import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/history/data/models/health_records_response_model.dart';

class HistoryRemoteDataSource {
  final Dio dio;

  HistoryRemoteDataSource(this.dio);

  Future<int> getIbuHamilId() async {
    try {
      final response = await dio.get('/ibu-hamil/me');
      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }
      final data = Map<String, dynamic>.from(response.data as Map);
      final id = data['id'];
      if (id is int) {
        return id;
      }
      if (id is num) {
        return id.toInt();
      }
      throw ServerFailure('ID ibu hamil tidak ditemukan');
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(
          e.response?.data['detail'] ?? 'Gagal memuat profil ibu hamil',
        );
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  Future<HealthRecordsResponseModel> getHealthRecordsByDate({
    required int ibuHamilId,
    required DateTime checkupDate,
  }) async {
    try {
      final dateStr = checkupDate.toIso8601String().split('T')[0]; // YYYY-MM-DD format
      final response = await dio.get(
        '/health-records/ibu-hamil/$ibuHamilId/by-date',
        queryParameters: {
          'checkup_date': dateStr,
        },
      );

      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }

      final data = Map<String, dynamic>.from(response.data as Map);
      return HealthRecordsResponseModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(
          e.response?.data['detail'] ?? 'Gagal memuat data riwayat kesehatan',
        );
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
