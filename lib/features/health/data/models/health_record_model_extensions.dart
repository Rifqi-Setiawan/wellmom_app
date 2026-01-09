import 'package:wellmom_app/features/health/data/models/health_record_model.dart';

/// Extension to add validation methods to HealthRecordModel
extension HealthRecordModelExtensions on HealthRecordModel {
  /// Validate checkup type
  bool isValidCheckupType() {
    return checkupType == 'berkala' || checkupType == 'ad-hoc';
  }

  /// Validate data source
  bool isValidDataSource() {
    return dataSource == 'manual' || dataSource == 'iot_device';
  }
}
