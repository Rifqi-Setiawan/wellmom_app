// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_health_record_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateHealthRecordRequestModel {

@JsonKey(name: 'blood_glucose') double? get bloodGlucose;@JsonKey(name: 'blood_pressure_diastolic') int get bloodPressureDiastolic;@JsonKey(name: 'blood_pressure_systolic') int get bloodPressureSystolic;@JsonKey(name: 'body_temperature') double get bodyTemperature;@JsonKey(name: 'checked_by') String get checkedBy;@JsonKey(name: 'checkup_date') String get checkupDate; String get complaints;@JsonKey(name: 'fetal_heart_rate') int? get fetalHeartRate;@JsonKey(name: 'fundal_height') double? get fundalHeight;@JsonKey(name: 'gestational_age_days') int? get gestationalAgeDays;@JsonKey(name: 'gestational_age_weeks') int? get gestationalAgeWeeks;@JsonKey(name: 'heart_rate') int get heartRate; double? get hemoglobin; String? get notes;@JsonKey(name: 'perawat_id') int? get perawatId;@JsonKey(name: 'protein_urin') String? get proteinUrin;@JsonKey(name: 'upper_arm_circumference') double? get upperArmCircumference; double get weight;
/// Create a copy of CreateHealthRecordRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateHealthRecordRequestModelCopyWith<CreateHealthRecordRequestModel> get copyWith => _$CreateHealthRecordRequestModelCopyWithImpl<CreateHealthRecordRequestModel>(this as CreateHealthRecordRequestModel, _$identity);

  /// Serializes this CreateHealthRecordRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateHealthRecordRequestModel&&(identical(other.bloodGlucose, bloodGlucose) || other.bloodGlucose == bloodGlucose)&&(identical(other.bloodPressureDiastolic, bloodPressureDiastolic) || other.bloodPressureDiastolic == bloodPressureDiastolic)&&(identical(other.bloodPressureSystolic, bloodPressureSystolic) || other.bloodPressureSystolic == bloodPressureSystolic)&&(identical(other.bodyTemperature, bodyTemperature) || other.bodyTemperature == bodyTemperature)&&(identical(other.checkedBy, checkedBy) || other.checkedBy == checkedBy)&&(identical(other.checkupDate, checkupDate) || other.checkupDate == checkupDate)&&(identical(other.complaints, complaints) || other.complaints == complaints)&&(identical(other.fetalHeartRate, fetalHeartRate) || other.fetalHeartRate == fetalHeartRate)&&(identical(other.fundalHeight, fundalHeight) || other.fundalHeight == fundalHeight)&&(identical(other.gestationalAgeDays, gestationalAgeDays) || other.gestationalAgeDays == gestationalAgeDays)&&(identical(other.gestationalAgeWeeks, gestationalAgeWeeks) || other.gestationalAgeWeeks == gestationalAgeWeeks)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.hemoglobin, hemoglobin) || other.hemoglobin == hemoglobin)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.perawatId, perawatId) || other.perawatId == perawatId)&&(identical(other.proteinUrin, proteinUrin) || other.proteinUrin == proteinUrin)&&(identical(other.upperArmCircumference, upperArmCircumference) || other.upperArmCircumference == upperArmCircumference)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bloodGlucose,bloodPressureDiastolic,bloodPressureSystolic,bodyTemperature,checkedBy,checkupDate,complaints,fetalHeartRate,fundalHeight,gestationalAgeDays,gestationalAgeWeeks,heartRate,hemoglobin,notes,perawatId,proteinUrin,upperArmCircumference,weight);

@override
String toString() {
  return 'CreateHealthRecordRequestModel(bloodGlucose: $bloodGlucose, bloodPressureDiastolic: $bloodPressureDiastolic, bloodPressureSystolic: $bloodPressureSystolic, bodyTemperature: $bodyTemperature, checkedBy: $checkedBy, checkupDate: $checkupDate, complaints: $complaints, fetalHeartRate: $fetalHeartRate, fundalHeight: $fundalHeight, gestationalAgeDays: $gestationalAgeDays, gestationalAgeWeeks: $gestationalAgeWeeks, heartRate: $heartRate, hemoglobin: $hemoglobin, notes: $notes, perawatId: $perawatId, proteinUrin: $proteinUrin, upperArmCircumference: $upperArmCircumference, weight: $weight)';
}


}

/// @nodoc
abstract mixin class $CreateHealthRecordRequestModelCopyWith<$Res>  {
  factory $CreateHealthRecordRequestModelCopyWith(CreateHealthRecordRequestModel value, $Res Function(CreateHealthRecordRequestModel) _then) = _$CreateHealthRecordRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'blood_glucose') double? bloodGlucose,@JsonKey(name: 'blood_pressure_diastolic') int bloodPressureDiastolic,@JsonKey(name: 'blood_pressure_systolic') int bloodPressureSystolic,@JsonKey(name: 'body_temperature') double bodyTemperature,@JsonKey(name: 'checked_by') String checkedBy,@JsonKey(name: 'checkup_date') String checkupDate, String complaints,@JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,@JsonKey(name: 'fundal_height') double? fundalHeight,@JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,@JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,@JsonKey(name: 'heart_rate') int heartRate, double? hemoglobin, String? notes,@JsonKey(name: 'perawat_id') int? perawatId,@JsonKey(name: 'protein_urin') String? proteinUrin,@JsonKey(name: 'upper_arm_circumference') double? upperArmCircumference, double weight
});




}
/// @nodoc
class _$CreateHealthRecordRequestModelCopyWithImpl<$Res>
    implements $CreateHealthRecordRequestModelCopyWith<$Res> {
  _$CreateHealthRecordRequestModelCopyWithImpl(this._self, this._then);

  final CreateHealthRecordRequestModel _self;
  final $Res Function(CreateHealthRecordRequestModel) _then;

/// Create a copy of CreateHealthRecordRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bloodGlucose = freezed,Object? bloodPressureDiastolic = null,Object? bloodPressureSystolic = null,Object? bodyTemperature = null,Object? checkedBy = null,Object? checkupDate = null,Object? complaints = null,Object? fetalHeartRate = freezed,Object? fundalHeight = freezed,Object? gestationalAgeDays = freezed,Object? gestationalAgeWeeks = freezed,Object? heartRate = null,Object? hemoglobin = freezed,Object? notes = freezed,Object? perawatId = freezed,Object? proteinUrin = freezed,Object? upperArmCircumference = freezed,Object? weight = null,}) {
  return _then(_self.copyWith(
bloodGlucose: freezed == bloodGlucose ? _self.bloodGlucose : bloodGlucose // ignore: cast_nullable_to_non_nullable
as double?,bloodPressureDiastolic: null == bloodPressureDiastolic ? _self.bloodPressureDiastolic : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
as int,bloodPressureSystolic: null == bloodPressureSystolic ? _self.bloodPressureSystolic : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
as int,bodyTemperature: null == bodyTemperature ? _self.bodyTemperature : bodyTemperature // ignore: cast_nullable_to_non_nullable
as double,checkedBy: null == checkedBy ? _self.checkedBy : checkedBy // ignore: cast_nullable_to_non_nullable
as String,checkupDate: null == checkupDate ? _self.checkupDate : checkupDate // ignore: cast_nullable_to_non_nullable
as String,complaints: null == complaints ? _self.complaints : complaints // ignore: cast_nullable_to_non_nullable
as String,fetalHeartRate: freezed == fetalHeartRate ? _self.fetalHeartRate : fetalHeartRate // ignore: cast_nullable_to_non_nullable
as int?,fundalHeight: freezed == fundalHeight ? _self.fundalHeight : fundalHeight // ignore: cast_nullable_to_non_nullable
as double?,gestationalAgeDays: freezed == gestationalAgeDays ? _self.gestationalAgeDays : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
as int?,gestationalAgeWeeks: freezed == gestationalAgeWeeks ? _self.gestationalAgeWeeks : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
as int?,heartRate: null == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int,hemoglobin: freezed == hemoglobin ? _self.hemoglobin : hemoglobin // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,perawatId: freezed == perawatId ? _self.perawatId : perawatId // ignore: cast_nullable_to_non_nullable
as int?,proteinUrin: freezed == proteinUrin ? _self.proteinUrin : proteinUrin // ignore: cast_nullable_to_non_nullable
as String?,upperArmCircumference: freezed == upperArmCircumference ? _self.upperArmCircumference : upperArmCircumference // ignore: cast_nullable_to_non_nullable
as double?,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateHealthRecordRequestModel].
extension CreateHealthRecordRequestModelPatterns on CreateHealthRecordRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateHealthRecordRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateHealthRecordRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateHealthRecordRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateHealthRecordRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateHealthRecordRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateHealthRecordRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'blood_glucose')  double? bloodGlucose, @JsonKey(name: 'blood_pressure_diastolic')  int bloodPressureDiastolic, @JsonKey(name: 'blood_pressure_systolic')  int bloodPressureSystolic, @JsonKey(name: 'body_temperature')  double bodyTemperature, @JsonKey(name: 'checked_by')  String checkedBy, @JsonKey(name: 'checkup_date')  String checkupDate,  String complaints, @JsonKey(name: 'fetal_heart_rate')  int? fetalHeartRate, @JsonKey(name: 'fundal_height')  double? fundalHeight, @JsonKey(name: 'gestational_age_days')  int? gestationalAgeDays, @JsonKey(name: 'gestational_age_weeks')  int? gestationalAgeWeeks, @JsonKey(name: 'heart_rate')  int heartRate,  double? hemoglobin,  String? notes, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'protein_urin')  String? proteinUrin, @JsonKey(name: 'upper_arm_circumference')  double? upperArmCircumference,  double weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateHealthRecordRequestModel() when $default != null:
return $default(_that.bloodGlucose,_that.bloodPressureDiastolic,_that.bloodPressureSystolic,_that.bodyTemperature,_that.checkedBy,_that.checkupDate,_that.complaints,_that.fetalHeartRate,_that.fundalHeight,_that.gestationalAgeDays,_that.gestationalAgeWeeks,_that.heartRate,_that.hemoglobin,_that.notes,_that.perawatId,_that.proteinUrin,_that.upperArmCircumference,_that.weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'blood_glucose')  double? bloodGlucose, @JsonKey(name: 'blood_pressure_diastolic')  int bloodPressureDiastolic, @JsonKey(name: 'blood_pressure_systolic')  int bloodPressureSystolic, @JsonKey(name: 'body_temperature')  double bodyTemperature, @JsonKey(name: 'checked_by')  String checkedBy, @JsonKey(name: 'checkup_date')  String checkupDate,  String complaints, @JsonKey(name: 'fetal_heart_rate')  int? fetalHeartRate, @JsonKey(name: 'fundal_height')  double? fundalHeight, @JsonKey(name: 'gestational_age_days')  int? gestationalAgeDays, @JsonKey(name: 'gestational_age_weeks')  int? gestationalAgeWeeks, @JsonKey(name: 'heart_rate')  int heartRate,  double? hemoglobin,  String? notes, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'protein_urin')  String? proteinUrin, @JsonKey(name: 'upper_arm_circumference')  double? upperArmCircumference,  double weight)  $default,) {final _that = this;
switch (_that) {
case _CreateHealthRecordRequestModel():
return $default(_that.bloodGlucose,_that.bloodPressureDiastolic,_that.bloodPressureSystolic,_that.bodyTemperature,_that.checkedBy,_that.checkupDate,_that.complaints,_that.fetalHeartRate,_that.fundalHeight,_that.gestationalAgeDays,_that.gestationalAgeWeeks,_that.heartRate,_that.hemoglobin,_that.notes,_that.perawatId,_that.proteinUrin,_that.upperArmCircumference,_that.weight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'blood_glucose')  double? bloodGlucose, @JsonKey(name: 'blood_pressure_diastolic')  int bloodPressureDiastolic, @JsonKey(name: 'blood_pressure_systolic')  int bloodPressureSystolic, @JsonKey(name: 'body_temperature')  double bodyTemperature, @JsonKey(name: 'checked_by')  String checkedBy, @JsonKey(name: 'checkup_date')  String checkupDate,  String complaints, @JsonKey(name: 'fetal_heart_rate')  int? fetalHeartRate, @JsonKey(name: 'fundal_height')  double? fundalHeight, @JsonKey(name: 'gestational_age_days')  int? gestationalAgeDays, @JsonKey(name: 'gestational_age_weeks')  int? gestationalAgeWeeks, @JsonKey(name: 'heart_rate')  int heartRate,  double? hemoglobin,  String? notes, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'protein_urin')  String? proteinUrin, @JsonKey(name: 'upper_arm_circumference')  double? upperArmCircumference,  double weight)?  $default,) {final _that = this;
switch (_that) {
case _CreateHealthRecordRequestModel() when $default != null:
return $default(_that.bloodGlucose,_that.bloodPressureDiastolic,_that.bloodPressureSystolic,_that.bodyTemperature,_that.checkedBy,_that.checkupDate,_that.complaints,_that.fetalHeartRate,_that.fundalHeight,_that.gestationalAgeDays,_that.gestationalAgeWeeks,_that.heartRate,_that.hemoglobin,_that.notes,_that.perawatId,_that.proteinUrin,_that.upperArmCircumference,_that.weight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateHealthRecordRequestModel implements CreateHealthRecordRequestModel {
  const _CreateHealthRecordRequestModel({@JsonKey(name: 'blood_glucose') this.bloodGlucose, @JsonKey(name: 'blood_pressure_diastolic') required this.bloodPressureDiastolic, @JsonKey(name: 'blood_pressure_systolic') required this.bloodPressureSystolic, @JsonKey(name: 'body_temperature') required this.bodyTemperature, @JsonKey(name: 'checked_by') required this.checkedBy, @JsonKey(name: 'checkup_date') required this.checkupDate, required this.complaints, @JsonKey(name: 'fetal_heart_rate') this.fetalHeartRate, @JsonKey(name: 'fundal_height') this.fundalHeight, @JsonKey(name: 'gestational_age_days') this.gestationalAgeDays, @JsonKey(name: 'gestational_age_weeks') this.gestationalAgeWeeks, @JsonKey(name: 'heart_rate') required this.heartRate, this.hemoglobin, this.notes, @JsonKey(name: 'perawat_id') this.perawatId, @JsonKey(name: 'protein_urin') this.proteinUrin, @JsonKey(name: 'upper_arm_circumference') this.upperArmCircumference, required this.weight});
  factory _CreateHealthRecordRequestModel.fromJson(Map<String, dynamic> json) => _$CreateHealthRecordRequestModelFromJson(json);

@override@JsonKey(name: 'blood_glucose') final  double? bloodGlucose;
@override@JsonKey(name: 'blood_pressure_diastolic') final  int bloodPressureDiastolic;
@override@JsonKey(name: 'blood_pressure_systolic') final  int bloodPressureSystolic;
@override@JsonKey(name: 'body_temperature') final  double bodyTemperature;
@override@JsonKey(name: 'checked_by') final  String checkedBy;
@override@JsonKey(name: 'checkup_date') final  String checkupDate;
@override final  String complaints;
@override@JsonKey(name: 'fetal_heart_rate') final  int? fetalHeartRate;
@override@JsonKey(name: 'fundal_height') final  double? fundalHeight;
@override@JsonKey(name: 'gestational_age_days') final  int? gestationalAgeDays;
@override@JsonKey(name: 'gestational_age_weeks') final  int? gestationalAgeWeeks;
@override@JsonKey(name: 'heart_rate') final  int heartRate;
@override final  double? hemoglobin;
@override final  String? notes;
@override@JsonKey(name: 'perawat_id') final  int? perawatId;
@override@JsonKey(name: 'protein_urin') final  String? proteinUrin;
@override@JsonKey(name: 'upper_arm_circumference') final  double? upperArmCircumference;
@override final  double weight;

/// Create a copy of CreateHealthRecordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateHealthRecordRequestModelCopyWith<_CreateHealthRecordRequestModel> get copyWith => __$CreateHealthRecordRequestModelCopyWithImpl<_CreateHealthRecordRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateHealthRecordRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateHealthRecordRequestModel&&(identical(other.bloodGlucose, bloodGlucose) || other.bloodGlucose == bloodGlucose)&&(identical(other.bloodPressureDiastolic, bloodPressureDiastolic) || other.bloodPressureDiastolic == bloodPressureDiastolic)&&(identical(other.bloodPressureSystolic, bloodPressureSystolic) || other.bloodPressureSystolic == bloodPressureSystolic)&&(identical(other.bodyTemperature, bodyTemperature) || other.bodyTemperature == bodyTemperature)&&(identical(other.checkedBy, checkedBy) || other.checkedBy == checkedBy)&&(identical(other.checkupDate, checkupDate) || other.checkupDate == checkupDate)&&(identical(other.complaints, complaints) || other.complaints == complaints)&&(identical(other.fetalHeartRate, fetalHeartRate) || other.fetalHeartRate == fetalHeartRate)&&(identical(other.fundalHeight, fundalHeight) || other.fundalHeight == fundalHeight)&&(identical(other.gestationalAgeDays, gestationalAgeDays) || other.gestationalAgeDays == gestationalAgeDays)&&(identical(other.gestationalAgeWeeks, gestationalAgeWeeks) || other.gestationalAgeWeeks == gestationalAgeWeeks)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.hemoglobin, hemoglobin) || other.hemoglobin == hemoglobin)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.perawatId, perawatId) || other.perawatId == perawatId)&&(identical(other.proteinUrin, proteinUrin) || other.proteinUrin == proteinUrin)&&(identical(other.upperArmCircumference, upperArmCircumference) || other.upperArmCircumference == upperArmCircumference)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bloodGlucose,bloodPressureDiastolic,bloodPressureSystolic,bodyTemperature,checkedBy,checkupDate,complaints,fetalHeartRate,fundalHeight,gestationalAgeDays,gestationalAgeWeeks,heartRate,hemoglobin,notes,perawatId,proteinUrin,upperArmCircumference,weight);

@override
String toString() {
  return 'CreateHealthRecordRequestModel(bloodGlucose: $bloodGlucose, bloodPressureDiastolic: $bloodPressureDiastolic, bloodPressureSystolic: $bloodPressureSystolic, bodyTemperature: $bodyTemperature, checkedBy: $checkedBy, checkupDate: $checkupDate, complaints: $complaints, fetalHeartRate: $fetalHeartRate, fundalHeight: $fundalHeight, gestationalAgeDays: $gestationalAgeDays, gestationalAgeWeeks: $gestationalAgeWeeks, heartRate: $heartRate, hemoglobin: $hemoglobin, notes: $notes, perawatId: $perawatId, proteinUrin: $proteinUrin, upperArmCircumference: $upperArmCircumference, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$CreateHealthRecordRequestModelCopyWith<$Res> implements $CreateHealthRecordRequestModelCopyWith<$Res> {
  factory _$CreateHealthRecordRequestModelCopyWith(_CreateHealthRecordRequestModel value, $Res Function(_CreateHealthRecordRequestModel) _then) = __$CreateHealthRecordRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'blood_glucose') double? bloodGlucose,@JsonKey(name: 'blood_pressure_diastolic') int bloodPressureDiastolic,@JsonKey(name: 'blood_pressure_systolic') int bloodPressureSystolic,@JsonKey(name: 'body_temperature') double bodyTemperature,@JsonKey(name: 'checked_by') String checkedBy,@JsonKey(name: 'checkup_date') String checkupDate, String complaints,@JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,@JsonKey(name: 'fundal_height') double? fundalHeight,@JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,@JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,@JsonKey(name: 'heart_rate') int heartRate, double? hemoglobin, String? notes,@JsonKey(name: 'perawat_id') int? perawatId,@JsonKey(name: 'protein_urin') String? proteinUrin,@JsonKey(name: 'upper_arm_circumference') double? upperArmCircumference, double weight
});




}
/// @nodoc
class __$CreateHealthRecordRequestModelCopyWithImpl<$Res>
    implements _$CreateHealthRecordRequestModelCopyWith<$Res> {
  __$CreateHealthRecordRequestModelCopyWithImpl(this._self, this._then);

  final _CreateHealthRecordRequestModel _self;
  final $Res Function(_CreateHealthRecordRequestModel) _then;

/// Create a copy of CreateHealthRecordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bloodGlucose = freezed,Object? bloodPressureDiastolic = null,Object? bloodPressureSystolic = null,Object? bodyTemperature = null,Object? checkedBy = null,Object? checkupDate = null,Object? complaints = null,Object? fetalHeartRate = freezed,Object? fundalHeight = freezed,Object? gestationalAgeDays = freezed,Object? gestationalAgeWeeks = freezed,Object? heartRate = null,Object? hemoglobin = freezed,Object? notes = freezed,Object? perawatId = freezed,Object? proteinUrin = freezed,Object? upperArmCircumference = freezed,Object? weight = null,}) {
  return _then(_CreateHealthRecordRequestModel(
bloodGlucose: freezed == bloodGlucose ? _self.bloodGlucose : bloodGlucose // ignore: cast_nullable_to_non_nullable
as double?,bloodPressureDiastolic: null == bloodPressureDiastolic ? _self.bloodPressureDiastolic : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
as int,bloodPressureSystolic: null == bloodPressureSystolic ? _self.bloodPressureSystolic : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
as int,bodyTemperature: null == bodyTemperature ? _self.bodyTemperature : bodyTemperature // ignore: cast_nullable_to_non_nullable
as double,checkedBy: null == checkedBy ? _self.checkedBy : checkedBy // ignore: cast_nullable_to_non_nullable
as String,checkupDate: null == checkupDate ? _self.checkupDate : checkupDate // ignore: cast_nullable_to_non_nullable
as String,complaints: null == complaints ? _self.complaints : complaints // ignore: cast_nullable_to_non_nullable
as String,fetalHeartRate: freezed == fetalHeartRate ? _self.fetalHeartRate : fetalHeartRate // ignore: cast_nullable_to_non_nullable
as int?,fundalHeight: freezed == fundalHeight ? _self.fundalHeight : fundalHeight // ignore: cast_nullable_to_non_nullable
as double?,gestationalAgeDays: freezed == gestationalAgeDays ? _self.gestationalAgeDays : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
as int?,gestationalAgeWeeks: freezed == gestationalAgeWeeks ? _self.gestationalAgeWeeks : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
as int?,heartRate: null == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int,hemoglobin: freezed == hemoglobin ? _self.hemoglobin : hemoglobin // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,perawatId: freezed == perawatId ? _self.perawatId : perawatId // ignore: cast_nullable_to_non_nullable
as int?,proteinUrin: freezed == proteinUrin ? _self.proteinUrin : proteinUrin // ignore: cast_nullable_to_non_nullable
as String?,upperArmCircumference: freezed == upperArmCircumference ? _self.upperArmCircumference : upperArmCircumference // ignore: cast_nullable_to_non_nullable
as double?,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
