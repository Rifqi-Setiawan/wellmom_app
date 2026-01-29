import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/health/data/models/create_health_record_request_model.dart';
import 'package:wellmom_app/features/health/data/models/health_record_model.dart';

class HealthRemoteDataSource {
  final Dio dio;

  HealthRemoteDataSource(this.dio);

  Future<HealthRecordModel> createHealthRecord(
    CreateHealthRecordRequestModel request,
  ) async {
    try {
      final response = await dio.post(
        '/health-records/self',
        data: request.toJson(),
      );

      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }

      return HealthRecordModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;
        if (errorData is Map && errorData.containsKey('detail')) {
          throw ServerFailure(errorData['detail'].toString());
        }
        throw ServerFailure(
          errorData?.toString() ?? 'Gagal membuat catatan kesehatan',
        );
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
