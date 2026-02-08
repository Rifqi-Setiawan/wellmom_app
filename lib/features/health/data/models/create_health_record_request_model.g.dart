// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_health_record_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateHealthRecordRequestModel _$CreateHealthRecordRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreateHealthRecordRequestModel(
  bloodGlucose: (json['blood_glucose'] as num?)?.toDouble(),
  bloodPressureDiastolic: (json['blood_pressure_diastolic'] as num).toInt(),
  bloodPressureSystolic: (json['blood_pressure_systolic'] as num).toInt(),
  bodyTemperature: (json['body_temperature'] as num).toDouble(),
  checkedBy: json['checked_by'] as String,
  checkupDate: json['checkup_date'] as String,
  complaints: json['complaints'] as String,
  fetalHeartRate: (json['fetal_heart_rate'] as num?)?.toInt(),
  fundalHeight: (json['fundal_height'] as num?)?.toDouble(),
  gestationalAgeDays: (json['gestational_age_days'] as num?)?.toInt(),
  gestationalAgeWeeks: (json['gestational_age_weeks'] as num?)?.toInt(),
  heartRate: (json['heart_rate'] as num).toInt(),
  hemoglobin: (json['hemoglobin'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  perawatId: (json['perawat_id'] as num?)?.toInt(),
  proteinUrin: json['protein_urin'] as String?,
  upperArmCircumference: (json['upper_arm_circumference'] as num?)?.toDouble(),
  weight: (json['weight'] as num).toDouble(),
);

Map<String, dynamic> _$CreateHealthRecordRequestModelToJson(
  _CreateHealthRecordRequestModel instance,
) => <String, dynamic>{
  'blood_glucose': instance.bloodGlucose,
  'blood_pressure_diastolic': instance.bloodPressureDiastolic,
  'blood_pressure_systolic': instance.bloodPressureSystolic,
  'body_temperature': instance.bodyTemperature,
  'checked_by': instance.checkedBy,
  'checkup_date': instance.checkupDate,
  'complaints': instance.complaints,
  'fetal_heart_rate': instance.fetalHeartRate,
  'fundal_height': instance.fundalHeight,
  'gestational_age_days': instance.gestationalAgeDays,
  'gestational_age_weeks': instance.gestationalAgeWeeks,
  'heart_rate': instance.heartRate,
  'hemoglobin': instance.hemoglobin,
  'notes': instance.notes,
  'perawat_id': instance.perawatId,
  'protein_urin': instance.proteinUrin,
  'upper_arm_circumference': instance.upperArmCircumference,
  'weight': instance.weight,
};
