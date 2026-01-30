import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_request.dart';
import 'package:wellmom_app/features/kerabat/data/models/invite_code_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_dashboard_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_health_records_response_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_login_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_me_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_notification_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_risk_status_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/my_kerabat_item_model.dart';

abstract class KerabatRepository {
  Future<Either<Failure, InviteCodeResponse>> generateInviteCode();
  Future<Either<Failure, KerabatLoginResponse>> loginWithInviteCode(
    String inviteCode,
  );
  Future<Either<Failure, MyKerabatItemModel>> completeProfile(
    CompleteProfileRequest request,
  );
  Future<Either<Failure, List<MyKerabatItemModel>>> getMyKerabat();

  Future<Either<Failure, KerabatDashboardModel>> getDashboard();
  Future<Either<Failure, KerabatHealthRecordsResponseModel>> getHealthRecords({
    int page = 1,
    int perPage = 10,
  });
  Future<Either<Failure, KerabatHealthRecordItemModel>> getHealthRecordDetail(
    int recordId,
  );
  Future<Either<Failure, KerabatRiskStatusModel>> getRiskStatus();
  Future<Either<Failure, KerabatNotificationsResponseModel>> getNotifications({
    bool unreadOnly = false,
  });
  Future<Either<Failure, int>> markNotificationsRead({
    List<int>? notificationIds,
  });
  Future<Either<Failure, KerabatMeModel>> getKerabatMe();
  Future<Either<Failure, void>> logoutKerabat();
}
