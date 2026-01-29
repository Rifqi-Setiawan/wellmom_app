/// Response model for health records by date
class HealthRecordsResponseModel {
  final List<HealthRecordByDateModel> records;
  final int total;

  const HealthRecordsResponseModel({
    required this.records,
    required this.total,
  });

  factory HealthRecordsResponseModel.fromJson(Map<String, dynamic> json) {
    final rawRecords = json['records'] as List<dynamic>? ?? [];
    return HealthRecordsResponseModel(
      records: rawRecords
          .whereType<Map<String, dynamic>>()
          .map(HealthRecordByDateModel.fromJson)
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
    );
  }
}

/// Health record model for bydate endpoint
class HealthRecordByDateModel {
  final int id;
  final int ibuHamilId;
  final int? perawatId;
  final String checkupDate;
  final String? checkedBy;
  final int? gestationalAgeWeeks;
  final int? gestationalAgeDays;
  final int? bloodPressureSystolic;
  final int? bloodPressureDiastolic;
  final double? bloodGlucose;
  final double? bodyTemperature;
  final int? heartRate;
  final int? fetalHeartRate;
  final double? fundalHeight;
  final double? upperArmCircumference;
  final double? weight;
  final String? hemoglobin;
  final String? proteinUrin;
  final String? complaints;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const HealthRecordByDateModel({
    required this.id,
    required this.ibuHamilId,
    required this.checkupDate,
    required this.createdAt,
    required this.updatedAt,
    this.perawatId,
    this.checkedBy,
    this.gestationalAgeWeeks,
    this.gestationalAgeDays,
    this.bloodPressureSystolic,
    this.bloodPressureDiastolic,
    this.bloodGlucose,
    this.bodyTemperature,
    this.heartRate,
    this.fetalHeartRate,
    this.fundalHeight,
    this.upperArmCircumference,
    this.weight,
    this.hemoglobin,
    this.proteinUrin,
    this.complaints,
    this.notes,
  });

  factory HealthRecordByDateModel.fromJson(Map<String, dynamic> json) {
    return HealthRecordByDateModel(
      id: (json['id'] as num).toInt(),
      ibuHamilId: (json['ibu_hamil_id'] as num).toInt(),
      perawatId: (json['perawat_id'] as num?)?.toInt(),
      checkupDate: json['checkup_date'] as String,
      checkedBy: json['checked_by'] as String?,
      gestationalAgeWeeks: (json['gestational_age_weeks'] as num?)?.toInt(),
      gestationalAgeDays: (json['gestational_age_days'] as num?)?.toInt(),
      bloodPressureSystolic: (json['blood_pressure_systolic'] as num?)?.toInt(),
      bloodPressureDiastolic: (json['blood_pressure_diastolic'] as num?)?.toInt(),
      bloodGlucose: (json['blood_glucose'] as num?)?.toDouble(),
      bodyTemperature: (json['body_temperature'] as num?)?.toDouble(),
      heartRate: (json['heart_rate'] as num?)?.toInt(),
      fetalHeartRate: (json['fetal_heart_rate'] as num?)?.toInt(),
      fundalHeight: (json['fundal_height'] as num?)?.toDouble(),
      upperArmCircumference:
          (json['upper_arm_circumference'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      hemoglobin: json['hemoglobin']?.toString(),
      proteinUrin: json['protein_urin']?.toString(),
      complaints: json['complaints'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
