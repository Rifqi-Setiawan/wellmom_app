import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_request.dart';
import 'package:wellmom_app/features/kerabat/data/models/invite_code_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_login_response.dart';
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
}
