// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_record_model.freezed.dart';
part 'health_record_model.g.dart';

/// Health Record model for pregnancy checkup records
@freezed
class HealthRecordModel with _$HealthRecordModel {
  const factory HealthRecordModel({
    required int id,
    @JsonKey(name: 'ibu_hamil_id') required int ibuHamilId,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'checkup_date') required DateTime checkupDate,
    @JsonKey(name: 'checkup_type')
        required String checkupType, // 'berkala' or 'ad-hoc'
    @JsonKey(name: 'data_source')
        required String dataSource, // 'manual' or 'iot_device'
    @JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,
    @JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,
    @JsonKey(name: 'blood_pressure_systolic') int? bloodPressureSystolic,
    @JsonKey(name: 'blood_pressure_diastolic') int? bloodPressureDiastolic,
    @JsonKey(name: 'blood_glucose') double? bloodGlucose,
    @JsonKey(name: 'body_temperature') double? bodyTemperature,
    @JsonKey(name: 'heart_rate') int? heartRate,
    @JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,
    @JsonKey(name: 'fundal_height_cm') double? fundalHeightCm,
    String? complaints,
    @JsonKey(name: 'physical_examination') String? physicalExamination,
    String? diagnosis,
    @JsonKey(name: 'treatment_plan') String? treatmentPlan,
    String? medications,
    String? supplements,
    @JsonKey(name: 'referral_needed') @Default(false) bool referralNeeded,
    @JsonKey(name: 'referral_notes') String? referralNotes,
    @JsonKey(name: 'next_checkup_date') DateTime? nextCheckupDate,
    @JsonKey(name: 'next_checkup_notes') String? nextCheckupNotes,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _HealthRecordModel;

  factory HealthRecordModel.fromJson(Map<String, dynamic> json) =>
      _$HealthRecordModelFromJson(json);
}
