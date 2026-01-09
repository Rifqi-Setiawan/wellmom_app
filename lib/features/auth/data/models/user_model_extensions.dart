import 'package:wellmom_app/features/auth/data/models/user_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/user_entity.dart';

/// Extension to add methods to UserModel
extension UserModelExtensions on UserModel {
  /// Convert UserModel to UserEntity
  /// Note: UserEntity requires fields (nik, tanggalLahir, alamat) that may not be in UserModel
  /// These are set to defaults - consider updating UserEntity structure to match UserModel
  UserEntity toEntity() {
    return UserEntity(
      id: id.toString(),
      namaLengkap: fullName,
      nik: '', // NIK not available in UserModel, will need to be set separately
      tanggalLahir: DateTime.now(), // Not available in UserModel, using current date as default
      alamat: '', // Not available in UserModel, will need to be set separately
      latitude: null,
      longitude: null,
    );
  }

  /// Validate phone number format (E.164)
  bool isValidPhone() {
    // E.164 format: +[country code][number], max 15 digits
    final phoneRegex = RegExp(r'^\+[1-9]\d{1,14}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Validate role
  bool isValidRole() {
    return role == 'ibu_hamil' || role == 'kerabat';
  }
}
