import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:wellmom_app/features/auth/data/datasources/puskesmas_remote_datasource.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model_extensions.dart';
import 'package:wellmom_app/features/auth/data/models/login_response_model_extensions.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/data/models/user_model_extensions.dart';
import 'package:wellmom_app/features/auth/domain/entities/ibu_hamil_entity.dart';
import 'package:wellmom_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_form_entity.dart';
import 'package:wellmom_app/features/auth/domain/entities/user_entity.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final PuskesmasRemoteDataSource puskesmasRemoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.puskesmasRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(RegisterFormEntity form) async {
    try {
      // Validate form
      final validationError = form.validate();
      if (validationError != null) {
        return Either.left(ValidationFailure(validationError));
      }

      // Convert to data model format
      final data = {
        'nama_lengkap': form.namaLengkap,
        'nik': form.nik,
        'tanggal_lahir': form.tanggalLahir.toIso8601String(),
        'alamat': form.alamat,
        if (form.latitude != null) 'latitude': form.latitude,
        if (form.longitude != null) 'longitude': form.longitude,
      };

      final userModel = await remoteDataSource.register(data);
      return Either.right(userModel.toEntity());
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      String email, String password) async {
    try {
      final loginResponse = await remoteDataSource.login(email, password);
      return Either.right(loginResponse.toEntity());
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      // TODO: Implement Google Sign-In token retrieval
      // For now, this is a placeholder
      throw const ServerFailure('Google login not implemented yet');
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, IbuHamilEntity>> registerIbuHamil(
      RegisterIbuHamilRequestModel request) async {
    try {
      final ibuHamilModel = await remoteDataSource.registerIbuHamil(request);
      return Either.right(ibuHamilModel.toEntity());
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> assignIbuHamilToPuskesmas(
      int puskesmasId, int ibuHamilId) async {
    try {
      await puskesmasRemoteDataSource.assignIbuHamilToPuskesmas(
          puskesmasId, ibuHamilId);
      return Either.right(null);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }
}
