import 'package:wellmom_app/features/auth/data/models/user_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/user_entity.dart';

extension UserModelExtensions on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id.toString(),
      namaLengkap: fullName,
      nik: '',
      tanggalLahir: DateTime.now(),
      alamat: '',
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
