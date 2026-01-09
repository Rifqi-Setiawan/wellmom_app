import 'package:wellmom_app/features/auth/data/models/login_response_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/login_response_entity.dart';

/// Extension to convert LoginResponseModel to LoginResponseEntity
extension LoginResponseModelExtensions on LoginResponseModel {
  /// Convert LoginResponseModel to LoginResponseEntity
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      accessToken: accessToken,
      tokenType: tokenType,
      userId: userId,
      ibuHamilId: ibuHamilId,
      namaLengkap: namaLengkap,
      email: email,
    );
  }
}
