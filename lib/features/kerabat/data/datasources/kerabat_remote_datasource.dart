import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_request.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/invite_code_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_dashboard_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_health_records_response_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_login_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_me_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_notification_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_risk_status_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/my_kerabat_item_model.dart';

abstract class KerabatRemoteDataSource {
  Future<InviteCodeResponse> generateInviteCode();
  Future<KerabatLoginResponse> loginWithInviteCode(String inviteCode);
  Future<CompleteProfileResponse> completeProfile(CompleteProfileRequest request);
  Future<List<MyKerabatItemModel>> getMyKerabat();

  Future<KerabatDashboardModel> getDashboard();
  Future<KerabatHealthRecordsResponseModel> getHealthRecords({int page = 1, int perPage = 10});
  Future<KerabatHealthRecordItemModel> getHealthRecordDetail(int recordId);
  Future<KerabatRiskStatusModel> getRiskStatus();
  Future<KerabatNotificationsResponseModel> getNotifications({bool unreadOnly = false});
  Future<int> markNotificationsRead({List<int>? notificationIds});
  Future<KerabatMeModel> getKerabatMe();
  Future<void> logoutKerabat();
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
  Future<CompleteProfileResponse> completeProfile(
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
      return CompleteProfileResponse.fromJson(
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

  @override
  Future<KerabatDashboardModel> getDashboard() async {
    try {
      final response = await dio.get('/kerabat/dashboard');
      if (response.data is! Map) throw ServerFailure('Format respons tidak valid');
      return KerabatDashboardModel.fromJson(
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
  Future<KerabatHealthRecordsResponseModel> getHealthRecords({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await dio.get(
        '/kerabat/health-records',
        queryParameters: {'page': page, 'per_page': perPage},
      );
      if (response.data is! Map) throw ServerFailure('Format respons tidak valid');
      return KerabatHealthRecordsResponseModel.fromJson(
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
  Future<KerabatHealthRecordItemModel> getHealthRecordDetail(int recordId) async {
    try {
      final response = await dio.get('/kerabat/health-records/$recordId');
      if (response.data is! Map) throw ServerFailure('Format respons tidak valid');
      return KerabatHealthRecordItemModel.fromJson(
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
  Future<KerabatRiskStatusModel> getRiskStatus() async {
    try {
      final response = await dio.get('/kerabat/risk-status');
      if (response.data is! Map) throw ServerFailure('Format respons tidak valid');
      return KerabatRiskStatusModel.fromJson(
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
  Future<KerabatNotificationsResponseModel> getNotifications({
    bool unreadOnly = false,
  }) async {
    try {
      final response = await dio.get(
        '/kerabat/notifications',
        queryParameters: {'unread_only': unreadOnly},
      );
      if (response.data is! Map) throw ServerFailure('Format respons tidak valid');
      return KerabatNotificationsResponseModel.fromJson(
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
  Future<int> markNotificationsRead({List<int>? notificationIds}) async {
    try {
      final body = notificationIds == null
          ? <String, dynamic>{'notification_ids': null}
          : <String, dynamic>{'notification_ids': notificationIds};
      final response = await dio.patch(
        '/kerabat/notifications/mark-read',
        data: body,
      );
      if (response.data is! Map) return 0;
      final data = response.data as Map<String, dynamic>;
      return (data['marked_count'] as num?)?.toInt() ?? 0;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<KerabatMeModel> getKerabatMe() async {
    try {
      final response = await dio.get('/kerabat/me');
      if (response.data is! Map) throw ServerFailure('Format respons tidak valid');
      return KerabatMeModel.fromJson(
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
  Future<void> logoutKerabat() async {
    try {
      await dio.post('/kerabat/logout');
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

    if (status == 401) {
      return ServerFailure(
        message.contains('token') || message.contains('expired')
            ? message
            : 'Sesi berakhir. Silakan login kembali.',
      );
    }
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
