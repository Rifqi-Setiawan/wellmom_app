import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/auth/data/models/login_response_model.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/data/models/user_model.dart';

/// Abstract remote data source for authentication
abstract class AuthRemoteDataSource {
  Future<UserModel> register(Map<String, dynamic> data);
  Future<LoginResponseModel> login(String email, String password);
  Future<UserModel> loginWithGoogle(String token);
  Future<IbuHamilModel> registerIbuHamil(RegisterIbuHamilRequestModel request);
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
        
        // Handle specific error codes
        if (statusCode == 401) {
          final detail = responseData?['detail'] ?? 'Email atau password salah';
          throw ServerFailure(detail);
        } else if (statusCode == 403) {
          final detail = responseData?['detail'] ?? 
              'Akun tidak aktif. Silakan hubungi administrator.';
          throw ServerFailure(detail);
        } else if (statusCode == 404) {
          final detail = responseData?['detail'] ?? 'Email tidak terdaftar di sistem';
          throw ServerFailure(detail);
        } else if (statusCode == 422) {
          // Validation error
          final detail = responseData?['detail'];
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
          throw ServerFailure(
              responseData?['detail'] ?? responseData?['message'] ?? 'Login gagal');
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
  Future<IbuHamilModel> registerIbuHamil(RegisterIbuHamilRequestModel request) async {
    try {
      final response = await dio.post(
        '/ibu-hamil/register',
        data: request.toJson(),
      );
      
      // Response should contain ibu_hamil data
      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data.containsKey('ibu_hamil')) {
          return IbuHamilModel.fromJson(data['ibu_hamil'] as Map<String, dynamic>);
        } else {
          return IbuHamilModel.fromJson(data);
        }
      }
      throw ServerFailure('Invalid response format');
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        if (statusCode == 422) {
          // Validation error
          final detail = responseData?['detail'];
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
}
