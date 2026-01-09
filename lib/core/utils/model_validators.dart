/// Utility class for model validations
class ModelValidators {
  ModelValidators._();

  /// Validate NIK (must be exactly 16 digits)
  static bool isValidNik(String nik) {
    return nik.length == 16 && RegExp(r'^\d{16}$').hasMatch(nik);
  }

  /// Validate phone number in E.164 format
  /// Format: +[country code][number], max 15 digits
  static bool isValidE164Phone(String phone) {
    final phoneRegex = RegExp(r'^\+[1-9]\d{1,14}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Validate role
  static bool isValidRole(String role) {
    return role == 'ibu_hamil' || role == 'kerabat';
  }

  /// Validate risk level
  static bool isValidRiskLevel(String? riskLevel) {
    if (riskLevel == null) return true;
    return ['low', 'normal', 'high'].contains(riskLevel.toLowerCase());
  }

  /// Validate checkup type
  static bool isValidCheckupType(String checkupType) {
    return checkupType == 'berkala' || checkupType == 'ad-hoc';
  }

  /// Validate data source
  static bool isValidDataSource(String dataSource) {
    return dataSource == 'manual' || dataSource == 'iot_device';
  }

  /// Validate relation type (common Indonesian relations)
  static bool isValidRelationType(String relationType) {
    final validRelations = [
      'Suami',
      'Istri',
      'Ayah',
      'Ibu',
      'Kakak',
      'Adik',
      'Kakek',
      'Nenek',
      'Paman',
      'Bibi',
      'Saudara',
      'Lainnya',
    ];
    return validRelations.contains(relationType);
  }
}
