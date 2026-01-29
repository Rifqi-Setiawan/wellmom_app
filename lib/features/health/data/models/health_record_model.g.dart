// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthRecordModelImpl _$$HealthRecordModelImplFromJson(
  Map<String, dynamic> json,
) => _$HealthRecordModelImpl(
  id: (json['id'] as num).toInt(),
  ibuHamilId: (json['ibu_hamil_id'] as num).toInt(),
  perawatId: (json['perawat_id'] as num?)?.toInt(),
  checkupDate: DateTime.parse(json['checkup_date'] as String),
  checkupType: json['checkup_type'] as String,
  dataSource: json['data_source'] as String,
  gestationalAgeWeeks: (json['gestational_age_weeks'] as num?)?.toInt(),
  gestationalAgeDays: (json['gestational_age_days'] as num?)?.toInt(),
  bloodPressureSystolic: (json['blood_pressure_systolic'] as num?)?.toInt(),
  bloodPressureDiastolic: (json['blood_pressure_diastolic'] as num?)?.toInt(),
  bloodGlucose: (json['blood_glucose'] as num?)?.toDouble(),
  bodyTemperature: (json['body_temperature'] as num?)?.toDouble(),
  heartRate: (json['heart_rate'] as num?)?.toInt(),
  fetalHeartRate: (json['fetal_heart_rate'] as num?)?.toInt(),
  fundalHeightCm: (json['fundal_height_cm'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  complaints: json['complaints'] as String?,
  physicalExamination: json['physical_examination'] as String?,
  diagnosis: json['diagnosis'] as String?,
  treatmentPlan: json['treatment_plan'] as String?,
  medications: json['medications'] as String?,
  supplements: json['supplements'] as String?,
  referralNeeded: json['referral_needed'] as bool? ?? false,
  referralNotes: json['referral_notes'] as String?,
  nextCheckupDate: json['next_checkup_date'] == null
      ? null
      : DateTime.parse(json['next_checkup_date'] as String),
  nextCheckupNotes: json['next_checkup_notes'] as String?,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$HealthRecordModelImplToJson(
  _$HealthRecordModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'ibu_hamil_id': instance.ibuHamilId,
  'perawat_id': instance.perawatId,
  'checkup_date': instance.checkupDate.toIso8601String(),
  'checkup_type': instance.checkupType,
  'data_source': instance.dataSource,
  'gestational_age_weeks': instance.gestationalAgeWeeks,
  'gestational_age_days': instance.gestationalAgeDays,
  'blood_pressure_systolic': instance.bloodPressureSystolic,
  'blood_pressure_diastolic': instance.bloodPressureDiastolic,
  'blood_glucose': instance.bloodGlucose,
  'body_temperature': instance.bodyTemperature,
  'heart_rate': instance.heartRate,
  'fetal_heart_rate': instance.fetalHeartRate,
  'fundal_height_cm': instance.fundalHeightCm,
  'weight': instance.weight,
  'complaints': instance.complaints,
  'physical_examination': instance.physicalExamination,
  'diagnosis': instance.diagnosis,
  'treatment_plan': instance.treatmentPlan,
  'medications': instance.medications,
  'supplements': instance.supplements,
  'referral_needed': instance.referralNeeded,
  'referral_notes': instance.referralNotes,
  'next_checkup_date': instance.nextCheckupDate?.toIso8601String(),
  'next_checkup_notes': instance.nextCheckupNotes,
  'notes': instance.notes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
