import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_health_record_request_model.freezed.dart';
part 'create_health_record_request_model.g.dart';

/// Request model for creating a health record
@freezed
abstract class CreateHealthRecordRequestModel with _$CreateHealthRecordRequestModel {
  const factory CreateHealthRecordRequestModel({
    @JsonKey(name: 'blood_glucose') double? bloodGlucose,
    @JsonKey(name: 'blood_pressure_diastolic') required int bloodPressureDiastolic,
    @JsonKey(name: 'blood_pressure_systolic') required int bloodPressureSystolic,
    @JsonKey(name: 'body_temperature') required double bodyTemperature,
    @JsonKey(name: 'checked_by') required String checkedBy,
    @JsonKey(name: 'checkup_date') required String checkupDate,
    required String complaints,
    @JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,
    @JsonKey(name: 'fundal_height') double? fundalHeight,
    @JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,
    @JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,
    @JsonKey(name: 'heart_rate') required int heartRate,
    double? hemoglobin,
    String? notes,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'protein_urin') String? proteinUrin,
    @JsonKey(name: 'upper_arm_circumference') double? upperArmCircumference,
    required double weight,
  }) = _CreateHealthRecordRequestModel;

  factory CreateHealthRecordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateHealthRecordRequestModelFromJson(json);
}
