// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthRecordModel {

 int get id;@JsonKey(name: 'ibu_hamil_id') int get ibuHamilId;@JsonKey(name: 'perawat_id') int? get perawatId;@JsonKey(name: 'checkup_date') DateTime get checkupDate;@JsonKey(name: 'checkup_type') String get checkupType;// 'berkala' or 'ad-hoc'
@JsonKey(name: 'data_source') String get dataSource;// 'manual' or 'iot_device'
@JsonKey(name: 'gestational_age_weeks') int? get gestationalAgeWeeks;@JsonKey(name: 'gestational_age_days') int? get gestationalAgeDays;@JsonKey(name: 'blood_pressure_systolic') int? get bloodPressureSystolic;@JsonKey(name: 'blood_pressure_diastolic') int? get bloodPressureDiastolic;@JsonKey(name: 'blood_glucose') double? get bloodGlucose;@JsonKey(name: 'body_temperature') double? get bodyTemperature;@JsonKey(name: 'heart_rate') int? get heartRate;@JsonKey(name: 'fetal_heart_rate') int? get fetalHeartRate;@JsonKey(name: 'fundal_height_cm') double? get fundalHeightCm;@JsonKey(name: 'weight') double? get weight; String? get complaints;@JsonKey(name: 'physical_examination') String? get physicalExamination; String? get diagnosis;@JsonKey(name: 'treatment_plan') String? get treatmentPlan; String? get medications; String? get supplements;@JsonKey(name: 'referral_needed') bool get referralNeeded;@JsonKey(name: 'referral_notes') String? get referralNotes;@JsonKey(name: 'next_checkup_date') DateTime? get nextCheckupDate;@JsonKey(name: 'next_checkup_notes') String? get nextCheckupNotes; String? get notes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of HealthRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthRecordModelCopyWith<HealthRecordModel> get copyWith => _$HealthRecordModelCopyWithImpl<HealthRecordModel>(this as HealthRecordModel, _$identity);

  /// Serializes this HealthRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ibuHamilId, ibuHamilId) || other.ibuHamilId == ibuHamilId)&&(identical(other.perawatId, perawatId) || other.perawatId == perawatId)&&(identical(other.checkupDate, checkupDate) || other.checkupDate == checkupDate)&&(identical(other.checkupType, checkupType) || other.checkupType == checkupType)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.gestationalAgeWeeks, gestationalAgeWeeks) || other.gestationalAgeWeeks == gestationalAgeWeeks)&&(identical(other.gestationalAgeDays, gestationalAgeDays) || other.gestationalAgeDays == gestationalAgeDays)&&(identical(other.bloodPressureSystolic, bloodPressureSystolic) || other.bloodPressureSystolic == bloodPressureSystolic)&&(identical(other.bloodPressureDiastolic, bloodPressureDiastolic) || other.bloodPressureDiastolic == bloodPressureDiastolic)&&(identical(other.bloodGlucose, bloodGlucose) || other.bloodGlucose == bloodGlucose)&&(identical(other.bodyTemperature, bodyTemperature) || other.bodyTemperature == bodyTemperature)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.fetalHeartRate, fetalHeartRate) || other.fetalHeartRate == fetalHeartRate)&&(identical(other.fundalHeightCm, fundalHeightCm) || other.fundalHeightCm == fundalHeightCm)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.complaints, complaints) || other.complaints == complaints)&&(identical(other.physicalExamination, physicalExamination) || other.physicalExamination == physicalExamination)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.treatmentPlan, treatmentPlan) || other.treatmentPlan == treatmentPlan)&&(identical(other.medications, medications) || other.medications == medications)&&(identical(other.supplements, supplements) || other.supplements == supplements)&&(identical(other.referralNeeded, referralNeeded) || other.referralNeeded == referralNeeded)&&(identical(other.referralNotes, referralNotes) || other.referralNotes == referralNotes)&&(identical(other.nextCheckupDate, nextCheckupDate) || other.nextCheckupDate == nextCheckupDate)&&(identical(other.nextCheckupNotes, nextCheckupNotes) || other.nextCheckupNotes == nextCheckupNotes)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ibuHamilId,perawatId,checkupDate,checkupType,dataSource,gestationalAgeWeeks,gestationalAgeDays,bloodPressureSystolic,bloodPressureDiastolic,bloodGlucose,bodyTemperature,heartRate,fetalHeartRate,fundalHeightCm,weight,complaints,physicalExamination,diagnosis,treatmentPlan,medications,supplements,referralNeeded,referralNotes,nextCheckupDate,nextCheckupNotes,notes,createdAt,updatedAt]);

@override
String toString() {
  return 'HealthRecordModel(id: $id, ibuHamilId: $ibuHamilId, perawatId: $perawatId, checkupDate: $checkupDate, checkupType: $checkupType, dataSource: $dataSource, gestationalAgeWeeks: $gestationalAgeWeeks, gestationalAgeDays: $gestationalAgeDays, bloodPressureSystolic: $bloodPressureSystolic, bloodPressureDiastolic: $bloodPressureDiastolic, bloodGlucose: $bloodGlucose, bodyTemperature: $bodyTemperature, heartRate: $heartRate, fetalHeartRate: $fetalHeartRate, fundalHeightCm: $fundalHeightCm, weight: $weight, complaints: $complaints, physicalExamination: $physicalExamination, diagnosis: $diagnosis, treatmentPlan: $treatmentPlan, medications: $medications, supplements: $supplements, referralNeeded: $referralNeeded, referralNotes: $referralNotes, nextCheckupDate: $nextCheckupDate, nextCheckupNotes: $nextCheckupNotes, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HealthRecordModelCopyWith<$Res>  {
  factory $HealthRecordModelCopyWith(HealthRecordModel value, $Res Function(HealthRecordModel) _then) = _$HealthRecordModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'ibu_hamil_id') int ibuHamilId,@JsonKey(name: 'perawat_id') int? perawatId,@JsonKey(name: 'checkup_date') DateTime checkupDate,@JsonKey(name: 'checkup_type') String checkupType,@JsonKey(name: 'data_source') String dataSource,@JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,@JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,@JsonKey(name: 'blood_pressure_systolic') int? bloodPressureSystolic,@JsonKey(name: 'blood_pressure_diastolic') int? bloodPressureDiastolic,@JsonKey(name: 'blood_glucose') double? bloodGlucose,@JsonKey(name: 'body_temperature') double? bodyTemperature,@JsonKey(name: 'heart_rate') int? heartRate,@JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,@JsonKey(name: 'fundal_height_cm') double? fundalHeightCm,@JsonKey(name: 'weight') double? weight, String? complaints,@JsonKey(name: 'physical_examination') String? physicalExamination, String? diagnosis,@JsonKey(name: 'treatment_plan') String? treatmentPlan, String? medications, String? supplements,@JsonKey(name: 'referral_needed') bool referralNeeded,@JsonKey(name: 'referral_notes') String? referralNotes,@JsonKey(name: 'next_checkup_date') DateTime? nextCheckupDate,@JsonKey(name: 'next_checkup_notes') String? nextCheckupNotes, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$HealthRecordModelCopyWithImpl<$Res>
    implements $HealthRecordModelCopyWith<$Res> {
  _$HealthRecordModelCopyWithImpl(this._self, this._then);

  final HealthRecordModel _self;
  final $Res Function(HealthRecordModel) _then;

/// Create a copy of HealthRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ibuHamilId = null,Object? perawatId = freezed,Object? checkupDate = null,Object? checkupType = null,Object? dataSource = null,Object? gestationalAgeWeeks = freezed,Object? gestationalAgeDays = freezed,Object? bloodPressureSystolic = freezed,Object? bloodPressureDiastolic = freezed,Object? bloodGlucose = freezed,Object? bodyTemperature = freezed,Object? heartRate = freezed,Object? fetalHeartRate = freezed,Object? fundalHeightCm = freezed,Object? weight = freezed,Object? complaints = freezed,Object? physicalExamination = freezed,Object? diagnosis = freezed,Object? treatmentPlan = freezed,Object? medications = freezed,Object? supplements = freezed,Object? referralNeeded = null,Object? referralNotes = freezed,Object? nextCheckupDate = freezed,Object? nextCheckupNotes = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ibuHamilId: null == ibuHamilId ? _self.ibuHamilId : ibuHamilId // ignore: cast_nullable_to_non_nullable
as int,perawatId: freezed == perawatId ? _self.perawatId : perawatId // ignore: cast_nullable_to_non_nullable
as int?,checkupDate: null == checkupDate ? _self.checkupDate : checkupDate // ignore: cast_nullable_to_non_nullable
as DateTime,checkupType: null == checkupType ? _self.checkupType : checkupType // ignore: cast_nullable_to_non_nullable
as String,dataSource: null == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String,gestationalAgeWeeks: freezed == gestationalAgeWeeks ? _self.gestationalAgeWeeks : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
as int?,gestationalAgeDays: freezed == gestationalAgeDays ? _self.gestationalAgeDays : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
as int?,bloodPressureSystolic: freezed == bloodPressureSystolic ? _self.bloodPressureSystolic : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
as int?,bloodPressureDiastolic: freezed == bloodPressureDiastolic ? _self.bloodPressureDiastolic : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
as int?,bloodGlucose: freezed == bloodGlucose ? _self.bloodGlucose : bloodGlucose // ignore: cast_nullable_to_non_nullable
as double?,bodyTemperature: freezed == bodyTemperature ? _self.bodyTemperature : bodyTemperature // ignore: cast_nullable_to_non_nullable
as double?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,fetalHeartRate: freezed == fetalHeartRate ? _self.fetalHeartRate : fetalHeartRate // ignore: cast_nullable_to_non_nullable
as int?,fundalHeightCm: freezed == fundalHeightCm ? _self.fundalHeightCm : fundalHeightCm // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,complaints: freezed == complaints ? _self.complaints : complaints // ignore: cast_nullable_to_non_nullable
as String?,physicalExamination: freezed == physicalExamination ? _self.physicalExamination : physicalExamination // ignore: cast_nullable_to_non_nullable
as String?,diagnosis: freezed == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String?,treatmentPlan: freezed == treatmentPlan ? _self.treatmentPlan : treatmentPlan // ignore: cast_nullable_to_non_nullable
as String?,medications: freezed == medications ? _self.medications : medications // ignore: cast_nullable_to_non_nullable
as String?,supplements: freezed == supplements ? _self.supplements : supplements // ignore: cast_nullable_to_non_nullable
as String?,referralNeeded: null == referralNeeded ? _self.referralNeeded : referralNeeded // ignore: cast_nullable_to_non_nullable
as bool,referralNotes: freezed == referralNotes ? _self.referralNotes : referralNotes // ignore: cast_nullable_to_non_nullable
as String?,nextCheckupDate: freezed == nextCheckupDate ? _self.nextCheckupDate : nextCheckupDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextCheckupNotes: freezed == nextCheckupNotes ? _self.nextCheckupNotes : nextCheckupNotes // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthRecordModel].
extension HealthRecordModelPatterns on HealthRecordModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthRecordModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthRecordModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthRecordModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'ibu_hamil_id')  int ibuHamilId, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'checkup_date')  DateTime checkupDate, @JsonKey(name: 'checkup_type')  String checkupType, @JsonKey(name: 'data_source')  String dataSource, @JsonKey(name: 'gestational_age_weeks')  int? gestationalAgeWeeks, @JsonKey(name: 'gestational_age_days')  int? gestationalAgeDays, @JsonKey(name: 'blood_pressure_systolic')  int? bloodPressureSystolic, @JsonKey(name: 'blood_pressure_diastolic')  int? bloodPressureDiastolic, @JsonKey(name: 'blood_glucose')  double? bloodGlucose, @JsonKey(name: 'body_temperature')  double? bodyTemperature, @JsonKey(name: 'heart_rate')  int? heartRate, @JsonKey(name: 'fetal_heart_rate')  int? fetalHeartRate, @JsonKey(name: 'fundal_height_cm')  double? fundalHeightCm, @JsonKey(name: 'weight')  double? weight,  String? complaints, @JsonKey(name: 'physical_examination')  String? physicalExamination,  String? diagnosis, @JsonKey(name: 'treatment_plan')  String? treatmentPlan,  String? medications,  String? supplements, @JsonKey(name: 'referral_needed')  bool referralNeeded, @JsonKey(name: 'referral_notes')  String? referralNotes, @JsonKey(name: 'next_checkup_date')  DateTime? nextCheckupDate, @JsonKey(name: 'next_checkup_notes')  String? nextCheckupNotes,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthRecordModel() when $default != null:
return $default(_that.id,_that.ibuHamilId,_that.perawatId,_that.checkupDate,_that.checkupType,_that.dataSource,_that.gestationalAgeWeeks,_that.gestationalAgeDays,_that.bloodPressureSystolic,_that.bloodPressureDiastolic,_that.bloodGlucose,_that.bodyTemperature,_that.heartRate,_that.fetalHeartRate,_that.fundalHeightCm,_that.weight,_that.complaints,_that.physicalExamination,_that.diagnosis,_that.treatmentPlan,_that.medications,_that.supplements,_that.referralNeeded,_that.referralNotes,_that.nextCheckupDate,_that.nextCheckupNotes,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'ibu_hamil_id')  int ibuHamilId, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'checkup_date')  DateTime checkupDate, @JsonKey(name: 'checkup_type')  String checkupType, @JsonKey(name: 'data_source')  String dataSource, @JsonKey(name: 'gestational_age_weeks')  int? gestationalAgeWeeks, @JsonKey(name: 'gestational_age_days')  int? gestationalAgeDays, @JsonKey(name: 'blood_pressure_systolic')  int? bloodPressureSystolic, @JsonKey(name: 'blood_pressure_diastolic')  int? bloodPressureDiastolic, @JsonKey(name: 'blood_glucose')  double? bloodGlucose, @JsonKey(name: 'body_temperature')  double? bodyTemperature, @JsonKey(name: 'heart_rate')  int? heartRate, @JsonKey(name: 'fetal_heart_rate')  int? fetalHeartRate, @JsonKey(name: 'fundal_height_cm')  double? fundalHeightCm, @JsonKey(name: 'weight')  double? weight,  String? complaints, @JsonKey(name: 'physical_examination')  String? physicalExamination,  String? diagnosis, @JsonKey(name: 'treatment_plan')  String? treatmentPlan,  String? medications,  String? supplements, @JsonKey(name: 'referral_needed')  bool referralNeeded, @JsonKey(name: 'referral_notes')  String? referralNotes, @JsonKey(name: 'next_checkup_date')  DateTime? nextCheckupDate, @JsonKey(name: 'next_checkup_notes')  String? nextCheckupNotes,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HealthRecordModel():
return $default(_that.id,_that.ibuHamilId,_that.perawatId,_that.checkupDate,_that.checkupType,_that.dataSource,_that.gestationalAgeWeeks,_that.gestationalAgeDays,_that.bloodPressureSystolic,_that.bloodPressureDiastolic,_that.bloodGlucose,_that.bodyTemperature,_that.heartRate,_that.fetalHeartRate,_that.fundalHeightCm,_that.weight,_that.complaints,_that.physicalExamination,_that.diagnosis,_that.treatmentPlan,_that.medications,_that.supplements,_that.referralNeeded,_that.referralNotes,_that.nextCheckupDate,_that.nextCheckupNotes,_that.notes,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'ibu_hamil_id')  int ibuHamilId, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'checkup_date')  DateTime checkupDate, @JsonKey(name: 'checkup_type')  String checkupType, @JsonKey(name: 'data_source')  String dataSource, @JsonKey(name: 'gestational_age_weeks')  int? gestationalAgeWeeks, @JsonKey(name: 'gestational_age_days')  int? gestationalAgeDays, @JsonKey(name: 'blood_pressure_systolic')  int? bloodPressureSystolic, @JsonKey(name: 'blood_pressure_diastolic')  int? bloodPressureDiastolic, @JsonKey(name: 'blood_glucose')  double? bloodGlucose, @JsonKey(name: 'body_temperature')  double? bodyTemperature, @JsonKey(name: 'heart_rate')  int? heartRate, @JsonKey(name: 'fetal_heart_rate')  int? fetalHeartRate, @JsonKey(name: 'fundal_height_cm')  double? fundalHeightCm, @JsonKey(name: 'weight')  double? weight,  String? complaints, @JsonKey(name: 'physical_examination')  String? physicalExamination,  String? diagnosis, @JsonKey(name: 'treatment_plan')  String? treatmentPlan,  String? medications,  String? supplements, @JsonKey(name: 'referral_needed')  bool referralNeeded, @JsonKey(name: 'referral_notes')  String? referralNotes, @JsonKey(name: 'next_checkup_date')  DateTime? nextCheckupDate, @JsonKey(name: 'next_checkup_notes')  String? nextCheckupNotes,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HealthRecordModel() when $default != null:
return $default(_that.id,_that.ibuHamilId,_that.perawatId,_that.checkupDate,_that.checkupType,_that.dataSource,_that.gestationalAgeWeeks,_that.gestationalAgeDays,_that.bloodPressureSystolic,_that.bloodPressureDiastolic,_that.bloodGlucose,_that.bodyTemperature,_that.heartRate,_that.fetalHeartRate,_that.fundalHeightCm,_that.weight,_that.complaints,_that.physicalExamination,_that.diagnosis,_that.treatmentPlan,_that.medications,_that.supplements,_that.referralNeeded,_that.referralNotes,_that.nextCheckupDate,_that.nextCheckupNotes,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthRecordModel implements HealthRecordModel {
  const _HealthRecordModel({required this.id, @JsonKey(name: 'ibu_hamil_id') required this.ibuHamilId, @JsonKey(name: 'perawat_id') this.perawatId, @JsonKey(name: 'checkup_date') required this.checkupDate, @JsonKey(name: 'checkup_type') required this.checkupType, @JsonKey(name: 'data_source') required this.dataSource, @JsonKey(name: 'gestational_age_weeks') this.gestationalAgeWeeks, @JsonKey(name: 'gestational_age_days') this.gestationalAgeDays, @JsonKey(name: 'blood_pressure_systolic') this.bloodPressureSystolic, @JsonKey(name: 'blood_pressure_diastolic') this.bloodPressureDiastolic, @JsonKey(name: 'blood_glucose') this.bloodGlucose, @JsonKey(name: 'body_temperature') this.bodyTemperature, @JsonKey(name: 'heart_rate') this.heartRate, @JsonKey(name: 'fetal_heart_rate') this.fetalHeartRate, @JsonKey(name: 'fundal_height_cm') this.fundalHeightCm, @JsonKey(name: 'weight') this.weight, this.complaints, @JsonKey(name: 'physical_examination') this.physicalExamination, this.diagnosis, @JsonKey(name: 'treatment_plan') this.treatmentPlan, this.medications, this.supplements, @JsonKey(name: 'referral_needed') this.referralNeeded = false, @JsonKey(name: 'referral_notes') this.referralNotes, @JsonKey(name: 'next_checkup_date') this.nextCheckupDate, @JsonKey(name: 'next_checkup_notes') this.nextCheckupNotes, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _HealthRecordModel.fromJson(Map<String, dynamic> json) => _$HealthRecordModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'ibu_hamil_id') final  int ibuHamilId;
@override@JsonKey(name: 'perawat_id') final  int? perawatId;
@override@JsonKey(name: 'checkup_date') final  DateTime checkupDate;
@override@JsonKey(name: 'checkup_type') final  String checkupType;
// 'berkala' or 'ad-hoc'
@override@JsonKey(name: 'data_source') final  String dataSource;
// 'manual' or 'iot_device'
@override@JsonKey(name: 'gestational_age_weeks') final  int? gestationalAgeWeeks;
@override@JsonKey(name: 'gestational_age_days') final  int? gestationalAgeDays;
@override@JsonKey(name: 'blood_pressure_systolic') final  int? bloodPressureSystolic;
@override@JsonKey(name: 'blood_pressure_diastolic') final  int? bloodPressureDiastolic;
@override@JsonKey(name: 'blood_glucose') final  double? bloodGlucose;
@override@JsonKey(name: 'body_temperature') final  double? bodyTemperature;
@override@JsonKey(name: 'heart_rate') final  int? heartRate;
@override@JsonKey(name: 'fetal_heart_rate') final  int? fetalHeartRate;
@override@JsonKey(name: 'fundal_height_cm') final  double? fundalHeightCm;
@override@JsonKey(name: 'weight') final  double? weight;
@override final  String? complaints;
@override@JsonKey(name: 'physical_examination') final  String? physicalExamination;
@override final  String? diagnosis;
@override@JsonKey(name: 'treatment_plan') final  String? treatmentPlan;
@override final  String? medications;
@override final  String? supplements;
@override@JsonKey(name: 'referral_needed') final  bool referralNeeded;
@override@JsonKey(name: 'referral_notes') final  String? referralNotes;
@override@JsonKey(name: 'next_checkup_date') final  DateTime? nextCheckupDate;
@override@JsonKey(name: 'next_checkup_notes') final  String? nextCheckupNotes;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of HealthRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthRecordModelCopyWith<_HealthRecordModel> get copyWith => __$HealthRecordModelCopyWithImpl<_HealthRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ibuHamilId, ibuHamilId) || other.ibuHamilId == ibuHamilId)&&(identical(other.perawatId, perawatId) || other.perawatId == perawatId)&&(identical(other.checkupDate, checkupDate) || other.checkupDate == checkupDate)&&(identical(other.checkupType, checkupType) || other.checkupType == checkupType)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource)&&(identical(other.gestationalAgeWeeks, gestationalAgeWeeks) || other.gestationalAgeWeeks == gestationalAgeWeeks)&&(identical(other.gestationalAgeDays, gestationalAgeDays) || other.gestationalAgeDays == gestationalAgeDays)&&(identical(other.bloodPressureSystolic, bloodPressureSystolic) || other.bloodPressureSystolic == bloodPressureSystolic)&&(identical(other.bloodPressureDiastolic, bloodPressureDiastolic) || other.bloodPressureDiastolic == bloodPressureDiastolic)&&(identical(other.bloodGlucose, bloodGlucose) || other.bloodGlucose == bloodGlucose)&&(identical(other.bodyTemperature, bodyTemperature) || other.bodyTemperature == bodyTemperature)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.fetalHeartRate, fetalHeartRate) || other.fetalHeartRate == fetalHeartRate)&&(identical(other.fundalHeightCm, fundalHeightCm) || other.fundalHeightCm == fundalHeightCm)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.complaints, complaints) || other.complaints == complaints)&&(identical(other.physicalExamination, physicalExamination) || other.physicalExamination == physicalExamination)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.treatmentPlan, treatmentPlan) || other.treatmentPlan == treatmentPlan)&&(identical(other.medications, medications) || other.medications == medications)&&(identical(other.supplements, supplements) || other.supplements == supplements)&&(identical(other.referralNeeded, referralNeeded) || other.referralNeeded == referralNeeded)&&(identical(other.referralNotes, referralNotes) || other.referralNotes == referralNotes)&&(identical(other.nextCheckupDate, nextCheckupDate) || other.nextCheckupDate == nextCheckupDate)&&(identical(other.nextCheckupNotes, nextCheckupNotes) || other.nextCheckupNotes == nextCheckupNotes)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ibuHamilId,perawatId,checkupDate,checkupType,dataSource,gestationalAgeWeeks,gestationalAgeDays,bloodPressureSystolic,bloodPressureDiastolic,bloodGlucose,bodyTemperature,heartRate,fetalHeartRate,fundalHeightCm,weight,complaints,physicalExamination,diagnosis,treatmentPlan,medications,supplements,referralNeeded,referralNotes,nextCheckupDate,nextCheckupNotes,notes,createdAt,updatedAt]);

@override
String toString() {
  return 'HealthRecordModel(id: $id, ibuHamilId: $ibuHamilId, perawatId: $perawatId, checkupDate: $checkupDate, checkupType: $checkupType, dataSource: $dataSource, gestationalAgeWeeks: $gestationalAgeWeeks, gestationalAgeDays: $gestationalAgeDays, bloodPressureSystolic: $bloodPressureSystolic, bloodPressureDiastolic: $bloodPressureDiastolic, bloodGlucose: $bloodGlucose, bodyTemperature: $bodyTemperature, heartRate: $heartRate, fetalHeartRate: $fetalHeartRate, fundalHeightCm: $fundalHeightCm, weight: $weight, complaints: $complaints, physicalExamination: $physicalExamination, diagnosis: $diagnosis, treatmentPlan: $treatmentPlan, medications: $medications, supplements: $supplements, referralNeeded: $referralNeeded, referralNotes: $referralNotes, nextCheckupDate: $nextCheckupDate, nextCheckupNotes: $nextCheckupNotes, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HealthRecordModelCopyWith<$Res> implements $HealthRecordModelCopyWith<$Res> {
  factory _$HealthRecordModelCopyWith(_HealthRecordModel value, $Res Function(_HealthRecordModel) _then) = __$HealthRecordModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'ibu_hamil_id') int ibuHamilId,@JsonKey(name: 'perawat_id') int? perawatId,@JsonKey(name: 'checkup_date') DateTime checkupDate,@JsonKey(name: 'checkup_type') String checkupType,@JsonKey(name: 'data_source') String dataSource,@JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,@JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,@JsonKey(name: 'blood_pressure_systolic') int? bloodPressureSystolic,@JsonKey(name: 'blood_pressure_diastolic') int? bloodPressureDiastolic,@JsonKey(name: 'blood_glucose') double? bloodGlucose,@JsonKey(name: 'body_temperature') double? bodyTemperature,@JsonKey(name: 'heart_rate') int? heartRate,@JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,@JsonKey(name: 'fundal_height_cm') double? fundalHeightCm,@JsonKey(name: 'weight') double? weight, String? complaints,@JsonKey(name: 'physical_examination') String? physicalExamination, String? diagnosis,@JsonKey(name: 'treatment_plan') String? treatmentPlan, String? medications, String? supplements,@JsonKey(name: 'referral_needed') bool referralNeeded,@JsonKey(name: 'referral_notes') String? referralNotes,@JsonKey(name: 'next_checkup_date') DateTime? nextCheckupDate,@JsonKey(name: 'next_checkup_notes') String? nextCheckupNotes, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$HealthRecordModelCopyWithImpl<$Res>
    implements _$HealthRecordModelCopyWith<$Res> {
  __$HealthRecordModelCopyWithImpl(this._self, this._then);

  final _HealthRecordModel _self;
  final $Res Function(_HealthRecordModel) _then;

/// Create a copy of HealthRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ibuHamilId = null,Object? perawatId = freezed,Object? checkupDate = null,Object? checkupType = null,Object? dataSource = null,Object? gestationalAgeWeeks = freezed,Object? gestationalAgeDays = freezed,Object? bloodPressureSystolic = freezed,Object? bloodPressureDiastolic = freezed,Object? bloodGlucose = freezed,Object? bodyTemperature = freezed,Object? heartRate = freezed,Object? fetalHeartRate = freezed,Object? fundalHeightCm = freezed,Object? weight = freezed,Object? complaints = freezed,Object? physicalExamination = freezed,Object? diagnosis = freezed,Object? treatmentPlan = freezed,Object? medications = freezed,Object? supplements = freezed,Object? referralNeeded = null,Object? referralNotes = freezed,Object? nextCheckupDate = freezed,Object? nextCheckupNotes = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_HealthRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ibuHamilId: null == ibuHamilId ? _self.ibuHamilId : ibuHamilId // ignore: cast_nullable_to_non_nullable
as int,perawatId: freezed == perawatId ? _self.perawatId : perawatId // ignore: cast_nullable_to_non_nullable
as int?,checkupDate: null == checkupDate ? _self.checkupDate : checkupDate // ignore: cast_nullable_to_non_nullable
as DateTime,checkupType: null == checkupType ? _self.checkupType : checkupType // ignore: cast_nullable_to_non_nullable
as String,dataSource: null == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as String,gestationalAgeWeeks: freezed == gestationalAgeWeeks ? _self.gestationalAgeWeeks : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
as int?,gestationalAgeDays: freezed == gestationalAgeDays ? _self.gestationalAgeDays : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
as int?,bloodPressureSystolic: freezed == bloodPressureSystolic ? _self.bloodPressureSystolic : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
as int?,bloodPressureDiastolic: freezed == bloodPressureDiastolic ? _self.bloodPressureDiastolic : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
as int?,bloodGlucose: freezed == bloodGlucose ? _self.bloodGlucose : bloodGlucose // ignore: cast_nullable_to_non_nullable
as double?,bodyTemperature: freezed == bodyTemperature ? _self.bodyTemperature : bodyTemperature // ignore: cast_nullable_to_non_nullable
as double?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,fetalHeartRate: freezed == fetalHeartRate ? _self.fetalHeartRate : fetalHeartRate // ignore: cast_nullable_to_non_nullable
as int?,fundalHeightCm: freezed == fundalHeightCm ? _self.fundalHeightCm : fundalHeightCm // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,complaints: freezed == complaints ? _self.complaints : complaints // ignore: cast_nullable_to_non_nullable
as String?,physicalExamination: freezed == physicalExamination ? _self.physicalExamination : physicalExamination // ignore: cast_nullable_to_non_nullable
as String?,diagnosis: freezed == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String?,treatmentPlan: freezed == treatmentPlan ? _self.treatmentPlan : treatmentPlan // ignore: cast_nullable_to_non_nullable
as String?,medications: freezed == medications ? _self.medications : medications // ignore: cast_nullable_to_non_nullable
as String?,supplements: freezed == supplements ? _self.supplements : supplements // ignore: cast_nullable_to_non_nullable
as String?,referralNeeded: null == referralNeeded ? _self.referralNeeded : referralNeeded // ignore: cast_nullable_to_non_nullable
as bool,referralNotes: freezed == referralNotes ? _self.referralNotes : referralNotes // ignore: cast_nullable_to_non_nullable
as String?,nextCheckupDate: freezed == nextCheckupDate ? _self.nextCheckupDate : nextCheckupDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextCheckupNotes: freezed == nextCheckupNotes ? _self.nextCheckupNotes : nextCheckupNotes // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
