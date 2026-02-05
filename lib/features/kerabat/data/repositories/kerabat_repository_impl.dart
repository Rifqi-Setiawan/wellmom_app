import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/kerabat/data/datasources/kerabat_remote_datasource.dart';
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
import 'package:wellmom_app/features/kerabat/domain/repositories/kerabat_repository.dart';

class KerabatRepositoryImpl implements KerabatRepository {
  final KerabatRemoteDataSource remoteDataSource;

  KerabatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, InviteCodeResponse>> generateInviteCode() async {
    try {
      final result = await remoteDataSource.generateInviteCode();
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KerabatLoginResponse>> loginWithInviteCode(
    String inviteCode,
  ) async {
    try {
      final result = await remoteDataSource.loginWithInviteCode(inviteCode);
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompleteProfileResponse>> completeProfile(
    CompleteProfileRequest request,
  ) async {
    try {
      final result = await remoteDataSource.completeProfile(request);
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MyKerabatItemModel>>> getMyKerabat() async {
    try {
      final result = await remoteDataSource.getMyKerabat();
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KerabatDashboardModel>> getDashboard() async {
    try {
      final result = await remoteDataSource.getDashboard();
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KerabatHealthRecordsResponseModel>> getHealthRecords({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final result = await remoteDataSource.getHealthRecords(
        page: page,
        perPage: perPage,
      );
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KerabatHealthRecordItemModel>> getHealthRecordDetail(
    int recordId,
  ) async {
    try {
      final result = await remoteDataSource.getHealthRecordDetail(recordId);
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KerabatRiskStatusModel>> getRiskStatus() async {
    try {
      final result = await remoteDataSource.getRiskStatus();
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KerabatNotificationsResponseModel>> getNotifications({
    bool unreadOnly = false,
  }) async {
    try {
      final result = await remoteDataSource.getNotifications(
        unreadOnly: unreadOnly,
      );
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> markNotificationsRead({
    List<int>? notificationIds,
  }) async {
    try {
      final result = await remoteDataSource.markNotificationsRead(
        notificationIds: notificationIds,
      );
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KerabatMeModel>> getKerabatMe() async {
    try {
      final result = await remoteDataSource.getKerabatMe();
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logoutKerabat() async {
    try {
      await remoteDataSource.logoutKerabat();
      return Either.right(null);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }
}
