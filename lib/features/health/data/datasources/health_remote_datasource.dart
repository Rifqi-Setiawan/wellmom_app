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

      final data = Map<String, dynamic>.from(response.data as Map);

      // Backend may return null or omit checkup_type/data_source; model expects non-null String
      if (data['checkup_type'] == null || data['checkup_type'].toString().isEmpty) {
        data['checkup_type'] = 'ad-hoc';
      }
      if (data['data_source'] == null || data['data_source'].toString().isEmpty) {
        final checkedBy = data['checked_by'];
        if (checkedBy != null &&
            checkedBy.toString().toLowerCase().contains('iot')) {
          data['data_source'] = 'iot_device';
        } else {
          data['data_source'] = 'manual';
        }
      }

      // Ensure DateTime strings exist for required fields (backend might omit)
      if (data['checkup_date'] == null) {
        data['checkup_date'] = DateTime.now().toIso8601String();
      }
      if (data['created_at'] == null) {
        data['created_at'] = DateTime.now().toIso8601String();
      }
      if (data['updated_at'] == null) {
        data['updated_at'] = DateTime.now().toIso8601String();
      }

      return HealthRecordModel.fromJson(data);
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
