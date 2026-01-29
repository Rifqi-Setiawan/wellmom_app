import 'dart:io';

import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_request_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/login_response_entity.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_ibu_hamil_response_entity.dart';
import 'package:wellmom_app/features/auth/domain/entities/user_entity.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_form_entity.dart';

/// Abstract repository for authentication operations
abstract class AuthRepository {
  /// Register a new user
  Future<Either<Failure, UserEntity>> register(RegisterFormEntity form);

  /// Login with email and password
  Future<Either<Failure, LoginResponseEntity>> login(String email, String password);

  /// Login with Google
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  
  /// Register ibu hamil with complete data
  /// Returns [RegisterIbuHamilResponseEntity] containing ibu_hamil, user, and access_token
  Future<Either<Failure, RegisterIbuHamilResponseEntity>> registerIbuHamil(RegisterIbuHamilRequestModel request);

  /// Upload profile photo (public, for registration). Returns file_path on success.
  Future<Either<Failure, String>> uploadIbuHamilProfilePhoto(File file);
  
  /// Assign ibu hamil to puskesmas
  /// [accessToken] is required for authentication from registration response
  Future<Either<Failure, void>> assignIbuHamilToPuskesmas(int puskesmasId, int ibuHamilId, String accessToken);
}

/// Either type for error handling (simple implementation)
class Either<L, R> {
  final L? _left;
  final R? _right;

  Either.left(this._left) : _right = null;
  Either.right(this._right) : _left = null;

  bool get isLeft => _left != null;
  bool get isRight => _right != null;

  L get left {
    if (_left == null) throw StateError('Either is Right, not Left');
    return _left as L;
  }

  R get right {
    if (_right == null) throw StateError('Either is Left, not Right');
    return _right as R;
  }

  T fold<T>(T Function(L) onLeft, T Function(R) onRight) {
    if (isLeft) {
      return onLeft(_left as L);
    } else {
      return onRight(_right as R);
    }
  }
}
