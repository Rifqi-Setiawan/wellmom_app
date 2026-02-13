import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/core/models/upload_profile_photo_response.dart';
import 'package:wellmom_app/features/auth/data/models/login_response_model.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_response_model.dart';
import 'package:wellmom_app/features/auth/data/models/user_model.dart';

/// Abstract remote data source for authentication
abstract class AuthRemoteDataSource {
  Future<UserModel> register(Map<String, dynamic> data);
  Future<LoginResponseModel> login(String email, String password);
  Future<UserModel> loginWithGoogle(String token);
  Future<RegisterIbuHamilResponseModel> registerIbuHamil(RegisterIbuHamilRequestModel request);
  /// Upload profile photo (public, no auth) - for registration.
  Future<UploadProfilePhotoResponse> uploadIbuHamilProfilePhoto(File file);
  /// Logout ibu hamil. POST /auth/logout/ibu-hamil with Bearer token.
  Future<void> logoutIbuHamil();
  
  /// Update FCM token for current user. PUT /users/me/fcm-token
  Future<void> updateFcmToken(String fcmToken);
}

/// Implementation of AuthRemoteDataSource
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
            e.response?.data['message'] ?? 'Registration failed');
      } else {
        throw NetworkFailure(e.message ?? 'Network error');
      }
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
        
        // Handle specific error cases based on status code and message
        if (statusCode == 401) {
          // Email atau password salah
          final errorMessage = (detail is String ? detail : null) ?? 'Email atau password salah';
          throw ServerFailure(errorMessage);
        } else if (statusCode == 403) {
          // Akun tidak aktif atau bukan akun ibu hamil
          final errorMessage = (detail is String ? detail : null) ?? 'Akun tidak aktif. Silakan hubungi administrator.';
          throw ServerFailure(errorMessage);
        } else if (statusCode == 404) {
          // Email tidak terdaftar atau profil ibu hamil tidak ditemukan
          // Check the detail message to distinguish between the two cases
          if (detail is String) {
            if (detail.contains('tidak terdaftar')) {
              throw ServerFailure('Email tidak terdaftar di sistem');
            } else if (detail.contains('Profil ibu hamil') || detail.contains('profil ibu hamil')) {
              throw ServerFailure('Profil ibu hamil tidak ditemukan. Silakan lengkapi registrasi terlebih dahulu.');
            } else {
              throw ServerFailure(detail);
            }
          } else {
            throw ServerFailure('Email tidak terdaftar di sistem');
          }
        } else if (statusCode == 422) {
          // Validation error
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
          // Other server errors
          final errorMessage = (detail is String ? detail : null) ?? 
              (responseData?['message'] as String?) ?? 
              'Login gagal. Silakan coba lagi.';
          throw ServerFailure(errorMessage);
        }
      } else {
        // Network error (no response)
        throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah. Periksa koneksi internet Anda.');
      }
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  /// Format field name for user-friendly display
  String _formatFieldName(String field) {
    final fieldMap = {
      'email': 'Email',
      'password': 'Password',
    };
    return fieldMap[field] ?? field;
  }

  @override
  Future<UserModel> loginWithGoogle(String token) async {
    try {
      final response = await dio.post('/auth/google', data: {
        'token': token,
      });
      return UserModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerFailure(
            e.response?.data['message'] ?? 'Google login failed');
      } else {
        throw NetworkFailure(e.message ?? 'Network error');
      }
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
      
      // Response should contain ibu_hamil, user, access_token, token_type, message
      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        return RegisterIbuHamilResponseModel.fromJson(data);
      }
      throw ServerFailure('Invalid response format');
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 422) {
          // Validation error - log SEMUA detail untuk debugging
          final detail = responseData?['detail'];
          print('═══════════════════════════════════════════════════════════');
          print('❌ 422 VALIDATION ERROR - FULL RESPONSE:');
          print('═══════════════════════════════════════════════════════════');
          print('Response data: $responseData');
          print('Detail type: ${detail.runtimeType}');
          print('Detail value: $detail');
          
          String errorMessage = 'Data yang dimasukkan tidak valid';
          final allErrors = <String>[];

          if (detail is List && detail.isNotEmpty) {
            print('Total errors: ${detail.length}');
            for (int i = 0; i < detail.length; i++) {
              final error = detail[i];
              print('--- Error [$i]: $error');
              if (error is Map) {
                final msg = error['msg'] as String? ?? 'Unknown error';
                final loc = error['loc'] as List? ?? [];
                final type = error['type'] as String? ?? '';
                final input = error['input'];
                print('  msg: $msg');
                print('  loc: $loc');
                print('  type: $type');
                print('  input: $input');
                
                // Build readable error path
                final fieldPath = loc.where((l) => l != 'body').join('.');
                allErrors.add('$fieldPath: $msg');
              }
            }
            errorMessage = allErrors.join('\n');
          } else if (detail is String) {
            errorMessage = detail;
          } else if (detail is Map) {
            print('Detail as Map: $detail');
            errorMessage = detail.toString();
          }
          
          print('═══════════════════════════════════════════════════════════');
          print('📋 ALL ERRORS: $allErrors');
          print('═══════════════════════════════════════════════════════════');

          throw ValidationFailure(errorMessage);
        } else {
          throw ServerFailure(
              responseData?['detail'] ?? responseData?['message'] ?? 'Registrasi gagal');
        }
      } else {
        throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
      }
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
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
          detail?.toString() ?? 'Upload foto gagal',
        );
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
        final message = detail?.toString() ?? 'Logout gagal';
        throw ServerFailure(message);
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
      await dio.put('/users/me/fcm-token', data: {
        'fcm_token': fcmToken,
      });
    } on DioException catch (e) {
      if (e.response != null) {
        final detail = e.response?.data?['detail'] ?? e.response?.data?['message'];
        final message = detail?.toString() ?? 'Update FCM token gagal';
        throw ServerFailure(message);
      }
      throw NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }
}
