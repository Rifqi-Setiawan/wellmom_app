// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HealthRecordModel _$HealthRecordModelFromJson(Map<String, dynamic> json) {
  return _HealthRecordModel.fromJson(json);
}

/// @nodoc
mixin _$HealthRecordModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ibu_hamil_id')
  int get ibuHamilId => throw _privateConstructorUsedError;
  @JsonKey(name: 'perawat_id')
  int? get perawatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'checkup_date')
  DateTime get checkupDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'checkup_type')
  String get checkupType => throw _privateConstructorUsedError; // 'berkala' or 'ad-hoc'
  @JsonKey(name: 'data_source')
  String get dataSource => throw _privateConstructorUsedError; // 'manual' or 'iot_device'
  @JsonKey(name: 'gestational_age_weeks')
  int? get gestationalAgeWeeks => throw _privateConstructorUsedError;
  @JsonKey(name: 'gestational_age_days')
  int? get gestationalAgeDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_pressure_systolic')
  int? get bloodPressureSystolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_pressure_diastolic')
  int? get bloodPressureDiastolic => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_glucose')
  double? get bloodGlucose => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_temperature')
  double? get bodyTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'heart_rate')
  int? get heartRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'fetal_heart_rate')
  int? get fetalHeartRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'fundal_height_cm')
  double? get fundalHeightCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  double? get weight => throw _privateConstructorUsedError;
  String? get complaints => throw _privateConstructorUsedError;
  @JsonKey(name: 'physical_examination')
  String? get physicalExamination => throw _privateConstructorUsedError;
  String? get diagnosis => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatment_plan')
  String? get treatmentPlan => throw _privateConstructorUsedError;
  String? get medications => throw _privateConstructorUsedError;
  String? get supplements => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_needed')
  bool get referralNeeded => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_notes')
  String? get referralNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_checkup_date')
  DateTime? get nextCheckupDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_checkup_notes')
  String? get nextCheckupNotes => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this HealthRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthRecordModelCopyWith<HealthRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthRecordModelCopyWith<$Res> {
  factory $HealthRecordModelCopyWith(
    HealthRecordModel value,
    $Res Function(HealthRecordModel) then,
  ) = _$HealthRecordModelCopyWithImpl<$Res, HealthRecordModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'ibu_hamil_id') int ibuHamilId,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'checkup_date') DateTime checkupDate,
    @JsonKey(name: 'checkup_type') String checkupType,
    @JsonKey(name: 'data_source') String dataSource,
    @JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,
    @JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,
    @JsonKey(name: 'blood_pressure_systolic') int? bloodPressureSystolic,
    @JsonKey(name: 'blood_pressure_diastolic') int? bloodPressureDiastolic,
    @JsonKey(name: 'blood_glucose') double? bloodGlucose,
    @JsonKey(name: 'body_temperature') double? bodyTemperature,
    @JsonKey(name: 'heart_rate') int? heartRate,
    @JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,
    @JsonKey(name: 'fundal_height_cm') double? fundalHeightCm,
    @JsonKey(name: 'weight') double? weight,
    String? complaints,
    @JsonKey(name: 'physical_examination') String? physicalExamination,
    String? diagnosis,
    @JsonKey(name: 'treatment_plan') String? treatmentPlan,
    String? medications,
    String? supplements,
    @JsonKey(name: 'referral_needed') bool referralNeeded,
    @JsonKey(name: 'referral_notes') String? referralNotes,
    @JsonKey(name: 'next_checkup_date') DateTime? nextCheckupDate,
    @JsonKey(name: 'next_checkup_notes') String? nextCheckupNotes,
    String? notes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$HealthRecordModelCopyWithImpl<$Res, $Val extends HealthRecordModel>
    implements $HealthRecordModelCopyWith<$Res> {
  _$HealthRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ibuHamilId = null,
    Object? perawatId = freezed,
    Object? checkupDate = null,
    Object? checkupType = null,
    Object? dataSource = null,
    Object? gestationalAgeWeeks = freezed,
    Object? gestationalAgeDays = freezed,
    Object? bloodPressureSystolic = freezed,
    Object? bloodPressureDiastolic = freezed,
    Object? bloodGlucose = freezed,
    Object? bodyTemperature = freezed,
    Object? heartRate = freezed,
    Object? fetalHeartRate = freezed,
    Object? fundalHeightCm = freezed,
    Object? weight = freezed,
    Object? complaints = freezed,
    Object? physicalExamination = freezed,
    Object? diagnosis = freezed,
    Object? treatmentPlan = freezed,
    Object? medications = freezed,
    Object? supplements = freezed,
    Object? referralNeeded = null,
    Object? referralNotes = freezed,
    Object? nextCheckupDate = freezed,
    Object? nextCheckupNotes = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            ibuHamilId: null == ibuHamilId
                ? _value.ibuHamilId
                : ibuHamilId // ignore: cast_nullable_to_non_nullable
                      as int,
            perawatId: freezed == perawatId
                ? _value.perawatId
                : perawatId // ignore: cast_nullable_to_non_nullable
                      as int?,
            checkupDate: null == checkupDate
                ? _value.checkupDate
                : checkupDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            checkupType: null == checkupType
                ? _value.checkupType
                : checkupType // ignore: cast_nullable_to_non_nullable
                      as String,
            dataSource: null == dataSource
                ? _value.dataSource
                : dataSource // ignore: cast_nullable_to_non_nullable
                      as String,
            gestationalAgeWeeks: freezed == gestationalAgeWeeks
                ? _value.gestationalAgeWeeks
                : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
                      as int?,
            gestationalAgeDays: freezed == gestationalAgeDays
                ? _value.gestationalAgeDays
                : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodPressureSystolic: freezed == bloodPressureSystolic
                ? _value.bloodPressureSystolic
                : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodPressureDiastolic: freezed == bloodPressureDiastolic
                ? _value.bloodPressureDiastolic
                : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodGlucose: freezed == bloodGlucose
                ? _value.bloodGlucose
                : bloodGlucose // ignore: cast_nullable_to_non_nullable
                      as double?,
            bodyTemperature: freezed == bodyTemperature
                ? _value.bodyTemperature
                : bodyTemperature // ignore: cast_nullable_to_non_nullable
                      as double?,
            heartRate: freezed == heartRate
                ? _value.heartRate
                : heartRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            fetalHeartRate: freezed == fetalHeartRate
                ? _value.fetalHeartRate
                : fetalHeartRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            fundalHeightCm: freezed == fundalHeightCm
                ? _value.fundalHeightCm
                : fundalHeightCm // ignore: cast_nullable_to_non_nullable
                      as double?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double?,
            complaints: freezed == complaints
                ? _value.complaints
                : complaints // ignore: cast_nullable_to_non_nullable
                      as String?,
            physicalExamination: freezed == physicalExamination
                ? _value.physicalExamination
                : physicalExamination // ignore: cast_nullable_to_non_nullable
                      as String?,
            diagnosis: freezed == diagnosis
                ? _value.diagnosis
                : diagnosis // ignore: cast_nullable_to_non_nullable
                      as String?,
            treatmentPlan: freezed == treatmentPlan
                ? _value.treatmentPlan
                : treatmentPlan // ignore: cast_nullable_to_non_nullable
                      as String?,
            medications: freezed == medications
                ? _value.medications
                : medications // ignore: cast_nullable_to_non_nullable
                      as String?,
            supplements: freezed == supplements
                ? _value.supplements
                : supplements // ignore: cast_nullable_to_non_nullable
                      as String?,
            referralNeeded: null == referralNeeded
                ? _value.referralNeeded
                : referralNeeded // ignore: cast_nullable_to_non_nullable
                      as bool,
            referralNotes: freezed == referralNotes
                ? _value.referralNotes
                : referralNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextCheckupDate: freezed == nextCheckupDate
                ? _value.nextCheckupDate
                : nextCheckupDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            nextCheckupNotes: freezed == nextCheckupNotes
                ? _value.nextCheckupNotes
                : nextCheckupNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthRecordModelImplCopyWith<$Res>
    implements $HealthRecordModelCopyWith<$Res> {
  factory _$$HealthRecordModelImplCopyWith(
    _$HealthRecordModelImpl value,
    $Res Function(_$HealthRecordModelImpl) then,
  ) = __$$HealthRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'ibu_hamil_id') int ibuHamilId,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'checkup_date') DateTime checkupDate,
    @JsonKey(name: 'checkup_type') String checkupType,
    @JsonKey(name: 'data_source') String dataSource,
    @JsonKey(name: 'gestational_age_weeks') int? gestationalAgeWeeks,
    @JsonKey(name: 'gestational_age_days') int? gestationalAgeDays,
    @JsonKey(name: 'blood_pressure_systolic') int? bloodPressureSystolic,
    @JsonKey(name: 'blood_pressure_diastolic') int? bloodPressureDiastolic,
    @JsonKey(name: 'blood_glucose') double? bloodGlucose,
    @JsonKey(name: 'body_temperature') double? bodyTemperature,
    @JsonKey(name: 'heart_rate') int? heartRate,
    @JsonKey(name: 'fetal_heart_rate') int? fetalHeartRate,
    @JsonKey(name: 'fundal_height_cm') double? fundalHeightCm,
    @JsonKey(name: 'weight') double? weight,
    String? complaints,
    @JsonKey(name: 'physical_examination') String? physicalExamination,
    String? diagnosis,
    @JsonKey(name: 'treatment_plan') String? treatmentPlan,
    String? medications,
    String? supplements,
    @JsonKey(name: 'referral_needed') bool referralNeeded,
    @JsonKey(name: 'referral_notes') String? referralNotes,
    @JsonKey(name: 'next_checkup_date') DateTime? nextCheckupDate,
    @JsonKey(name: 'next_checkup_notes') String? nextCheckupNotes,
    String? notes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$HealthRecordModelImplCopyWithImpl<$Res>
    extends _$HealthRecordModelCopyWithImpl<$Res, _$HealthRecordModelImpl>
    implements _$$HealthRecordModelImplCopyWith<$Res> {
  __$$HealthRecordModelImplCopyWithImpl(
    _$HealthRecordModelImpl _value,
    $Res Function(_$HealthRecordModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ibuHamilId = null,
    Object? perawatId = freezed,
    Object? checkupDate = null,
    Object? checkupType = null,
    Object? dataSource = null,
    Object? gestationalAgeWeeks = freezed,
    Object? gestationalAgeDays = freezed,
    Object? bloodPressureSystolic = freezed,
    Object? bloodPressureDiastolic = freezed,
    Object? bloodGlucose = freezed,
    Object? bodyTemperature = freezed,
    Object? heartRate = freezed,
    Object? fetalHeartRate = freezed,
    Object? fundalHeightCm = freezed,
    Object? weight = freezed,
    Object? complaints = freezed,
    Object? physicalExamination = freezed,
    Object? diagnosis = freezed,
    Object? treatmentPlan = freezed,
    Object? medications = freezed,
    Object? supplements = freezed,
    Object? referralNeeded = null,
    Object? referralNotes = freezed,
    Object? nextCheckupDate = freezed,
    Object? nextCheckupNotes = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$HealthRecordModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        ibuHamilId: null == ibuHamilId
            ? _value.ibuHamilId
            : ibuHamilId // ignore: cast_nullable_to_non_nullable
                  as int,
        perawatId: freezed == perawatId
            ? _value.perawatId
            : perawatId // ignore: cast_nullable_to_non_nullable
                  as int?,
        checkupDate: null == checkupDate
            ? _value.checkupDate
            : checkupDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        checkupType: null == checkupType
            ? _value.checkupType
            : checkupType // ignore: cast_nullable_to_non_nullable
                  as String,
        dataSource: null == dataSource
            ? _value.dataSource
            : dataSource // ignore: cast_nullable_to_non_nullable
                  as String,
        gestationalAgeWeeks: freezed == gestationalAgeWeeks
            ? _value.gestationalAgeWeeks
            : gestationalAgeWeeks // ignore: cast_nullable_to_non_nullable
                  as int?,
        gestationalAgeDays: freezed == gestationalAgeDays
            ? _value.gestationalAgeDays
            : gestationalAgeDays // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodPressureSystolic: freezed == bloodPressureSystolic
            ? _value.bloodPressureSystolic
            : bloodPressureSystolic // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodPressureDiastolic: freezed == bloodPressureDiastolic
            ? _value.bloodPressureDiastolic
            : bloodPressureDiastolic // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodGlucose: freezed == bloodGlucose
            ? _value.bloodGlucose
            : bloodGlucose // ignore: cast_nullable_to_non_nullable
                  as double?,
        bodyTemperature: freezed == bodyTemperature
            ? _value.bodyTemperature
            : bodyTemperature // ignore: cast_nullable_to_non_nullable
                  as double?,
        heartRate: freezed == heartRate
            ? _value.heartRate
            : heartRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        fetalHeartRate: freezed == fetalHeartRate
            ? _value.fetalHeartRate
            : fetalHeartRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        fundalHeightCm: freezed == fundalHeightCm
            ? _value.fundalHeightCm
            : fundalHeightCm // ignore: cast_nullable_to_non_nullable
                  as double?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
        complaints: freezed == complaints
            ? _value.complaints
            : complaints // ignore: cast_nullable_to_non_nullable
                  as String?,
        physicalExamination: freezed == physicalExamination
            ? _value.physicalExamination
            : physicalExamination // ignore: cast_nullable_to_non_nullable
                  as String?,
        diagnosis: freezed == diagnosis
            ? _value.diagnosis
            : diagnosis // ignore: cast_nullable_to_non_nullable
                  as String?,
        treatmentPlan: freezed == treatmentPlan
            ? _value.treatmentPlan
            : treatmentPlan // ignore: cast_nullable_to_non_nullable
                  as String?,
        medications: freezed == medications
            ? _value.medications
            : medications // ignore: cast_nullable_to_non_nullable
                  as String?,
        supplements: freezed == supplements
            ? _value.supplements
            : supplements // ignore: cast_nullable_to_non_nullable
                  as String?,
        referralNeeded: null == referralNeeded
            ? _value.referralNeeded
            : referralNeeded // ignore: cast_nullable_to_non_nullable
                  as bool,
        referralNotes: freezed == referralNotes
            ? _value.referralNotes
            : referralNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextCheckupDate: freezed == nextCheckupDate
            ? _value.nextCheckupDate
            : nextCheckupDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        nextCheckupNotes: freezed == nextCheckupNotes
            ? _value.nextCheckupNotes
            : nextCheckupNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthRecordModelImpl implements _HealthRecordModel {
  const _$HealthRecordModelImpl({
    required this.id,
    @JsonKey(name: 'ibu_hamil_id') required this.ibuHamilId,
    @JsonKey(name: 'perawat_id') this.perawatId,
    @JsonKey(name: 'checkup_date') required this.checkupDate,
    @JsonKey(name: 'checkup_type') required this.checkupType,
    @JsonKey(name: 'data_source') required this.dataSource,
    @JsonKey(name: 'gestational_age_weeks') this.gestationalAgeWeeks,
    @JsonKey(name: 'gestational_age_days') this.gestationalAgeDays,
    @JsonKey(name: 'blood_pressure_systolic') this.bloodPressureSystolic,
    @JsonKey(name: 'blood_pressure_diastolic') this.bloodPressureDiastolic,
    @JsonKey(name: 'blood_glucose') this.bloodGlucose,
    @JsonKey(name: 'body_temperature') this.bodyTemperature,
    @JsonKey(name: 'heart_rate') this.heartRate,
    @JsonKey(name: 'fetal_heart_rate') this.fetalHeartRate,
    @JsonKey(name: 'fundal_height_cm') this.fundalHeightCm,
    @JsonKey(name: 'weight') this.weight,
    this.complaints,
    @JsonKey(name: 'physical_examination') this.physicalExamination,
    this.diagnosis,
    @JsonKey(name: 'treatment_plan') this.treatmentPlan,
    this.medications,
    this.supplements,
    @JsonKey(name: 'referral_needed') this.referralNeeded = false,
    @JsonKey(name: 'referral_notes') this.referralNotes,
    @JsonKey(name: 'next_checkup_date') this.nextCheckupDate,
    @JsonKey(name: 'next_checkup_notes') this.nextCheckupNotes,
    this.notes,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$HealthRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthRecordModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'ibu_hamil_id')
  final int ibuHamilId;
  @override
  @JsonKey(name: 'perawat_id')
  final int? perawatId;
  @override
  @JsonKey(name: 'checkup_date')
  final DateTime checkupDate;
  @override
  @JsonKey(name: 'checkup_type')
  final String checkupType;
  // 'berkala' or 'ad-hoc'
  @override
  @JsonKey(name: 'data_source')
  final String dataSource;
  // 'manual' or 'iot_device'
  @override
  @JsonKey(name: 'gestational_age_weeks')
  final int? gestationalAgeWeeks;
  @override
  @JsonKey(name: 'gestational_age_days')
  final int? gestationalAgeDays;
  @override
  @JsonKey(name: 'blood_pressure_systolic')
  final int? bloodPressureSystolic;
  @override
  @JsonKey(name: 'blood_pressure_diastolic')
  final int? bloodPressureDiastolic;
  @override
  @JsonKey(name: 'blood_glucose')
  final double? bloodGlucose;
  @override
  @JsonKey(name: 'body_temperature')
  final double? bodyTemperature;
  @override
  @JsonKey(name: 'heart_rate')
  final int? heartRate;
  @override
  @JsonKey(name: 'fetal_heart_rate')
  final int? fetalHeartRate;
  @override
  @JsonKey(name: 'fundal_height_cm')
  final double? fundalHeightCm;
  @override
  @JsonKey(name: 'weight')
  final double? weight;
  @override
  final String? complaints;
  @override
  @JsonKey(name: 'physical_examination')
  final String? physicalExamination;
  @override
  final String? diagnosis;
  @override
  @JsonKey(name: 'treatment_plan')
  final String? treatmentPlan;
  @override
  final String? medications;
  @override
  final String? supplements;
  @override
  @JsonKey(name: 'referral_needed')
  final bool referralNeeded;
  @override
  @JsonKey(name: 'referral_notes')
  final String? referralNotes;
  @override
  @JsonKey(name: 'next_checkup_date')
  final DateTime? nextCheckupDate;
  @override
  @JsonKey(name: 'next_checkup_notes')
  final String? nextCheckupNotes;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'HealthRecordModel(id: $id, ibuHamilId: $ibuHamilId, perawatId: $perawatId, checkupDate: $checkupDate, checkupType: $checkupType, dataSource: $dataSource, gestationalAgeWeeks: $gestationalAgeWeeks, gestationalAgeDays: $gestationalAgeDays, bloodPressureSystolic: $bloodPressureSystolic, bloodPressureDiastolic: $bloodPressureDiastolic, bloodGlucose: $bloodGlucose, bodyTemperature: $bodyTemperature, heartRate: $heartRate, fetalHeartRate: $fetalHeartRate, fundalHeightCm: $fundalHeightCm, weight: $weight, complaints: $complaints, physicalExamination: $physicalExamination, diagnosis: $diagnosis, treatmentPlan: $treatmentPlan, medications: $medications, supplements: $supplements, referralNeeded: $referralNeeded, referralNotes: $referralNotes, nextCheckupDate: $nextCheckupDate, nextCheckupNotes: $nextCheckupNotes, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ibuHamilId, ibuHamilId) ||
                other.ibuHamilId == ibuHamilId) &&
            (identical(other.perawatId, perawatId) ||
                other.perawatId == perawatId) &&
            (identical(other.checkupDate, checkupDate) ||
                other.checkupDate == checkupDate) &&
            (identical(other.checkupType, checkupType) ||
                other.checkupType == checkupType) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            (identical(other.gestationalAgeWeeks, gestationalAgeWeeks) ||
                other.gestationalAgeWeeks == gestationalAgeWeeks) &&
            (identical(other.gestationalAgeDays, gestationalAgeDays) ||
                other.gestationalAgeDays == gestationalAgeDays) &&
            (identical(other.bloodPressureSystolic, bloodPressureSystolic) ||
                other.bloodPressureSystolic == bloodPressureSystolic) &&
            (identical(other.bloodPressureDiastolic, bloodPressureDiastolic) ||
                other.bloodPressureDiastolic == bloodPressureDiastolic) &&
            (identical(other.bloodGlucose, bloodGlucose) ||
                other.bloodGlucose == bloodGlucose) &&
            (identical(other.bodyTemperature, bodyTemperature) ||
                other.bodyTemperature == bodyTemperature) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.fetalHeartRate, fetalHeartRate) ||
                other.fetalHeartRate == fetalHeartRate) &&
            (identical(other.fundalHeightCm, fundalHeightCm) ||
                other.fundalHeightCm == fundalHeightCm) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.complaints, complaints) ||
                other.complaints == complaints) &&
            (identical(other.physicalExamination, physicalExamination) ||
                other.physicalExamination == physicalExamination) &&
            (identical(other.diagnosis, diagnosis) ||
                other.diagnosis == diagnosis) &&
            (identical(other.treatmentPlan, treatmentPlan) ||
                other.treatmentPlan == treatmentPlan) &&
            (identical(other.medications, medications) ||
                other.medications == medications) &&
            (identical(other.supplements, supplements) ||
                other.supplements == supplements) &&
            (identical(other.referralNeeded, referralNeeded) ||
                other.referralNeeded == referralNeeded) &&
            (identical(other.referralNotes, referralNotes) ||
                other.referralNotes == referralNotes) &&
            (identical(other.nextCheckupDate, nextCheckupDate) ||
                other.nextCheckupDate == nextCheckupDate) &&
            (identical(other.nextCheckupNotes, nextCheckupNotes) ||
                other.nextCheckupNotes == nextCheckupNotes) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    ibuHamilId,
    perawatId,
    checkupDate,
    checkupType,
    dataSource,
    gestationalAgeWeeks,
    gestationalAgeDays,
    bloodPressureSystolic,
    bloodPressureDiastolic,
    bloodGlucose,
    bodyTemperature,
    heartRate,
    fetalHeartRate,
    fundalHeightCm,
    weight,
    complaints,
    physicalExamination,
    diagnosis,
    treatmentPlan,
    medications,
    supplements,
    referralNeeded,
    referralNotes,
    nextCheckupDate,
    nextCheckupNotes,
    notes,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of HealthRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthRecordModelImplCopyWith<_$HealthRecordModelImpl> get copyWith =>
      __$$HealthRecordModelImplCopyWithImpl<_$HealthRecordModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthRecordModelImplToJson(this);
  }
}

abstract class _HealthRecordModel implements HealthRecordModel {
  const factory _HealthRecordModel({
    required final int id,
    @JsonKey(name: 'ibu_hamil_id') required final int ibuHamilId,
    @JsonKey(name: 'perawat_id') final int? perawatId,
    @JsonKey(name: 'checkup_date') required final DateTime checkupDate,
    @JsonKey(name: 'checkup_type') required final String checkupType,
    @JsonKey(name: 'data_source') required final String dataSource,
    @JsonKey(name: 'gestational_age_weeks') final int? gestationalAgeWeeks,
    @JsonKey(name: 'gestational_age_days') final int? gestationalAgeDays,
    @JsonKey(name: 'blood_pressure_systolic') final int? bloodPressureSystolic,
    @JsonKey(name: 'blood_pressure_diastolic')
    final int? bloodPressureDiastolic,
    @JsonKey(name: 'blood_glucose') final double? bloodGlucose,
    @JsonKey(name: 'body_temperature') final double? bodyTemperature,
    @JsonKey(name: 'heart_rate') final int? heartRate,
    @JsonKey(name: 'fetal_heart_rate') final int? fetalHeartRate,
    @JsonKey(name: 'fundal_height_cm') final double? fundalHeightCm,
    @JsonKey(name: 'weight') final double? weight,
    final String? complaints,
    @JsonKey(name: 'physical_examination') final String? physicalExamination,
    final String? diagnosis,
    @JsonKey(name: 'treatment_plan') final String? treatmentPlan,
    final String? medications,
    final String? supplements,
    @JsonKey(name: 'referral_needed') final bool referralNeeded,
    @JsonKey(name: 'referral_notes') final String? referralNotes,
    @JsonKey(name: 'next_checkup_date') final DateTime? nextCheckupDate,
    @JsonKey(name: 'next_checkup_notes') final String? nextCheckupNotes,
    final String? notes,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$HealthRecordModelImpl;

  factory _HealthRecordModel.fromJson(Map<String, dynamic> json) =
      _$HealthRecordModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'ibu_hamil_id')
  int get ibuHamilId;
  @override
  @JsonKey(name: 'perawat_id')
  int? get perawatId;
  @override
  @JsonKey(name: 'checkup_date')
  DateTime get checkupDate;
  @override
  @JsonKey(name: 'checkup_type')
  String get checkupType; // 'berkala' or 'ad-hoc'
  @override
  @JsonKey(name: 'data_source')
  String get dataSource; // 'manual' or 'iot_device'
  @override
  @JsonKey(name: 'gestational_age_weeks')
  int? get gestationalAgeWeeks;
  @override
  @JsonKey(name: 'gestational_age_days')
  int? get gestationalAgeDays;
  @override
  @JsonKey(name: 'blood_pressure_systolic')
  int? get bloodPressureSystolic;
  @override
  @JsonKey(name: 'blood_pressure_diastolic')
  int? get bloodPressureDiastolic;
  @override
  @JsonKey(name: 'blood_glucose')
  double? get bloodGlucose;
  @override
  @JsonKey(name: 'body_temperature')
  double? get bodyTemperature;
  @override
  @JsonKey(name: 'heart_rate')
  int? get heartRate;
  @override
  @JsonKey(name: 'fetal_heart_rate')
  int? get fetalHeartRate;
  @override
  @JsonKey(name: 'fundal_height_cm')
  double? get fundalHeightCm;
  @override
  @JsonKey(name: 'weight')
  double? get weight;
  @override
  String? get complaints;
  @override
  @JsonKey(name: 'physical_examination')
  String? get physicalExamination;
  @override
  String? get diagnosis;
  @override
  @JsonKey(name: 'treatment_plan')
  String? get treatmentPlan;
  @override
  String? get medications;
  @override
  String? get supplements;
  @override
  @JsonKey(name: 'referral_needed')
  bool get referralNeeded;
  @override
  @JsonKey(name: 'referral_notes')
  String? get referralNotes;
  @override
  @JsonKey(name: 'next_checkup_date')
  DateTime? get nextCheckupDate;
  @override
  @JsonKey(name: 'next_checkup_notes')
  String? get nextCheckupNotes;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of HealthRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthRecordModelImplCopyWith<_$HealthRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
