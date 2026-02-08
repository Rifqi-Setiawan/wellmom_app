import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/profile/data/models/profile_response_model.dart';
import 'package:wellmom_app/features/profile/data/models/update_profile_request_model.dart';

class ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSource(this.dio);

  /// GET /api/v1/ibu-hamil/me/profile
  Future<ProfileResponseModel> getProfile() async {
    try {
      final response = await dio.get('/ibu-hamil/me/profile');
      
      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }
      
      final data = Map<String, dynamic>.from(response.data as Map);
      return ProfileResponseModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(
          e.response?.data['detail'] ?? 'Gagal memuat profil',
        );
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  /// PATCH /api/v1/ibu-hamil/me/profile/identitas
  Future<void> updateProfile(UpdateProfileRequestModel request) async {
    try {
      await dio.patch(
        '/ibu-hamil/me/profile/identitas',
        data: request.toJson(),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(
          e.response?.data['detail'] ?? 'Gagal memperbarui profil',
        );
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
