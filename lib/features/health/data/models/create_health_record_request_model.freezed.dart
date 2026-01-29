// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_health_record_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateHealthRecordRequestModel _$CreateHealthRecordRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _CreateHealthRecordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateHealthRecordRequestModel {
  @JsonKey(name: 'blood_glucose')
  double? get bloodGlucose => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_pressure_diastolic')
  int get bloodPressureDiastolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_pressure_systolic')
  int get bloodPressureSystolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_temperature')
  double get bodyTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'checked_by')
  String get checkedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'checkup_date')
  String get checkupDate => throw _privateConstructorUsedError;
  String get complaints => throw _privateConstructorUsedError;
  @JsonKey(name: 'fetal_heart_rate')
  int? get fetalHeartRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'fundal_height')
  double? get fundalHeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'gestational_age_days')
  int? get gestationalAgeDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'gestational_age_weeks')
  int? get gestationalAgeWeeks => throw _privateConstructorUsedError;
  @JsonKey(name: 'heart_rate')
  int get heartRate => throw _privateConstructorUsedError;
  double? get hemoglobin => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'perawat_id')
  int? get perawatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'protein_urin')
  String? get proteinUrin => throw _privateConstructorUsedError;
  @JsonKey(name: 'upper_arm_circumference')
  double? get upperArmCircumference => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  /// Serializes this CreateHealthRecordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateHealthRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateHealthRecordRequestModelCopyWith<CreateHealthRecordRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateHealthRecordRequestModelCopyWith<$Res> {
  factory $CreateHealthRecordRequestModelCopyWith(
    CreateHealthRecordRequestModel value,
    $Res Function(CreateHealthRecordRequestModel) then,
  ) =
      _$CreateHealthRecordRequestModelCopyWithImpl<
        $Res,
        CreateHealthRecordRequestModel
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'blood_glucose') double? bloodGlucose,
    @JsonKey(name: 'blood_pressure_diastolic') int bloodPressureDiastolic,
    @JsonKey(name: 'blood_pressure_systolic') int bloodPressureSystolic,
    @JsonKey(name: 'body_temperature') double bodyTemperature,
    @JsonKey(name: 'checked_by') String checkedBy,
    @JsonKey(name: 'checkup_date') String checkupDate,
    String complaints,
    @JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,
    @JsonKey(name: 'fundal_height') double? fundalHeight,
    @JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,
    @JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,
    @JsonKey(name: 'heart_rate') int heartRate,
    double? hemoglobin,
    String? notes,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'protein_urin') String? proteinUrin,
    @JsonKey(name: 'upper_arm_circumference') double? upperArmCircumference,
    double weight,
  });
}

/// @nodoc
class _$CreateHealthRecordRequestModelCopyWithImpl<
  $Res,
  $Val extends CreateHealthRecordRequestModel
>
    implements $CreateHealthRecordRequestModelCopyWith<$Res> {
  _$CreateHealthRecordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateHealthRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bloodGlucose = freezed,
    Object? bloodPressureDiastolic = null,
    Object? bloodPressureSystolic = null,
    Object? bodyTemperature = null,
    Object? checkedBy = null,
    Object? checkupDate = null,
    Object? complaints = null,
    Object? fetalHeartRate = freezed,
    Object? fundalHeight = freezed,
    Object? gestationalAgeDays = freezed,
    Object? gestationalAgeWeeks = freezed,
    Object? heartRate = null,
    Object? hemoglobin = freezed,
    Object? notes = freezed,
    Object? perawatId = freezed,
    Object? proteinUrin = freezed,
    Object? upperArmCircumference = freezed,
    Object? weight = null,
  }) {
    return _then(
      _value.copyWith(
            bloodGlucose: freezed == bloodGlucose
                ? _value.bloodGlucose
                : bloodGlucose // ignore: cast_nullable_to_non_nullable
                      as double?,
            bloodPressureDiastolic: null == bloodPressureDiastolic
                ? _value.bloodPressureDiastolic
                : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
                      as int,
            bloodPressureSystolic: null == bloodPressureSystolic
                ? _value.bloodPressureSystolic
                : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
                      as int,
            bodyTemperature: null == bodyTemperature
                ? _value.bodyTemperature
                : bodyTemperature // ignore: cast_nullable_to_non_nullable
                      as double,
            checkedBy: null == checkedBy
                ? _value.checkedBy
                : checkedBy // ignore: cast_nullable_to_non_nullable
                      as String,
            checkupDate: null == checkupDate
                ? _value.checkupDate
                : checkupDate // ignore: cast_nullable_to_non_nullable
                      as String,
            complaints: null == complaints
                ? _value.complaints
                : complaints // ignore: cast_nullable_to_non_nullable
                      as String,
            fetalHeartRate: freezed == fetalHeartRate
                ? _value.fetalHeartRate
                : fetalHeartRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            fundalHeight: freezed == fundalHeight
                ? _value.fundalHeight
                : fundalHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            gestationalAgeDays: freezed == gestationalAgeDays
                ? _value.gestationalAgeDays
                : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            gestationalAgeWeeks: freezed == gestationalAgeWeeks
                ? _value.gestationalAgeWeeks
                : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
                      as int?,
            heartRate: null == heartRate
                ? _value.heartRate
                : heartRate // ignore: cast_nullable_to_non_nullable
                      as int,
            hemoglobin: freezed == hemoglobin
                ? _value.hemoglobin
                : hemoglobin // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            perawatId: freezed == perawatId
                ? _value.perawatId
                : perawatId // ignore: cast_nullable_to_non_nullable
                      as int?,
            proteinUrin: freezed == proteinUrin
                ? _value.proteinUrin
                : proteinUrin // ignore: cast_nullable_to_non_nullable
                      as String?,
            upperArmCircumference: freezed == upperArmCircumference
                ? _value.upperArmCircumference
                : upperArmCircumference // ignore: cast_nullable_to_non_nullable
                      as double?,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateHealthRecordRequestModelImplCopyWith<$Res>
    implements $CreateHealthRecordRequestModelCopyWith<$Res> {
  factory _$$CreateHealthRecordRequestModelImplCopyWith(
    _$CreateHealthRecordRequestModelImpl value,
    $Res Function(_$CreateHealthRecordRequestModelImpl) then,
  ) = __$$CreateHealthRecordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'blood_glucose') double? bloodGlucose,
    @JsonKey(name: 'blood_pressure_diastolic') int bloodPressureDiastolic,
    @JsonKey(name: 'blood_pressure_systolic') int bloodPressureSystolic,
    @JsonKey(name: 'body_temperature') double bodyTemperature,
    @JsonKey(name: 'checked_by') String checkedBy,
    @JsonKey(name: 'checkup_date') String checkupDate,
    String complaints,
    @JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,
    @JsonKey(name: 'fundal_height') double? fundalHeight,
    @JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,
    @JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,
    @JsonKey(name: 'heart_rate') int heartRate,
    double? hemoglobin,
    String? notes,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'protein_urin') String? proteinUrin,
    @JsonKey(name: 'upper_arm_circumference') double? upperArmCircumference,
    double weight,
  });
}

/// @nodoc
class __$$CreateHealthRecordRequestModelImplCopyWithImpl<$Res>
    extends
        _$CreateHealthRecordRequestModelCopyWithImpl<
          $Res,
          _$CreateHealthRecordRequestModelImpl
        >
    implements _$$CreateHealthRecordRequestModelImplCopyWith<$Res> {
  __$$CreateHealthRecordRequestModelImplCopyWithImpl(
    _$CreateHealthRecordRequestModelImpl _value,
    $Res Function(_$CreateHealthRecordRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateHealthRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bloodGlucose = freezed,
    Object? bloodPressureDiastolic = null,
    Object? bloodPressureSystolic = null,
    Object? bodyTemperature = null,
    Object? checkedBy = null,
    Object? checkupDate = null,
    Object? complaints = null,
    Object? fetalHeartRate = freezed,
    Object? fundalHeight = freezed,
    Object? gestationalAgeDays = freezed,
    Object? gestationalAgeWeeks = freezed,
    Object? heartRate = null,
    Object? hemoglobin = freezed,
    Object? notes = freezed,
    Object? perawatId = freezed,
    Object? proteinUrin = freezed,
    Object? upperArmCircumference = freezed,
    Object? weight = null,
  }) {
    return _then(
      _$CreateHealthRecordRequestModelImpl(
        bloodGlucose: freezed == bloodGlucose
            ? _value.bloodGlucose
            : bloodGlucose // ignore: cast_nullable_to_non_nullable
                  as double?,
        bloodPressureDiastolic: null == bloodPressureDiastolic
            ? _value.bloodPressureDiastolic
            : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
                  as int,
        bloodPressureSystolic: null == bloodPressureSystolic
            ? _value.bloodPressureSystolic
            : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
                  as int,
        bodyTemperature: null == bodyTemperature
            ? _value.bodyTemperature
            : bodyTemperature // ignore: cast_nullable_to_non_nullable
                  as double,
        checkedBy: null == checkedBy
            ? _value.checkedBy
            : checkedBy // ignore: cast_nullable_to_non_nullable
                  as String,
        checkupDate: null == checkupDate
            ? _value.checkupDate
            : checkupDate // ignore: cast_nullable_to_non_nullable
                  as String,
        complaints: null == complaints
            ? _value.complaints
            : complaints // ignore: cast_nullable_to_non_nullable
                  as String,
        fetalHeartRate: freezed == fetalHeartRate
            ? _value.fetalHeartRate
            : fetalHeartRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        fundalHeight: freezed == fundalHeight
            ? _value.fundalHeight
            : fundalHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        gestationalAgeDays: freezed == gestationalAgeDays
            ? _value.gestationalAgeDays
            : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        gestationalAgeWeeks: freezed == gestationalAgeWeeks
            ? _value.gestationalAgeWeeks
            : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
                  as int?,
        heartRate: null == heartRate
            ? _value.heartRate
            : heartRate // ignore: cast_nullable_to_non_nullable
                  as int,
        hemoglobin: freezed == hemoglobin
            ? _value.hemoglobin
            : hemoglobin // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        perawatId: freezed == perawatId
            ? _value.perawatId
            : perawatId // ignore: cast_nullable_to_non_nullable
                  as int?,
        proteinUrin: freezed == proteinUrin
            ? _value.proteinUrin
            : proteinUrin // ignore: cast_nullable_to_non_nullable
                  as String?,
        upperArmCircumference: freezed == upperArmCircumference
            ? _value.upperArmCircumference
            : upperArmCircumference // ignore: cast_nullable_to_non_nullable
                  as double?,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateHealthRecordRequestModelImpl
    implements _CreateHealthRecordRequestModel {
  const _$CreateHealthRecordRequestModelImpl({
    @JsonKey(name: 'blood_glucose') this.bloodGlucose,
    @JsonKey(name: 'blood_pressure_diastolic')
    required this.bloodPressureDiastolic,
    @JsonKey(name: 'blood_pressure_systolic')
    required this.bloodPressureSystolic,
    @JsonKey(name: 'body_temperature') required this.bodyTemperature,
    @JsonKey(name: 'checked_by') required this.checkedBy,
    @JsonKey(name: 'checkup_date') required this.checkupDate,
    required this.complaints,
    @JsonKey(name: 'fetal_heart_rate') this.fetalHeartRate,
    @JsonKey(name: 'fundal_height') this.fundalHeight,
    @JsonKey(name: 'gestational_age_days') this.gestationalAgeDays,
    @JsonKey(name: 'gestational_age_weeks') this.gestationalAgeWeeks,
    @JsonKey(name: 'heart_rate') required this.heartRate,
    this.hemoglobin,
    this.notes,
    @JsonKey(name: 'perawat_id') this.perawatId,
    @JsonKey(name: 'protein_urin') this.proteinUrin,
    @JsonKey(name: 'upper_arm_circumference') this.upperArmCircumference,
    required this.weight,
  });

  factory _$CreateHealthRecordRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateHealthRecordRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'blood_glucose')
  final double? bloodGlucose;
  @override
  @JsonKey(name: 'blood_pressure_diastolic')
  final int bloodPressureDiastolic;
  @override
  @JsonKey(name: 'blood_pressure_systolic')
  final int bloodPressureSystolic;
  @override
  @JsonKey(name: 'body_temperature')
  final double bodyTemperature;
  @override
  @JsonKey(name: 'checked_by')
  final String checkedBy;
  @override
  @JsonKey(name: 'checkup_date')
  final String checkupDate;
  @override
  final String complaints;
  @override
  @JsonKey(name: 'fetal_heart_rate')
  final int? fetalHeartRate;
  @override
  @JsonKey(name: 'fundal_height')
  final double? fundalHeight;
  @override
  @JsonKey(name: 'gestational_age_days')
  final int? gestationalAgeDays;
  @override
  @JsonKey(name: 'gestational_age_weeks')
  final int? gestationalAgeWeeks;
  @override
  @JsonKey(name: 'heart_rate')
  final int heartRate;
  @override
  final double? hemoglobin;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'perawat_id')
  final int? perawatId;
  @override
  @JsonKey(name: 'protein_urin')
  final String? proteinUrin;
  @override
  @JsonKey(name: 'upper_arm_circumference')
  final double? upperArmCircumference;
  @override
  final double weight;

  @override
  String toString() {
    return 'CreateHealthRecordRequestModel(bloodGlucose: $bloodGlucose, bloodPressureDiastolic: $bloodPressureDiastolic, bloodPressureSystolic: $bloodPressureSystolic, bodyTemperature: $bodyTemperature, checkedBy: $checkedBy, checkupDate: $checkupDate, complaints: $complaints, fetalHeartRate: $fetalHeartRate, fundalHeight: $fundalHeight, gestationalAgeDays: $gestationalAgeDays, gestationalAgeWeeks: $gestationalAgeWeeks, heartRate: $heartRate, hemoglobin: $hemoglobin, notes: $notes, perawatId: $perawatId, proteinUrin: $proteinUrin, upperArmCircumference: $upperArmCircumference, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateHealthRecordRequestModelImpl &&
            (identical(other.bloodGlucose, bloodGlucose) ||
                other.bloodGlucose == bloodGlucose) &&
            (identical(other.bloodPressureDiastolic, bloodPressureDiastolic) ||
                other.bloodPressureDiastolic == bloodPressureDiastolic) &&
            (identical(other.bloodPressureSystolic, bloodPressureSystolic) ||
                other.bloodPressureSystolic == bloodPressureSystolic) &&
            (identical(other.bodyTemperature, bodyTemperature) ||
                other.bodyTemperature == bodyTemperature) &&
            (identical(other.checkedBy, checkedBy) ||
                other.checkedBy == checkedBy) &&
            (identical(other.checkupDate, checkupDate) ||
                other.checkupDate == checkupDate) &&
            (identical(other.complaints, complaints) ||
                other.complaints == complaints) &&
            (identical(other.fetalHeartRate, fetalHeartRate) ||
                other.fetalHeartRate == fetalHeartRate) &&
            (identical(other.fundalHeight, fundalHeight) ||
                other.fundalHeight == fundalHeight) &&
            (identical(other.gestationalAgeDays, gestationalAgeDays) ||
                other.gestationalAgeDays == gestationalAgeDays) &&
            (identical(other.gestationalAgeWeeks, gestationalAgeWeeks) ||
                other.gestationalAgeWeeks == gestationalAgeWeeks) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.hemoglobin, hemoglobin) ||
                other.hemoglobin == hemoglobin) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.perawatId, perawatId) ||
                other.perawatId == perawatId) &&
            (identical(other.proteinUrin, proteinUrin) ||
                other.proteinUrin == proteinUrin) &&
            (identical(other.upperArmCircumference, upperArmCircumference) ||
                other.upperArmCircumference == upperArmCircumference) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bloodGlucose,
    bloodPressureDiastolic,
    bloodPressureSystolic,
    bodyTemperature,
    checkedBy,
    checkupDate,
    complaints,
    fetalHeartRate,
    fundalHeight,
    gestationalAgeDays,
    gestationalAgeWeeks,
    heartRate,
    hemoglobin,
    notes,
    perawatId,
    proteinUrin,
    upperArmCircumference,
    weight,
  );

  /// Create a copy of CreateHealthRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateHealthRecordRequestModelImplCopyWith<
    _$CreateHealthRecordRequestModelImpl
  >
  get copyWith =>
      __$$CreateHealthRecordRequestModelImplCopyWithImpl<
        _$CreateHealthRecordRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateHealthRecordRequestModelImplToJson(this);
  }
}

abstract class _CreateHealthRecordRequestModel
    implements CreateHealthRecordRequestModel {
  const factory _CreateHealthRecordRequestModel({
    @JsonKey(name: 'blood_glucose') final double? bloodGlucose,
    @JsonKey(name: 'blood_pressure_diastolic')
    required final int bloodPressureDiastolic,
    @JsonKey(name: 'blood_pressure_systolic')
    required final int bloodPressureSystolic,
    @JsonKey(name: 'body_temperature') required final double bodyTemperature,
    @JsonKey(name: 'checked_by') required final String checkedBy,
    @JsonKey(name: 'checkup_date') required final String checkupDate,
    required final String complaints,
    @JsonKey(name: 'fetal_heart_rate') final int? fetalHeartRate,
    @JsonKey(name: 'fundal_height') final double? fundalHeight,
    @JsonKey(name: 'gestational_age_days') final int? gestationalAgeDays,
    @JsonKey(name: 'gestational_age_weeks') final int? gestationalAgeWeeks,
    @JsonKey(name: 'heart_rate') required final int heartRate,
    final double? hemoglobin,
    final String? notes,
    @JsonKey(name: 'perawat_id') final int? perawatId,
    @JsonKey(name: 'protein_urin') final String? proteinUrin,
    @JsonKey(name: 'upper_arm_circumference')
    final double? upperArmCircumference,
    required final double weight,
  }) = _$CreateHealthRecordRequestModelImpl;

  factory _CreateHealthRecordRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateHealthRecordRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'blood_glucose')
  double? get bloodGlucose;
  @override
  @JsonKey(name: 'blood_pressure_diastolic')
  int get bloodPressureDiastolic;
  @override
  @JsonKey(name: 'blood_pressure_systolic')
  int get bloodPressureSystolic;
  @override
  @JsonKey(name: 'body_temperature')
  double get bodyTemperature;
  @override
  @JsonKey(name: 'checked_by')
  String get checkedBy;
  @override
  @JsonKey(name: 'checkup_date')
  String get checkupDate;
  @override
  String get complaints;
  @override
  @JsonKey(name: 'fetal_heart_rate')
  int? get fetalHeartRate;
  @override
  @JsonKey(name: 'fundal_height')
  double? get fundalHeight;
  @override
  @JsonKey(name: 'gestational_age_days')
  int? get gestationalAgeDays;
  @override
  @JsonKey(name: 'gestational_age_weeks')
  int? get gestationalAgeWeeks;
  @override
  @JsonKey(name: 'heart_rate')
  int get heartRate;
  @override
  double? get hemoglobin;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'perawat_id')
  int? get perawatId;
  @override
  @JsonKey(name: 'protein_urin')
  String? get proteinUrin;
  @override
  @JsonKey(name: 'upper_arm_circumference')
  double? get upperArmCircumference;
  @override
  double get weight;

  /// Create a copy of CreateHealthRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateHealthRecordRequestModelImplCopyWith<
    _$CreateHealthRecordRequestModelImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
