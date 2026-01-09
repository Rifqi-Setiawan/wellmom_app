// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ibu_hamil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IbuHamilModel _$IbuHamilModelFromJson(Map<String, dynamic> json) {
  return _IbuHamilModel.fromJson(json);
}

/// @nodoc
mixin _$IbuHamilModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap => throw _privateConstructorUsedError;
  String get nik => throw _privateConstructorUsedError; // 16 digit
  @JsonKey(name: 'date_of_birth')
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo_url')
  String? get profilePhotoUrl => throw _privateConstructorUsedError; // Alamat & Lokasi
  String get address => throw _privateConstructorUsedError;
  Location get location =>
      throw _privateConstructorUsedError; // longitude & latitude
  String? get provinsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'kota_kabupaten')
  String? get kotaKabupaten => throw _privateConstructorUsedError;
  String? get kelurahan => throw _privateConstructorUsedError;
  String? get kecamatan => throw _privateConstructorUsedError;
  @JsonKey(name: 'rt_rw')
  String? get rtRw => throw _privateConstructorUsedError; // Data Kehamilan
  @JsonKey(name: 'last_menstrual_period')
  DateTime? get lastMenstrualPeriod => throw _privateConstructorUsedError; // HPHT
  @JsonKey(name: 'estimated_due_date')
  DateTime? get estimatedDueDate => throw _privateConstructorUsedError; // HPL
  @JsonKey(name: 'usia_kehamilan')
  int? get usiaKehamilan => throw _privateConstructorUsedError; // minggu
  @JsonKey(name: 'kehamilan_ke')
  int? get kehamilanKe => throw _privateConstructorUsedError;
  @JsonKey(name: 'jumlah_anak')
  int? get jumlahAnak => throw _privateConstructorUsedError;
  @JsonKey(name: 'jarak_kehamilan_terakhir')
  String? get jarakKehamilanTerakhir => throw _privateConstructorUsedError;
  @JsonKey(name: 'miscarriage_number')
  int? get miscarriageNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_pregnancy_complications')
  String? get previousPregnancyComplications =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pernah_caesar')
  bool get pernahCaesar => throw _privateConstructorUsedError;
  @JsonKey(name: 'pernah_perdarahan_saat_hamil')
  bool get pernahPerdarahanSaatHamil => throw _privateConstructorUsedError; // Riwayat Kesehatan (nested object)
  @JsonKey(name: 'riwayat_kesehatan_ibu')
  RiwayatKesehatanIbuModel get riwayatKesehatanIbu =>
      throw _privateConstructorUsedError; // Kontak Darurat
  @JsonKey(name: 'emergency_contact_name')
  String get emergencyContactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_contact_phone')
  String get emergencyContactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_contact_relation')
  String? get emergencyContactRelation => throw _privateConstructorUsedError; // Data Tambahan
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_type')
  String? get bloodType => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_cm')
  double? get heightCm => throw _privateConstructorUsedError;
  @JsonKey(name: 'pre_pregnancy_weight_kg')
  double? get prePregnancyWeightKg => throw _privateConstructorUsedError;
  @JsonKey(name: 'medical_history')
  String? get medicalHistory => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_medications')
  String? get currentMedications => throw _privateConstructorUsedError;
  @JsonKey(name: 'risk_level')
  String? get riskLevel => throw _privateConstructorUsedError; // 'low', 'normal', 'high'
  @JsonKey(name: 'healthcare_preference')
  String? get healthcarePreference => throw _privateConstructorUsedError;
  @JsonKey(name: 'whatsapp_consent')
  bool get whatsappConsent => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_sharing_consent')
  bool get dataSharingConsent => throw _privateConstructorUsedError; // Assignment (opsional untuk mobile)
  @JsonKey(name: 'puskesmas_id')
  int? get puskesmasId => throw _privateConstructorUsedError;
  @JsonKey(name: 'perawat_id')
  int? get perawatId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignment_date')
  DateTime? get assignmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignment_distance_km')
  double? get assignmentDistanceKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this IbuHamilModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IbuHamilModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IbuHamilModelCopyWith<IbuHamilModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IbuHamilModelCopyWith<$Res> {
  factory $IbuHamilModelCopyWith(
    IbuHamilModel value,
    $Res Function(IbuHamilModel) then,
  ) = _$IbuHamilModelCopyWithImpl<$Res, IbuHamilModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String nik,
    @JsonKey(name: 'date_of_birth') DateTime dateOfBirth,
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
    String address,
    Location location,
    String? provinsi,
    @JsonKey(name: 'kota_kabupaten') String? kotaKabupaten,
    String? kelurahan,
    String? kecamatan,
    @JsonKey(name: 'rt_rw') String? rtRw,
    @JsonKey(name: 'last_menstrual_period') DateTime? lastMenstrualPeriod,
    @JsonKey(name: 'estimated_due_date') DateTime? estimatedDueDate,
    @JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,
    @JsonKey(name: 'kehamilan_ke') int? kehamilanKe,
    @JsonKey(name: 'jumlah_anak') int? jumlahAnak,
    @JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,
    @JsonKey(name: 'miscarriage_number') int? miscarriageNumber,
    @JsonKey(name: 'previous_pregnancy_complications')
    String? previousPregnancyComplications,
    @JsonKey(name: 'pernah_caesar') bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'riwayat_kesehatan_ibu')
    RiwayatKesehatanIbuModel riwayatKesehatanIbu,
    @JsonKey(name: 'emergency_contact_name') String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation')
    String? emergencyContactRelation,
    int? age,
    @JsonKey(name: 'blood_type') String? bloodType,
    @JsonKey(name: 'height_cm') double? heightCm,
    @JsonKey(name: 'pre_pregnancy_weight_kg') double? prePregnancyWeightKg,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    @JsonKey(name: 'current_medications') String? currentMedications,
    @JsonKey(name: 'risk_level') String? riskLevel,
    @JsonKey(name: 'healthcare_preference') String? healthcarePreference,
    @JsonKey(name: 'whatsapp_consent') bool whatsappConsent,
    @JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,
    @JsonKey(name: 'puskesmas_id') int? puskesmasId,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'assignment_date') DateTime? assignmentDate,
    @JsonKey(name: 'assignment_distance_km') double? assignmentDistanceKm,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });

  $LocationCopyWith<$Res> get location;
  $RiwayatKesehatanIbuModelCopyWith<$Res> get riwayatKesehatanIbu;
}

/// @nodoc
class _$IbuHamilModelCopyWithImpl<$Res, $Val extends IbuHamilModel>
    implements $IbuHamilModelCopyWith<$Res> {
  _$IbuHamilModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IbuHamilModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? namaLengkap = null,
    Object? nik = null,
    Object? dateOfBirth = null,
    Object? profilePhotoUrl = freezed,
    Object? address = null,
    Object? location = null,
    Object? provinsi = freezed,
    Object? kotaKabupaten = freezed,
    Object? kelurahan = freezed,
    Object? kecamatan = freezed,
    Object? rtRw = freezed,
    Object? lastMenstrualPeriod = freezed,
    Object? estimatedDueDate = freezed,
    Object? usiaKehamilan = freezed,
    Object? kehamilanKe = freezed,
    Object? jumlahAnak = freezed,
    Object? jarakKehamilanTerakhir = freezed,
    Object? miscarriageNumber = freezed,
    Object? previousPregnancyComplications = freezed,
    Object? pernahCaesar = null,
    Object? pernahPerdarahanSaatHamil = null,
    Object? riwayatKesehatanIbu = null,
    Object? emergencyContactName = null,
    Object? emergencyContactPhone = null,
    Object? emergencyContactRelation = freezed,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? heightCm = freezed,
    Object? prePregnancyWeightKg = freezed,
    Object? medicalHistory = freezed,
    Object? currentMedications = freezed,
    Object? riskLevel = freezed,
    Object? healthcarePreference = freezed,
    Object? whatsappConsent = null,
    Object? dataSharingConsent = null,
    Object? puskesmasId = freezed,
    Object? perawatId = freezed,
    Object? assignmentDate = freezed,
    Object? assignmentDistanceKm = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            namaLengkap: null == namaLengkap
                ? _value.namaLengkap
                : namaLengkap // ignore: cast_nullable_to_non_nullable
                      as String,
            nik: null == nik
                ? _value.nik
                : nik // ignore: cast_nullable_to_non_nullable
                      as String,
            dateOfBirth: null == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            profilePhotoUrl: freezed == profilePhotoUrl
                ? _value.profilePhotoUrl
                : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as Location,
            provinsi: freezed == provinsi
                ? _value.provinsi
                : provinsi // ignore: cast_nullable_to_non_nullable
                      as String?,
            kotaKabupaten: freezed == kotaKabupaten
                ? _value.kotaKabupaten
                : kotaKabupaten // ignore: cast_nullable_to_non_nullable
                      as String?,
            kelurahan: freezed == kelurahan
                ? _value.kelurahan
                : kelurahan // ignore: cast_nullable_to_non_nullable
                      as String?,
            kecamatan: freezed == kecamatan
                ? _value.kecamatan
                : kecamatan // ignore: cast_nullable_to_non_nullable
                      as String?,
            rtRw: freezed == rtRw
                ? _value.rtRw
                : rtRw // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMenstrualPeriod: freezed == lastMenstrualPeriod
                ? _value.lastMenstrualPeriod
                : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            estimatedDueDate: freezed == estimatedDueDate
                ? _value.estimatedDueDate
                : estimatedDueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            usiaKehamilan: freezed == usiaKehamilan
                ? _value.usiaKehamilan
                : usiaKehamilan // ignore: cast_nullable_to_non_nullable
                      as int?,
            kehamilanKe: freezed == kehamilanKe
                ? _value.kehamilanKe
                : kehamilanKe // ignore: cast_nullable_to_non_nullable
                      as int?,
            jumlahAnak: freezed == jumlahAnak
                ? _value.jumlahAnak
                : jumlahAnak // ignore: cast_nullable_to_non_nullable
                      as int?,
            jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir
                ? _value.jarakKehamilanTerakhir
                : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
                      as String?,
            miscarriageNumber: freezed == miscarriageNumber
                ? _value.miscarriageNumber
                : miscarriageNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            previousPregnancyComplications:
                freezed == previousPregnancyComplications
                ? _value.previousPregnancyComplications
                : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
                      as String?,
            pernahCaesar: null == pernahCaesar
                ? _value.pernahCaesar
                : pernahCaesar // ignore: cast_nullable_to_non_nullable
                      as bool,
            pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil
                ? _value.pernahPerdarahanSaatHamil
                : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
                      as bool,
            riwayatKesehatanIbu: null == riwayatKesehatanIbu
                ? _value.riwayatKesehatanIbu
                : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
                      as RiwayatKesehatanIbuModel,
            emergencyContactName: null == emergencyContactName
                ? _value.emergencyContactName
                : emergencyContactName // ignore: cast_nullable_to_non_nullable
                      as String,
            emergencyContactPhone: null == emergencyContactPhone
                ? _value.emergencyContactPhone
                : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
                      as String,
            emergencyContactRelation: freezed == emergencyContactRelation
                ? _value.emergencyContactRelation
                : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
                      as String?,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodType: freezed == bloodType
                ? _value.bloodType
                : bloodType // ignore: cast_nullable_to_non_nullable
                      as String?,
            heightCm: freezed == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as double?,
            prePregnancyWeightKg: freezed == prePregnancyWeightKg
                ? _value.prePregnancyWeightKg
                : prePregnancyWeightKg // ignore: cast_nullable_to_non_nullable
                      as double?,
            medicalHistory: freezed == medicalHistory
                ? _value.medicalHistory
                : medicalHistory // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentMedications: freezed == currentMedications
                ? _value.currentMedications
                : currentMedications // ignore: cast_nullable_to_non_nullable
                      as String?,
            riskLevel: freezed == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            healthcarePreference: freezed == healthcarePreference
                ? _value.healthcarePreference
                : healthcarePreference // ignore: cast_nullable_to_non_nullable
                      as String?,
            whatsappConsent: null == whatsappConsent
                ? _value.whatsappConsent
                : whatsappConsent // ignore: cast_nullable_to_non_nullable
                      as bool,
            dataSharingConsent: null == dataSharingConsent
                ? _value.dataSharingConsent
                : dataSharingConsent // ignore: cast_nullable_to_non_nullable
                      as bool,
            puskesmasId: freezed == puskesmasId
                ? _value.puskesmasId
                : puskesmasId // ignore: cast_nullable_to_non_nullable
                      as int?,
            perawatId: freezed == perawatId
                ? _value.perawatId
                : perawatId // ignore: cast_nullable_to_non_nullable
                      as int?,
            assignmentDate: freezed == assignmentDate
                ? _value.assignmentDate
                : assignmentDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            assignmentDistanceKm: freezed == assignmentDistanceKm
                ? _value.assignmentDistanceKm
                : assignmentDistanceKm // ignore: cast_nullable_to_non_nullable
                      as double?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
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

  /// Create a copy of IbuHamilModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of IbuHamilModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RiwayatKesehatanIbuModelCopyWith<$Res> get riwayatKesehatanIbu {
    return $RiwayatKesehatanIbuModelCopyWith<$Res>(_value.riwayatKesehatanIbu, (
      value,
    ) {
      return _then(_value.copyWith(riwayatKesehatanIbu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IbuHamilModelImplCopyWith<$Res>
    implements $IbuHamilModelCopyWith<$Res> {
  factory _$$IbuHamilModelImplCopyWith(
    _$IbuHamilModelImpl value,
    $Res Function(_$IbuHamilModelImpl) then,
  ) = __$$IbuHamilModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String nik,
    @JsonKey(name: 'date_of_birth') DateTime dateOfBirth,
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
    String address,
    Location location,
    String? provinsi,
    @JsonKey(name: 'kota_kabupaten') String? kotaKabupaten,
    String? kelurahan,
    String? kecamatan,
    @JsonKey(name: 'rt_rw') String? rtRw,
    @JsonKey(name: 'last_menstrual_period') DateTime? lastMenstrualPeriod,
    @JsonKey(name: 'estimated_due_date') DateTime? estimatedDueDate,
    @JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,
    @JsonKey(name: 'kehamilan_ke') int? kehamilanKe,
    @JsonKey(name: 'jumlah_anak') int? jumlahAnak,
    @JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,
    @JsonKey(name: 'miscarriage_number') int? miscarriageNumber,
    @JsonKey(name: 'previous_pregnancy_complications')
    String? previousPregnancyComplications,
    @JsonKey(name: 'pernah_caesar') bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'riwayat_kesehatan_ibu')
    RiwayatKesehatanIbuModel riwayatKesehatanIbu,
    @JsonKey(name: 'emergency_contact_name') String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation')
    String? emergencyContactRelation,
    int? age,
    @JsonKey(name: 'blood_type') String? bloodType,
    @JsonKey(name: 'height_cm') double? heightCm,
    @JsonKey(name: 'pre_pregnancy_weight_kg') double? prePregnancyWeightKg,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    @JsonKey(name: 'current_medications') String? currentMedications,
    @JsonKey(name: 'risk_level') String? riskLevel,
    @JsonKey(name: 'healthcare_preference') String? healthcarePreference,
    @JsonKey(name: 'whatsapp_consent') bool whatsappConsent,
    @JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,
    @JsonKey(name: 'puskesmas_id') int? puskesmasId,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'assignment_date') DateTime? assignmentDate,
    @JsonKey(name: 'assignment_distance_km') double? assignmentDistanceKm,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });

  @override
  $LocationCopyWith<$Res> get location;
  @override
  $RiwayatKesehatanIbuModelCopyWith<$Res> get riwayatKesehatanIbu;
}

/// @nodoc
class __$$IbuHamilModelImplCopyWithImpl<$Res>
    extends _$IbuHamilModelCopyWithImpl<$Res, _$IbuHamilModelImpl>
    implements _$$IbuHamilModelImplCopyWith<$Res> {
  __$$IbuHamilModelImplCopyWithImpl(
    _$IbuHamilModelImpl _value,
    $Res Function(_$IbuHamilModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IbuHamilModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? namaLengkap = null,
    Object? nik = null,
    Object? dateOfBirth = null,
    Object? profilePhotoUrl = freezed,
    Object? address = null,
    Object? location = null,
    Object? provinsi = freezed,
    Object? kotaKabupaten = freezed,
    Object? kelurahan = freezed,
    Object? kecamatan = freezed,
    Object? rtRw = freezed,
    Object? lastMenstrualPeriod = freezed,
    Object? estimatedDueDate = freezed,
    Object? usiaKehamilan = freezed,
    Object? kehamilanKe = freezed,
    Object? jumlahAnak = freezed,
    Object? jarakKehamilanTerakhir = freezed,
    Object? miscarriageNumber = freezed,
    Object? previousPregnancyComplications = freezed,
    Object? pernahCaesar = null,
    Object? pernahPerdarahanSaatHamil = null,
    Object? riwayatKesehatanIbu = null,
    Object? emergencyContactName = null,
    Object? emergencyContactPhone = null,
    Object? emergencyContactRelation = freezed,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? heightCm = freezed,
    Object? prePregnancyWeightKg = freezed,
    Object? medicalHistory = freezed,
    Object? currentMedications = freezed,
    Object? riskLevel = freezed,
    Object? healthcarePreference = freezed,
    Object? whatsappConsent = null,
    Object? dataSharingConsent = null,
    Object? puskesmasId = freezed,
    Object? perawatId = freezed,
    Object? assignmentDate = freezed,
    Object? assignmentDistanceKm = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$IbuHamilModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        namaLengkap: null == namaLengkap
            ? _value.namaLengkap
            : namaLengkap // ignore: cast_nullable_to_non_nullable
                  as String,
        nik: null == nik
            ? _value.nik
            : nik // ignore: cast_nullable_to_non_nullable
                  as String,
        dateOfBirth: null == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        profilePhotoUrl: freezed == profilePhotoUrl
            ? _value.profilePhotoUrl
            : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as Location,
        provinsi: freezed == provinsi
            ? _value.provinsi
            : provinsi // ignore: cast_nullable_to_non_nullable
                  as String?,
        kotaKabupaten: freezed == kotaKabupaten
            ? _value.kotaKabupaten
            : kotaKabupaten // ignore: cast_nullable_to_non_nullable
                  as String?,
        kelurahan: freezed == kelurahan
            ? _value.kelurahan
            : kelurahan // ignore: cast_nullable_to_non_nullable
                  as String?,
        kecamatan: freezed == kecamatan
            ? _value.kecamatan
            : kecamatan // ignore: cast_nullable_to_non_nullable
                  as String?,
        rtRw: freezed == rtRw
            ? _value.rtRw
            : rtRw // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMenstrualPeriod: freezed == lastMenstrualPeriod
            ? _value.lastMenstrualPeriod
            : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        estimatedDueDate: freezed == estimatedDueDate
            ? _value.estimatedDueDate
            : estimatedDueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        usiaKehamilan: freezed == usiaKehamilan
            ? _value.usiaKehamilan
            : usiaKehamilan // ignore: cast_nullable_to_non_nullable
                  as int?,
        kehamilanKe: freezed == kehamilanKe
            ? _value.kehamilanKe
            : kehamilanKe // ignore: cast_nullable_to_non_nullable
                  as int?,
        jumlahAnak: freezed == jumlahAnak
            ? _value.jumlahAnak
            : jumlahAnak // ignore: cast_nullable_to_non_nullable
                  as int?,
        jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir
            ? _value.jarakKehamilanTerakhir
            : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
                  as String?,
        miscarriageNumber: freezed == miscarriageNumber
            ? _value.miscarriageNumber
            : miscarriageNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        previousPregnancyComplications:
            freezed == previousPregnancyComplications
            ? _value.previousPregnancyComplications
            : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
                  as String?,
        pernahCaesar: null == pernahCaesar
            ? _value.pernahCaesar
            : pernahCaesar // ignore: cast_nullable_to_non_nullable
                  as bool,
        pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil
            ? _value.pernahPerdarahanSaatHamil
            : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
                  as bool,
        riwayatKesehatanIbu: null == riwayatKesehatanIbu
            ? _value.riwayatKesehatanIbu
            : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
                  as RiwayatKesehatanIbuModel,
        emergencyContactName: null == emergencyContactName
            ? _value.emergencyContactName
            : emergencyContactName // ignore: cast_nullable_to_non_nullable
                  as String,
        emergencyContactPhone: null == emergencyContactPhone
            ? _value.emergencyContactPhone
            : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
                  as String,
        emergencyContactRelation: freezed == emergencyContactRelation
            ? _value.emergencyContactRelation
            : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
                  as String?,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodType: freezed == bloodType
            ? _value.bloodType
            : bloodType // ignore: cast_nullable_to_non_nullable
                  as String?,
        heightCm: freezed == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as double?,
        prePregnancyWeightKg: freezed == prePregnancyWeightKg
            ? _value.prePregnancyWeightKg
            : prePregnancyWeightKg // ignore: cast_nullable_to_non_nullable
                  as double?,
        medicalHistory: freezed == medicalHistory
            ? _value.medicalHistory
            : medicalHistory // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentMedications: freezed == currentMedications
            ? _value.currentMedications
            : currentMedications // ignore: cast_nullable_to_non_nullable
                  as String?,
        riskLevel: freezed == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        healthcarePreference: freezed == healthcarePreference
            ? _value.healthcarePreference
            : healthcarePreference // ignore: cast_nullable_to_non_nullable
                  as String?,
        whatsappConsent: null == whatsappConsent
            ? _value.whatsappConsent
            : whatsappConsent // ignore: cast_nullable_to_non_nullable
                  as bool,
        dataSharingConsent: null == dataSharingConsent
            ? _value.dataSharingConsent
            : dataSharingConsent // ignore: cast_nullable_to_non_nullable
                  as bool,
        puskesmasId: freezed == puskesmasId
            ? _value.puskesmasId
            : puskesmasId // ignore: cast_nullable_to_non_nullable
                  as int?,
        perawatId: freezed == perawatId
            ? _value.perawatId
            : perawatId // ignore: cast_nullable_to_non_nullable
                  as int?,
        assignmentDate: freezed == assignmentDate
            ? _value.assignmentDate
            : assignmentDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        assignmentDistanceKm: freezed == assignmentDistanceKm
            ? _value.assignmentDistanceKm
            : assignmentDistanceKm // ignore: cast_nullable_to_non_nullable
                  as double?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$IbuHamilModelImpl implements _IbuHamilModel {
  const _$IbuHamilModelImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'nama_lengkap') required this.namaLengkap,
    required this.nik,
    @JsonKey(name: 'date_of_birth') required this.dateOfBirth,
    @JsonKey(name: 'profile_photo_url') this.profilePhotoUrl,
    required this.address,
    required this.location,
    this.provinsi,
    @JsonKey(name: 'kota_kabupaten') this.kotaKabupaten,
    this.kelurahan,
    this.kecamatan,
    @JsonKey(name: 'rt_rw') this.rtRw,
    @JsonKey(name: 'last_menstrual_period') this.lastMenstrualPeriod,
    @JsonKey(name: 'estimated_due_date') this.estimatedDueDate,
    @JsonKey(name: 'usia_kehamilan') this.usiaKehamilan,
    @JsonKey(name: 'kehamilan_ke') this.kehamilanKe = 1,
    @JsonKey(name: 'jumlah_anak') this.jumlahAnak = 0,
    @JsonKey(name: 'jarak_kehamilan_terakhir') this.jarakKehamilanTerakhir,
    @JsonKey(name: 'miscarriage_number') this.miscarriageNumber = 0,
    @JsonKey(name: 'previous_pregnancy_complications')
    this.previousPregnancyComplications,
    @JsonKey(name: 'pernah_caesar') this.pernahCaesar = false,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    this.pernahPerdarahanSaatHamil = false,
    @JsonKey(name: 'riwayat_kesehatan_ibu') required this.riwayatKesehatanIbu,
    @JsonKey(name: 'emergency_contact_name') required this.emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone')
    required this.emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation') this.emergencyContactRelation,
    this.age,
    @JsonKey(name: 'blood_type') this.bloodType,
    @JsonKey(name: 'height_cm') this.heightCm,
    @JsonKey(name: 'pre_pregnancy_weight_kg') this.prePregnancyWeightKg,
    @JsonKey(name: 'medical_history') this.medicalHistory,
    @JsonKey(name: 'current_medications') this.currentMedications,
    @JsonKey(name: 'risk_level') this.riskLevel,
    @JsonKey(name: 'healthcare_preference') this.healthcarePreference,
    @JsonKey(name: 'whatsapp_consent') this.whatsappConsent = true,
    @JsonKey(name: 'data_sharing_consent') this.dataSharingConsent = false,
    @JsonKey(name: 'puskesmas_id') this.puskesmasId,
    @JsonKey(name: 'perawat_id') this.perawatId,
    @JsonKey(name: 'assignment_date') this.assignmentDate,
    @JsonKey(name: 'assignment_distance_km') this.assignmentDistanceKm,
    @JsonKey(name: 'is_active') this.isActive = true,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$IbuHamilModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IbuHamilModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'nama_lengkap')
  final String namaLengkap;
  @override
  final String nik;
  // 16 digit
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime dateOfBirth;
  @override
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;
  // Alamat & Lokasi
  @override
  final String address;
  @override
  final Location location;
  // longitude & latitude
  @override
  final String? provinsi;
  @override
  @JsonKey(name: 'kota_kabupaten')
  final String? kotaKabupaten;
  @override
  final String? kelurahan;
  @override
  final String? kecamatan;
  @override
  @JsonKey(name: 'rt_rw')
  final String? rtRw;
  // Data Kehamilan
  @override
  @JsonKey(name: 'last_menstrual_period')
  final DateTime? lastMenstrualPeriod;
  // HPHT
  @override
  @JsonKey(name: 'estimated_due_date')
  final DateTime? estimatedDueDate;
  // HPL
  @override
  @JsonKey(name: 'usia_kehamilan')
  final int? usiaKehamilan;
  // minggu
  @override
  @JsonKey(name: 'kehamilan_ke')
  final int? kehamilanKe;
  @override
  @JsonKey(name: 'jumlah_anak')
  final int? jumlahAnak;
  @override
  @JsonKey(name: 'jarak_kehamilan_terakhir')
  final String? jarakKehamilanTerakhir;
  @override
  @JsonKey(name: 'miscarriage_number')
  final int? miscarriageNumber;
  @override
  @JsonKey(name: 'previous_pregnancy_complications')
  final String? previousPregnancyComplications;
  @override
  @JsonKey(name: 'pernah_caesar')
  final bool pernahCaesar;
  @override
  @JsonKey(name: 'pernah_perdarahan_saat_hamil')
  final bool pernahPerdarahanSaatHamil;
  // Riwayat Kesehatan (nested object)
  @override
  @JsonKey(name: 'riwayat_kesehatan_ibu')
  final RiwayatKesehatanIbuModel riwayatKesehatanIbu;
  // Kontak Darurat
  @override
  @JsonKey(name: 'emergency_contact_name')
  final String emergencyContactName;
  @override
  @JsonKey(name: 'emergency_contact_phone')
  final String emergencyContactPhone;
  @override
  @JsonKey(name: 'emergency_contact_relation')
  final String? emergencyContactRelation;
  // Data Tambahan
  @override
  final int? age;
  @override
  @JsonKey(name: 'blood_type')
  final String? bloodType;
  @override
  @JsonKey(name: 'height_cm')
  final double? heightCm;
  @override
  @JsonKey(name: 'pre_pregnancy_weight_kg')
  final double? prePregnancyWeightKg;
  @override
  @JsonKey(name: 'medical_history')
  final String? medicalHistory;
  @override
  @JsonKey(name: 'current_medications')
  final String? currentMedications;
  @override
  @JsonKey(name: 'risk_level')
  final String? riskLevel;
  // 'low', 'normal', 'high'
  @override
  @JsonKey(name: 'healthcare_preference')
  final String? healthcarePreference;
  @override
  @JsonKey(name: 'whatsapp_consent')
  final bool whatsappConsent;
  @override
  @JsonKey(name: 'data_sharing_consent')
  final bool dataSharingConsent;
  // Assignment (opsional untuk mobile)
  @override
  @JsonKey(name: 'puskesmas_id')
  final int? puskesmasId;
  @override
  @JsonKey(name: 'perawat_id')
  final int? perawatId;
  @override
  @JsonKey(name: 'assignment_date')
  final DateTime? assignmentDate;
  @override
  @JsonKey(name: 'assignment_distance_km')
  final double? assignmentDistanceKm;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'IbuHamilModel(id: $id, userId: $userId, namaLengkap: $namaLengkap, nik: $nik, dateOfBirth: $dateOfBirth, profilePhotoUrl: $profilePhotoUrl, address: $address, location: $location, provinsi: $provinsi, kotaKabupaten: $kotaKabupaten, kelurahan: $kelurahan, kecamatan: $kecamatan, rtRw: $rtRw, lastMenstrualPeriod: $lastMenstrualPeriod, estimatedDueDate: $estimatedDueDate, usiaKehamilan: $usiaKehamilan, kehamilanKe: $kehamilanKe, jumlahAnak: $jumlahAnak, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, miscarriageNumber: $miscarriageNumber, previousPregnancyComplications: $previousPregnancyComplications, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, riwayatKesehatanIbu: $riwayatKesehatanIbu, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelation: $emergencyContactRelation, age: $age, bloodType: $bloodType, heightCm: $heightCm, prePregnancyWeightKg: $prePregnancyWeightKg, medicalHistory: $medicalHistory, currentMedications: $currentMedications, riskLevel: $riskLevel, healthcarePreference: $healthcarePreference, whatsappConsent: $whatsappConsent, dataSharingConsent: $dataSharingConsent, puskesmasId: $puskesmasId, perawatId: $perawatId, assignmentDate: $assignmentDate, assignmentDistanceKm: $assignmentDistanceKm, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IbuHamilModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.namaLengkap, namaLengkap) ||
                other.namaLengkap == namaLengkap) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.provinsi, provinsi) ||
                other.provinsi == provinsi) &&
            (identical(other.kotaKabupaten, kotaKabupaten) ||
                other.kotaKabupaten == kotaKabupaten) &&
            (identical(other.kelurahan, kelurahan) ||
                other.kelurahan == kelurahan) &&
            (identical(other.kecamatan, kecamatan) ||
                other.kecamatan == kecamatan) &&
            (identical(other.rtRw, rtRw) || other.rtRw == rtRw) &&
            (identical(other.lastMenstrualPeriod, lastMenstrualPeriod) ||
                other.lastMenstrualPeriod == lastMenstrualPeriod) &&
            (identical(other.estimatedDueDate, estimatedDueDate) ||
                other.estimatedDueDate == estimatedDueDate) &&
            (identical(other.usiaKehamilan, usiaKehamilan) ||
                other.usiaKehamilan == usiaKehamilan) &&
            (identical(other.kehamilanKe, kehamilanKe) ||
                other.kehamilanKe == kehamilanKe) &&
            (identical(other.jumlahAnak, jumlahAnak) ||
                other.jumlahAnak == jumlahAnak) &&
            (identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) ||
                other.jarakKehamilanTerakhir == jarakKehamilanTerakhir) &&
            (identical(other.miscarriageNumber, miscarriageNumber) ||
                other.miscarriageNumber == miscarriageNumber) &&
            (identical(
                  other.previousPregnancyComplications,
                  previousPregnancyComplications,
                ) ||
                other.previousPregnancyComplications ==
                    previousPregnancyComplications) &&
            (identical(other.pernahCaesar, pernahCaesar) ||
                other.pernahCaesar == pernahCaesar) &&
            (identical(
                  other.pernahPerdarahanSaatHamil,
                  pernahPerdarahanSaatHamil,
                ) ||
                other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil) &&
            (identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) ||
                other.riwayatKesehatanIbu == riwayatKesehatanIbu) &&
            (identical(other.emergencyContactName, emergencyContactName) ||
                other.emergencyContactName == emergencyContactName) &&
            (identical(other.emergencyContactPhone, emergencyContactPhone) ||
                other.emergencyContactPhone == emergencyContactPhone) &&
            (identical(
                  other.emergencyContactRelation,
                  emergencyContactRelation,
                ) ||
                other.emergencyContactRelation == emergencyContactRelation) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.prePregnancyWeightKg, prePregnancyWeightKg) ||
                other.prePregnancyWeightKg == prePregnancyWeightKg) &&
            (identical(other.medicalHistory, medicalHistory) ||
                other.medicalHistory == medicalHistory) &&
            (identical(other.currentMedications, currentMedications) ||
                other.currentMedications == currentMedications) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.healthcarePreference, healthcarePreference) ||
                other.healthcarePreference == healthcarePreference) &&
            (identical(other.whatsappConsent, whatsappConsent) ||
                other.whatsappConsent == whatsappConsent) &&
            (identical(other.dataSharingConsent, dataSharingConsent) ||
                other.dataSharingConsent == dataSharingConsent) &&
            (identical(other.puskesmasId, puskesmasId) ||
                other.puskesmasId == puskesmasId) &&
            (identical(other.perawatId, perawatId) ||
                other.perawatId == perawatId) &&
            (identical(other.assignmentDate, assignmentDate) ||
                other.assignmentDate == assignmentDate) &&
            (identical(other.assignmentDistanceKm, assignmentDistanceKm) ||
                other.assignmentDistanceKm == assignmentDistanceKm) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
    userId,
    namaLengkap,
    nik,
    dateOfBirth,
    profilePhotoUrl,
    address,
    location,
    provinsi,
    kotaKabupaten,
    kelurahan,
    kecamatan,
    rtRw,
    lastMenstrualPeriod,
    estimatedDueDate,
    usiaKehamilan,
    kehamilanKe,
    jumlahAnak,
    jarakKehamilanTerakhir,
    miscarriageNumber,
    previousPregnancyComplications,
    pernahCaesar,
    pernahPerdarahanSaatHamil,
    riwayatKesehatanIbu,
    emergencyContactName,
    emergencyContactPhone,
    emergencyContactRelation,
    age,
    bloodType,
    heightCm,
    prePregnancyWeightKg,
    medicalHistory,
    currentMedications,
    riskLevel,
    healthcarePreference,
    whatsappConsent,
    dataSharingConsent,
    puskesmasId,
    perawatId,
    assignmentDate,
    assignmentDistanceKm,
    isActive,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of IbuHamilModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IbuHamilModelImplCopyWith<_$IbuHamilModelImpl> get copyWith =>
      __$$IbuHamilModelImplCopyWithImpl<_$IbuHamilModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IbuHamilModelImplToJson(this);
  }
}

abstract class _IbuHamilModel implements IbuHamilModel {
  const factory _IbuHamilModel({
    required final int id,
    @JsonKey(name: 'user_id') required final int userId,
    @JsonKey(name: 'nama_lengkap') required final String namaLengkap,
    required final String nik,
    @JsonKey(name: 'date_of_birth') required final DateTime dateOfBirth,
    @JsonKey(name: 'profile_photo_url') final String? profilePhotoUrl,
    required final String address,
    required final Location location,
    final String? provinsi,
    @JsonKey(name: 'kota_kabupaten') final String? kotaKabupaten,
    final String? kelurahan,
    final String? kecamatan,
    @JsonKey(name: 'rt_rw') final String? rtRw,
    @JsonKey(name: 'last_menstrual_period') final DateTime? lastMenstrualPeriod,
    @JsonKey(name: 'estimated_due_date') final DateTime? estimatedDueDate,
    @JsonKey(name: 'usia_kehamilan') final int? usiaKehamilan,
    @JsonKey(name: 'kehamilan_ke') final int? kehamilanKe,
    @JsonKey(name: 'jumlah_anak') final int? jumlahAnak,
    @JsonKey(name: 'jarak_kehamilan_terakhir')
    final String? jarakKehamilanTerakhir,
    @JsonKey(name: 'miscarriage_number') final int? miscarriageNumber,
    @JsonKey(name: 'previous_pregnancy_complications')
    final String? previousPregnancyComplications,
    @JsonKey(name: 'pernah_caesar') final bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    final bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'riwayat_kesehatan_ibu')
    required final RiwayatKesehatanIbuModel riwayatKesehatanIbu,
    @JsonKey(name: 'emergency_contact_name')
    required final String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone')
    required final String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation')
    final String? emergencyContactRelation,
    final int? age,
    @JsonKey(name: 'blood_type') final String? bloodType,
    @JsonKey(name: 'height_cm') final double? heightCm,
    @JsonKey(name: 'pre_pregnancy_weight_kg')
    final double? prePregnancyWeightKg,
    @JsonKey(name: 'medical_history') final String? medicalHistory,
    @JsonKey(name: 'current_medications') final String? currentMedications,
    @JsonKey(name: 'risk_level') final String? riskLevel,
    @JsonKey(name: 'healthcare_preference') final String? healthcarePreference,
    @JsonKey(name: 'whatsapp_consent') final bool whatsappConsent,
    @JsonKey(name: 'data_sharing_consent') final bool dataSharingConsent,
    @JsonKey(name: 'puskesmas_id') final int? puskesmasId,
    @JsonKey(name: 'perawat_id') final int? perawatId,
    @JsonKey(name: 'assignment_date') final DateTime? assignmentDate,
    @JsonKey(name: 'assignment_distance_km') final double? assignmentDistanceKm,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$IbuHamilModelImpl;

  factory _IbuHamilModel.fromJson(Map<String, dynamic> json) =
      _$IbuHamilModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap;
  @override
  String get nik; // 16 digit
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime get dateOfBirth;
  @override
  @JsonKey(name: 'profile_photo_url')
  String? get profilePhotoUrl; // Alamat & Lokasi
  @override
  String get address;
  @override
  Location get location; // longitude & latitude
  @override
  String? get provinsi;
  @override
  @JsonKey(name: 'kota_kabupaten')
  String? get kotaKabupaten;
  @override
  String? get kelurahan;
  @override
  String? get kecamatan;
  @override
  @JsonKey(name: 'rt_rw')
  String? get rtRw; // Data Kehamilan
  @override
  @JsonKey(name: 'last_menstrual_period')
  DateTime? get lastMenstrualPeriod; // HPHT
  @override
  @JsonKey(name: 'estimated_due_date')
  DateTime? get estimatedDueDate; // HPL
  @override
  @JsonKey(name: 'usia_kehamilan')
  int? get usiaKehamilan; // minggu
  @override
  @JsonKey(name: 'kehamilan_ke')
  int? get kehamilanKe;
  @override
  @JsonKey(name: 'jumlah_anak')
  int? get jumlahAnak;
  @override
  @JsonKey(name: 'jarak_kehamilan_terakhir')
  String? get jarakKehamilanTerakhir;
  @override
  @JsonKey(name: 'miscarriage_number')
  int? get miscarriageNumber;
  @override
  @JsonKey(name: 'previous_pregnancy_complications')
  String? get previousPregnancyComplications;
  @override
  @JsonKey(name: 'pernah_caesar')
  bool get pernahCaesar;
  @override
  @JsonKey(name: 'pernah_perdarahan_saat_hamil')
  bool get pernahPerdarahanSaatHamil; // Riwayat Kesehatan (nested object)
  @override
  @JsonKey(name: 'riwayat_kesehatan_ibu')
  RiwayatKesehatanIbuModel get riwayatKesehatanIbu; // Kontak Darurat
  @override
  @JsonKey(name: 'emergency_contact_name')
  String get emergencyContactName;
  @override
  @JsonKey(name: 'emergency_contact_phone')
  String get emergencyContactPhone;
  @override
  @JsonKey(name: 'emergency_contact_relation')
  String? get emergencyContactRelation; // Data Tambahan
  @override
  int? get age;
  @override
  @JsonKey(name: 'blood_type')
  String? get bloodType;
  @override
  @JsonKey(name: 'height_cm')
  double? get heightCm;
  @override
  @JsonKey(name: 'pre_pregnancy_weight_kg')
  double? get prePregnancyWeightKg;
  @override
  @JsonKey(name: 'medical_history')
  String? get medicalHistory;
  @override
  @JsonKey(name: 'current_medications')
  String? get currentMedications;
  @override
  @JsonKey(name: 'risk_level')
  String? get riskLevel; // 'low', 'normal', 'high'
  @override
  @JsonKey(name: 'healthcare_preference')
  String? get healthcarePreference;
  @override
  @JsonKey(name: 'whatsapp_consent')
  bool get whatsappConsent;
  @override
  @JsonKey(name: 'data_sharing_consent')
  bool get dataSharingConsent; // Assignment (opsional untuk mobile)
  @override
  @JsonKey(name: 'puskesmas_id')
  int? get puskesmasId;
  @override
  @JsonKey(name: 'perawat_id')
  int? get perawatId;
  @override
  @JsonKey(name: 'assignment_date')
  DateTime? get assignmentDate;
  @override
  @JsonKey(name: 'assignment_distance_km')
  double? get assignmentDistanceKm;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of IbuHamilModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IbuHamilModelImplCopyWith<_$IbuHamilModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
