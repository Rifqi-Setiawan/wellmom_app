import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/ibu_hamil_entity.dart';

/// Extension to add validation methods to IbuHamilModel
extension IbuHamilModelExtensions on IbuHamilModel {
  /// Validate NIK (must be 16 digits)
  bool isValidNik() {
    return nik.length == 16 && RegExp(r'^\d{16}$').hasMatch(nik);
  }

  /// Validate risk level
  bool isValidRiskLevel() {
    if (riskLevel == null) return true;
    return ['low', 'normal', 'high'].contains(riskLevel);
  }
  
  /// Convert IbuHamilModel to IbuHamilEntity
  IbuHamilEntity toEntity() {
    return IbuHamilEntity(
      id: id,
      userId: userId,
      namaLengkap: namaLengkap,
      nik: nik,
    );
  }
}
