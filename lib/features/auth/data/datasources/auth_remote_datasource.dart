import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/core/models/upload_profile_photo_response.dart';
import 'package:wellmom_app/features/auth/data/models/login_response_model.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_response_model.dart';
import 'package:wellmom_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(Map<String, dynamic> data);
  Future<LoginResponseModel> login(String email, String password);
  Future<UserModel> loginWithGoogle(String token);
  Future<RegisterIbuHamilResponseModel> registerIbuHamil(RegisterIbuHamilRequestModel request);
  Future<UploadProfilePhotoResponse> uploadIbuHamilProfilePhoto(File file);
  Future<void> logoutIbuHamil();
  Future<void> updateFcmToken(String fcmToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> register(Map<String, dynamic> data) async {
    try {
      final response = await dio.post('/auth/register', data: data);
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(
            e.response?.data['message'] ?? 'Registrasi gagal');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    try {
      final response = await dio.post('/ibu-hamil/login', data: {
        'email': email,
        'password': password,
      });
      return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;
        final detail = responseData?['detail'];

        if (statusCode == 401) {
          final errorMessage = (detail is String ? detail : null) ?? 'Email atau password salah';
          throw ServerFailure(errorMessage);
        } else if (statusCode == 403) {
          final errorMessage = (detail is String ? detail : null) ?? 'Akun tidak aktif. Silakan hubungi administrator.';
          throw ServerFailure(errorMessage);
        } else if (statusCode == 404) {
          if (detail is String) {
            if (detail.contains('tidak terdaftar')) {
              throw ServerFailure('Email tidak terdaftar di sistem');
            } else if (detail.toLowerCase().contains('profil ibu hamil')) {
              throw ServerFailure('Profil ibu hamil tidak ditemukan. Silakan lengkapi registrasi terlebih dahulu.');
            } else {
              throw ServerFailure(detail);
            }
          }
          throw ServerFailure('Email tidak terdaftar di sistem');
        } else if (statusCode == 422) {
          String errorMessage = 'Data yang dimasukkan tidak valid';
          if (detail is List && detail.isNotEmpty) {
            final firstError = detail[0];
            if (firstError is Map) {
              final msg = firstError['msg'] as String?;
              final loc = firstError['loc'] as List?;
              if (msg != null) {
                errorMessage = msg;
                if (loc != null && loc.length >= 2) {
                  final field = loc[1] as String?;
                  if (field != null) {
                    errorMessage = '${_formatFieldName(field)}: $msg';
                  }
                }
              }
            }
          } else if (detail is String) {
            errorMessage = detail;
          }
          throw ValidationFailure(errorMessage);
        } else {
          final errorMessage = (detail is String ? detail : null) ??
              (responseData?['message'] as String?) ??
              'Login gagal. Silakan coba lagi.';
          throw ServerFailure(errorMessage);
        }
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah. Periksa koneksi internet Anda.');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  String _formatFieldName(String field) {
    const fieldMap = {
      'email': 'Email',
      'password': 'Password',
    };
    return fieldMap[field] ?? field;
  }

  @override
  Future<UserModel> loginWithGoogle(String token) async {
    try {
      final response = await dio.post('/auth/google', data: {'token': token});
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(
            e.response?.data['message'] ?? 'Login Google gagal');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<RegisterIbuHamilResponseModel> registerIbuHamil(RegisterIbuHamilRequestModel request) async {
    try {
      final response = await dio.post(
        '/ibu-hamil/register',
        data: request.toJson(),
      );

      if (response.data is Map<String, dynamic>) {
        return RegisterIbuHamilResponseModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      }
      throw ServerFailure('Format respons tidak valid');
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 422) {
          final detail = responseData?['detail'];
          String errorMessage = 'Data yang dimasukkan tidak valid';
          final allErrors = <String>[];

          if (detail is List && detail.isNotEmpty) {
            for (final error in detail) {
              if (error is Map) {
                final msg = error['msg'] as String? ?? 'Unknown error';
                final loc = error['loc'] as List? ?? [];
                final fieldPath = loc.where((l) => l != 'body').join('.');
                allErrors.add('$fieldPath: $msg');
              }
            }
            errorMessage = allErrors.join('\n');
          } else if (detail is String) {
            errorMessage = detail;
          } else if (detail is Map) {
            errorMessage = detail.toString();
          }

          throw ValidationFailure(errorMessage);
        } else {
          throw ServerFailure(
              responseData?['detail'] ?? responseData?['message'] ?? 'Registrasi gagal');
        }
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<UploadProfilePhotoResponse> uploadIbuHamilProfilePhoto(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split(RegExp(r'[/\\]')).last,
        ),
      });
      final response = await dio.post(
        '/upload/ibu-hamil/profile-photo',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
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
        throw ServerFailure(detail?.toString() ?? 'Upload foto gagal');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<void> logoutIbuHamil() async {
    try {
      await dio.post('/auth/logout/ibu-hamil');
    } on DioException catch (e) {
      if (e.response != null) {
        final detail = e.response?.data?['detail'] ?? e.response?.data?['message'];
        throw ServerFailure(detail?.toString() ?? 'Logout gagal');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> updateFcmToken(String fcmToken) async {
    try {
      await dio.put('/users/me/fcm-token', data: {'fcm_token': fcmToken});
    } on DioException catch (e) {
      if (e.response != null) {
        final detail = e.response?.data?['detail'] ?? e.response?.data?['message'];
        throw ServerFailure(detail?.toString() ?? 'Update FCM token gagal');
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }
}
