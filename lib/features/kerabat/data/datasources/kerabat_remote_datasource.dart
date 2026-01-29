import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_request.dart';
import 'package:wellmom_app/features/kerabat/data/models/invite_code_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_login_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/my_kerabat_item_model.dart';

abstract class KerabatRemoteDataSource {
  Future<InviteCodeResponse> generateInviteCode();
  Future<KerabatLoginResponse> loginWithInviteCode(String inviteCode);
  Future<MyKerabatItemModel> completeProfile(CompleteProfileRequest request);
  Future<List<MyKerabatItemModel>> getMyKerabat();
}

class KerabatRemoteDataSourceImpl implements KerabatRemoteDataSource {
  final Dio dio;

  KerabatRemoteDataSourceImpl(this.dio);

  @override
  Future<InviteCodeResponse> generateInviteCode() async {
    try {
      final response = await dio.post('/kerabat/generate-invite');
      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }
      return InviteCodeResponse.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<KerabatLoginResponse> loginWithInviteCode(String inviteCode) async {
    try {
      final response = await dio.post(
        '/kerabat/login-with-invite',
        data: {'invite_code': inviteCode},
      );
      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }
      return KerabatLoginResponse.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<MyKerabatItemModel> completeProfile(
    CompleteProfileRequest request,
  ) async {
    try {
      final response = await dio.post(
        '/kerabat/complete-profile',
        data: request.toJson(),
      );
      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }
      return MyKerabatItemModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<List<MyKerabatItemModel>> getMyKerabat() async {
    try {
      final response = await dio.get('/kerabat/my-kerabat');
      if (response.data is! List) {
        throw ServerFailure('Format respons tidak valid');
      }
      return (response.data as List)
          .map((e) => MyKerabatItemModel.fromJson(
                Map<String, dynamic>.from(e as Map),
              ))
          .toList();
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  Failure _mapDioError(DioException e) {
    if (e.response == null) {
      return NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    }
    final status = e.response!.statusCode;
    final data = e.response!.data;
    final detail = data is Map
        ? (data['detail'] ?? data['message'] ?? data['error'])
        : null;
    final message = detail?.toString() ?? 'Terjadi kesalahan';

    if (status == 400) {
      return ServerFailure(
        message.contains('tidak valid') || message.contains('expired')
            ? message
            : 'Kode undangan tidak valid, sudah kedaluwarsa, atau sudah digunakan',
      );
    }
    if (status == 403) {
      return ServerFailure(
        message.contains('mengakses')
            ? message
            : 'Hanya ibu hamil/kerabat yang dapat mengakses fitur ini',
      );
    }
    if (status == 404) {
      return ServerFailure(
        message.contains('tidak ditemukan') ? message : 'Profil tidak ditemukan',
      );
    }
    return ServerFailure(message);
  }
}
