import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/kerabat/data/datasources/kerabat_remote_datasource.dart';
import 'package:wellmom_app/features/kerabat/data/models/complete_profile_request.dart';
import 'package:wellmom_app/features/kerabat/data/models/invite_code_response.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_login_response.dart';
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
  Future<Either<Failure, MyKerabatItemModel>> completeProfile(
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
}
