import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/profile/data/models/profile_response_model.dart';
import 'package:wellmom_app/features/profile/data/models/update_health_profile_request_model.dart';
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
  /// Backend: All fields are optional, returns 200 on success
  Future<void> updateProfile(UpdateProfileRequestModel request) async {
    try {
      final response = await dio.patch(
        '/ibu-hamil/me/profile/identitas',
        data: request.toJson(),
      );
      
      // Backend returns 200 with updated profile data
      // We don't need to parse it for now, just check if request succeeded
      if (response.statusCode != 200) {
        throw ServerFailure('Gagal memperbarui profil');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final detail = e.response?.data?['detail'] ?? e.response?.data?['message'];
        
        // Handle specific error cases from backend
        if (statusCode == 403) {
          throw ServerFailure(detail?.toString() ?? 'Akses ditolak. Hanya ibu hamil yang dapat mengakses endpoint ini.');
        } else if (statusCode == 404) {
          throw ServerFailure(detail?.toString() ?? 'Profil Ibu Hamil tidak ditemukan');
        } else if (statusCode == 400) {
          throw ServerFailure(detail?.toString() ?? 'Data tidak valid');
        } else if (statusCode == 500) {
          throw ServerFailure('Server error. Silakan coba lagi nanti.');
        } else {
          throw ServerFailure(detail?.toString() ?? 'Gagal memperbarui profil');
        }
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  /// PATCH /api/v1/ibu-hamil/me/profile/kehamilan
  /// Update health profile (pregnancy and health history data)
  Future<void> updateHealthProfile(UpdateHealthProfileRequestModel request) async {
    try {
      final response = await dio.patch(
        '/ibu-hamil/me/profile/kehamilan',
        data: request.toJson(),
      );

      // Backend returns 200 with updated profile data
      // We don't need to parse it for now, just check if request succeeded
      if (response.statusCode != 200) {
        throw ServerFailure('Gagal memperbarui health profile');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final detail = e.response?.data?['detail'] ?? e.response?.data?['message'];

        // Handle specific error cases from backend
        if (statusCode == 403) {
          throw ServerFailure(
            detail?.toString() ??
                'Akses ditolak. Hanya ibu hamil yang dapat mengakses endpoint ini.',
          );
        } else if (statusCode == 404) {
          throw ServerFailure(
            detail?.toString() ?? 'Profil Ibu Hamil tidak ditemukan',
          );
        } else if (statusCode == 422) {
          throw ServerFailure(
            detail?.toString() ?? 'Data tidak valid. Periksa format tanggal dan tipe data.',
          );
        } else if (statusCode == 400) {
          throw ServerFailure(detail?.toString() ?? 'Data tidak valid');
        } else if (statusCode == 500) {
          throw ServerFailure('Server error. Silakan coba lagi nanti.');
        } else {
          throw ServerFailure(detail?.toString() ?? 'Gagal memperbarui health profile');
        }
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }
}
