// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_ibu_hamil_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterIbuHamilRequestModel _$RegisterIbuHamilRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _RegisterIbuHamilRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterIbuHamilRequestModel {
  @JsonKey(name: 'ibu_hamil')
  IbuHamilData get ibuHamil => throw _privateConstructorUsedError;
  UserData get user => throw _privateConstructorUsedError;

  /// Serializes this RegisterIbuHamilRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterIbuHamilRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterIbuHamilRequestModelCopyWith<RegisterIbuHamilRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterIbuHamilRequestModelCopyWith<$Res> {
  factory $RegisterIbuHamilRequestModelCopyWith(
    RegisterIbuHamilRequestModel value,
    $Res Function(RegisterIbuHamilRequestModel) then,
  ) =
      _$RegisterIbuHamilRequestModelCopyWithImpl<
        $Res,
        RegisterIbuHamilRequestModel
      >;
  @useResult
  $Res call({@JsonKey(name: 'ibu_hamil') IbuHamilData ibuHamil, UserData user});

  $IbuHamilDataCopyWith<$Res> get ibuHamil;
  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class _$RegisterIbuHamilRequestModelCopyWithImpl<
  $Res,
  $Val extends RegisterIbuHamilRequestModel
>
    implements $RegisterIbuHamilRequestModelCopyWith<$Res> {
  _$RegisterIbuHamilRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterIbuHamilRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ibuHamil = null, Object? user = null}) {
    return _then(
      _value.copyWith(
            ibuHamil: null == ibuHamil
                ? _value.ibuHamil
                : ibuHamil // ignore: cast_nullable_to_non_nullable
                      as IbuHamilData,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserData,
          )
          as $Val,
    );
  }

  /// Create a copy of RegisterIbuHamilRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IbuHamilDataCopyWith<$Res> get ibuHamil {
    return $IbuHamilDataCopyWith<$Res>(_value.ibuHamil, (value) {
      return _then(_value.copyWith(ibuHamil: value) as $Val);
    });
  }

  /// Create a copy of RegisterIbuHamilRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterIbuHamilRequestModelImplCopyWith<$Res>
    implements $RegisterIbuHamilRequestModelCopyWith<$Res> {
  factory _$$RegisterIbuHamilRequestModelImplCopyWith(
    _$RegisterIbuHamilRequestModelImpl value,
    $Res Function(_$RegisterIbuHamilRequestModelImpl) then,
  ) = __$$RegisterIbuHamilRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'ibu_hamil') IbuHamilData ibuHamil, UserData user});

  @override
  $IbuHamilDataCopyWith<$Res> get ibuHamil;
  @override
  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class __$$RegisterIbuHamilRequestModelImplCopyWithImpl<$Res>
    extends
        _$RegisterIbuHamilRequestModelCopyWithImpl<
          $Res,
          _$RegisterIbuHamilRequestModelImpl
        >
    implements _$$RegisterIbuHamilRequestModelImplCopyWith<$Res> {
  __$$RegisterIbuHamilRequestModelImplCopyWithImpl(
    _$RegisterIbuHamilRequestModelImpl _value,
    $Res Function(_$RegisterIbuHamilRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterIbuHamilRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ibuHamil = null, Object? user = null}) {
    return _then(
      _$RegisterIbuHamilRequestModelImpl(
        ibuHamil: null == ibuHamil
            ? _value.ibuHamil
            : ibuHamil // ignore: cast_nullable_to_non_nullable
                  as IbuHamilData,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterIbuHamilRequestModelImpl
    implements _RegisterIbuHamilRequestModel {
  const _$RegisterIbuHamilRequestModelImpl({
    @JsonKey(name: 'ibu_hamil') required this.ibuHamil,
    required this.user,
  });

  factory _$RegisterIbuHamilRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RegisterIbuHamilRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'ibu_hamil')
  final IbuHamilData ibuHamil;
  @override
  final UserData user;

  @override
  String toString() {
    return 'RegisterIbuHamilRequestModel(ibuHamil: $ibuHamil, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterIbuHamilRequestModelImpl &&
            (identical(other.ibuHamil, ibuHamil) ||
                other.ibuHamil == ibuHamil) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ibuHamil, user);

  /// Create a copy of RegisterIbuHamilRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterIbuHamilRequestModelImplCopyWith<
    _$RegisterIbuHamilRequestModelImpl
  >
  get copyWith =>
      __$$RegisterIbuHamilRequestModelImplCopyWithImpl<
        _$RegisterIbuHamilRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterIbuHamilRequestModelImplToJson(this);
  }
}

abstract class _RegisterIbuHamilRequestModel
    implements RegisterIbuHamilRequestModel {
  const factory _RegisterIbuHamilRequestModel({
    @JsonKey(name: 'ibu_hamil') required final IbuHamilData ibuHamil,
    required final UserData user,
  }) = _$RegisterIbuHamilRequestModelImpl;

  factory _RegisterIbuHamilRequestModel.fromJson(Map<String, dynamic> json) =
      _$RegisterIbuHamilRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'ibu_hamil')
  IbuHamilData get ibuHamil;
  @override
  UserData get user;

  /// Create a copy of RegisterIbuHamilRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterIbuHamilRequestModelImplCopyWith<
    _$RegisterIbuHamilRequestModelImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

IbuHamilData _$IbuHamilDataFromJson(Map<String, dynamic> json) {
  return _IbuHamilData.fromJson(json);
}

/// @nodoc
mixin _$IbuHamilData {
  String get address => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_type')
  String? get bloodType => throw _privateConstructorUsedError;
  @JsonKey(name: 'data_sharing_consent')
  bool get dataSharingConsent => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_contact_name')
  String get emergencyContactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_contact_phone')
  String get emergencyContactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_contact_relation')
  String? get emergencyContactRelation => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_due_date')
  String? get estimatedDueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'healthcare_preference')
  String? get healthcarePreference => throw _privateConstructorUsedError;
  @JsonKey(name: 'jarak_kehamilan_terakhir')
  String? get jarakKehamilanTerakhir => throw _privateConstructorUsedError;
  @JsonKey(name: 'jumlah_anak')
  int? get jumlahAnak => throw _privateConstructorUsedError;
  String get kecamatan => throw _privateConstructorUsedError;
  @JsonKey(name: 'kehamilan_ke')
  int? get kehamilanKe => throw _privateConstructorUsedError;
  String? get kelurahan => throw _privateConstructorUsedError;
  @JsonKey(name: 'kota_kabupaten')
  String get kotaKabupaten => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_menstrual_period')
  String? get lastMenstrualPeriod => throw _privateConstructorUsedError;
  List<double> get location =>
      throw _privateConstructorUsedError; // [longitude, latitude]
  @JsonKey(name: 'miscarriage_number')
  int get miscarriageNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap => throw _privateConstructorUsedError;
  String get nik => throw _privateConstructorUsedError;
  @JsonKey(name: 'pernah_caesar')
  bool get pernahCaesar => throw _privateConstructorUsedError;
  @JsonKey(name: 'pernah_perdarahan_saat_hamil')
  bool get pernahPerdarahanSaatHamil => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_pregnancy_complications')
  String? get previousPregnancyComplications =>
      throw _privateConstructorUsedError;
  String get provinsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'risk_level')
  String? get riskLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'riwayat_kesehatan_ibu')
  RiwayatKesehatanIbuData get riwayatKesehatanIbu =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'usia_kehamilan')
  int? get usiaKehamilan => throw _privateConstructorUsedError;
  @JsonKey(name: 'whatsapp_consent')
  bool get whatsappConsent => throw _privateConstructorUsedError;

  /// Serializes this IbuHamilData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IbuHamilData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IbuHamilDataCopyWith<IbuHamilData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IbuHamilDataCopyWith<$Res> {
  factory $IbuHamilDataCopyWith(
    IbuHamilData value,
    $Res Function(IbuHamilData) then,
  ) = _$IbuHamilDataCopyWithImpl<$Res, IbuHamilData>;
  @useResult
  $Res call({
    String address,
    int? age,
    @JsonKey(name: 'blood_type') String? bloodType,
    @JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,
    @JsonKey(name: 'date_of_birth') String dateOfBirth,
    @JsonKey(name: 'emergency_contact_name') String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation')
    String? emergencyContactRelation,
    @JsonKey(name: 'estimated_due_date') String? estimatedDueDate,
    @JsonKey(name: 'healthcare_preference') String? healthcarePreference,
    @JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,
    @JsonKey(name: 'jumlah_anak') int? jumlahAnak,
    String kecamatan,
    @JsonKey(name: 'kehamilan_ke') int? kehamilanKe,
    String? kelurahan,
    @JsonKey(name: 'kota_kabupaten') String kotaKabupaten,
    @JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod,
    List<double> location,
    @JsonKey(name: 'miscarriage_number') int miscarriageNumber,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String nik,
    @JsonKey(name: 'pernah_caesar') bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'previous_pregnancy_complications')
    String? previousPregnancyComplications,
    String provinsi,
    @JsonKey(name: 'risk_level') String? riskLevel,
    @JsonKey(name: 'riwayat_kesehatan_ibu')
    RiwayatKesehatanIbuData riwayatKesehatanIbu,
    @JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,
    @JsonKey(name: 'whatsapp_consent') bool whatsappConsent,
  });

  $RiwayatKesehatanIbuDataCopyWith<$Res> get riwayatKesehatanIbu;
}

/// @nodoc
class _$IbuHamilDataCopyWithImpl<$Res, $Val extends IbuHamilData>
    implements $IbuHamilDataCopyWith<$Res> {
  _$IbuHamilDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IbuHamilData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? dataSharingConsent = null,
    Object? dateOfBirth = null,
    Object? emergencyContactName = null,
    Object? emergencyContactPhone = null,
    Object? emergencyContactRelation = freezed,
    Object? estimatedDueDate = freezed,
    Object? healthcarePreference = freezed,
    Object? jarakKehamilanTerakhir = freezed,
    Object? jumlahAnak = freezed,
    Object? kecamatan = null,
    Object? kehamilanKe = freezed,
    Object? kelurahan = freezed,
    Object? kotaKabupaten = null,
    Object? lastMenstrualPeriod = freezed,
    Object? location = null,
    Object? miscarriageNumber = null,
    Object? namaLengkap = null,
    Object? nik = null,
    Object? pernahCaesar = null,
    Object? pernahPerdarahanSaatHamil = null,
    Object? previousPregnancyComplications = freezed,
    Object? provinsi = null,
    Object? riskLevel = freezed,
    Object? riwayatKesehatanIbu = null,
    Object? usiaKehamilan = freezed,
    Object? whatsappConsent = null,
  }) {
    return _then(
      _value.copyWith(
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            bloodType: freezed == bloodType
                ? _value.bloodType
                : bloodType // ignore: cast_nullable_to_non_nullable
                      as String?,
            dataSharingConsent: null == dataSharingConsent
                ? _value.dataSharingConsent
                : dataSharingConsent // ignore: cast_nullable_to_non_nullable
                      as bool,
            dateOfBirth: null == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String,
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
            estimatedDueDate: freezed == estimatedDueDate
                ? _value.estimatedDueDate
                : estimatedDueDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            healthcarePreference: freezed == healthcarePreference
                ? _value.healthcarePreference
                : healthcarePreference // ignore: cast_nullable_to_non_nullable
                      as String?,
            jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir
                ? _value.jarakKehamilanTerakhir
                : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
                      as String?,
            jumlahAnak: freezed == jumlahAnak
                ? _value.jumlahAnak
                : jumlahAnak // ignore: cast_nullable_to_non_nullable
                      as int?,
            kecamatan: null == kecamatan
                ? _value.kecamatan
                : kecamatan // ignore: cast_nullable_to_non_nullable
                      as String,
            kehamilanKe: freezed == kehamilanKe
                ? _value.kehamilanKe
                : kehamilanKe // ignore: cast_nullable_to_non_nullable
                      as int?,
            kelurahan: freezed == kelurahan
                ? _value.kelurahan
                : kelurahan // ignore: cast_nullable_to_non_nullable
                      as String?,
            kotaKabupaten: null == kotaKabupaten
                ? _value.kotaKabupaten
                : kotaKabupaten // ignore: cast_nullable_to_non_nullable
                      as String,
            lastMenstrualPeriod: freezed == lastMenstrualPeriod
                ? _value.lastMenstrualPeriod
                : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            miscarriageNumber: null == miscarriageNumber
                ? _value.miscarriageNumber
                : miscarriageNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            namaLengkap: null == namaLengkap
                ? _value.namaLengkap
                : namaLengkap // ignore: cast_nullable_to_non_nullable
                      as String,
            nik: null == nik
                ? _value.nik
                : nik // ignore: cast_nullable_to_non_nullable
                      as String,
            pernahCaesar: null == pernahCaesar
                ? _value.pernahCaesar
                : pernahCaesar // ignore: cast_nullable_to_non_nullable
                      as bool,
            pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil
                ? _value.pernahPerdarahanSaatHamil
                : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
                      as bool,
            previousPregnancyComplications:
                freezed == previousPregnancyComplications
                ? _value.previousPregnancyComplications
                : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinsi: null == provinsi
                ? _value.provinsi
                : provinsi // ignore: cast_nullable_to_non_nullable
                      as String,
            riskLevel: freezed == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            riwayatKesehatanIbu: null == riwayatKesehatanIbu
                ? _value.riwayatKesehatanIbu
                : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
                      as RiwayatKesehatanIbuData,
            usiaKehamilan: freezed == usiaKehamilan
                ? _value.usiaKehamilan
                : usiaKehamilan // ignore: cast_nullable_to_non_nullable
                      as int?,
            whatsappConsent: null == whatsappConsent
                ? _value.whatsappConsent
                : whatsappConsent // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of IbuHamilData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RiwayatKesehatanIbuDataCopyWith<$Res> get riwayatKesehatanIbu {
    return $RiwayatKesehatanIbuDataCopyWith<$Res>(_value.riwayatKesehatanIbu, (
      value,
    ) {
      return _then(_value.copyWith(riwayatKesehatanIbu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IbuHamilDataImplCopyWith<$Res>
    implements $IbuHamilDataCopyWith<$Res> {
  factory _$$IbuHamilDataImplCopyWith(
    _$IbuHamilDataImpl value,
    $Res Function(_$IbuHamilDataImpl) then,
  ) = __$$IbuHamilDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String address,
    int? age,
    @JsonKey(name: 'blood_type') String? bloodType,
    @JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,
    @JsonKey(name: 'date_of_birth') String dateOfBirth,
    @JsonKey(name: 'emergency_contact_name') String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation')
    String? emergencyContactRelation,
    @JsonKey(name: 'estimated_due_date') String? estimatedDueDate,
    @JsonKey(name: 'healthcare_preference') String? healthcarePreference,
    @JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,
    @JsonKey(name: 'jumlah_anak') int? jumlahAnak,
    String kecamatan,
    @JsonKey(name: 'kehamilan_ke') int? kehamilanKe,
    String? kelurahan,
    @JsonKey(name: 'kota_kabupaten') String kotaKabupaten,
    @JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod,
    List<double> location,
    @JsonKey(name: 'miscarriage_number') int miscarriageNumber,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String nik,
    @JsonKey(name: 'pernah_caesar') bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'previous_pregnancy_complications')
    String? previousPregnancyComplications,
    String provinsi,
    @JsonKey(name: 'risk_level') String? riskLevel,
    @JsonKey(name: 'riwayat_kesehatan_ibu')
    RiwayatKesehatanIbuData riwayatKesehatanIbu,
    @JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,
    @JsonKey(name: 'whatsapp_consent') bool whatsappConsent,
  });

  @override
  $RiwayatKesehatanIbuDataCopyWith<$Res> get riwayatKesehatanIbu;
}

/// @nodoc
class __$$IbuHamilDataImplCopyWithImpl<$Res>
    extends _$IbuHamilDataCopyWithImpl<$Res, _$IbuHamilDataImpl>
    implements _$$IbuHamilDataImplCopyWith<$Res> {
  __$$IbuHamilDataImplCopyWithImpl(
    _$IbuHamilDataImpl _value,
    $Res Function(_$IbuHamilDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IbuHamilData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? dataSharingConsent = null,
    Object? dateOfBirth = null,
    Object? emergencyContactName = null,
    Object? emergencyContactPhone = null,
    Object? emergencyContactRelation = freezed,
    Object? estimatedDueDate = freezed,
    Object? healthcarePreference = freezed,
    Object? jarakKehamilanTerakhir = freezed,
    Object? jumlahAnak = freezed,
    Object? kecamatan = null,
    Object? kehamilanKe = freezed,
    Object? kelurahan = freezed,
    Object? kotaKabupaten = null,
    Object? lastMenstrualPeriod = freezed,
    Object? location = null,
    Object? miscarriageNumber = null,
    Object? namaLengkap = null,
    Object? nik = null,
    Object? pernahCaesar = null,
    Object? pernahPerdarahanSaatHamil = null,
    Object? previousPregnancyComplications = freezed,
    Object? provinsi = null,
    Object? riskLevel = freezed,
    Object? riwayatKesehatanIbu = null,
    Object? usiaKehamilan = freezed,
    Object? whatsappConsent = null,
  }) {
    return _then(
      _$IbuHamilDataImpl(
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        bloodType: freezed == bloodType
            ? _value.bloodType
            : bloodType // ignore: cast_nullable_to_non_nullable
                  as String?,
        dataSharingConsent: null == dataSharingConsent
            ? _value.dataSharingConsent
            : dataSharingConsent // ignore: cast_nullable_to_non_nullable
                  as bool,
        dateOfBirth: null == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String,
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
        estimatedDueDate: freezed == estimatedDueDate
            ? _value.estimatedDueDate
            : estimatedDueDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        healthcarePreference: freezed == healthcarePreference
            ? _value.healthcarePreference
            : healthcarePreference // ignore: cast_nullable_to_non_nullable
                  as String?,
        jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir
            ? _value.jarakKehamilanTerakhir
            : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
                  as String?,
        jumlahAnak: freezed == jumlahAnak
            ? _value.jumlahAnak
            : jumlahAnak // ignore: cast_nullable_to_non_nullable
                  as int?,
        kecamatan: null == kecamatan
            ? _value.kecamatan
            : kecamatan // ignore: cast_nullable_to_non_nullable
                  as String,
        kehamilanKe: freezed == kehamilanKe
            ? _value.kehamilanKe
            : kehamilanKe // ignore: cast_nullable_to_non_nullable
                  as int?,
        kelurahan: freezed == kelurahan
            ? _value.kelurahan
            : kelurahan // ignore: cast_nullable_to_non_nullable
                  as String?,
        kotaKabupaten: null == kotaKabupaten
            ? _value.kotaKabupaten
            : kotaKabupaten // ignore: cast_nullable_to_non_nullable
                  as String,
        lastMenstrualPeriod: freezed == lastMenstrualPeriod
            ? _value.lastMenstrualPeriod
            : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: null == location
            ? _value._location
            : location // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        miscarriageNumber: null == miscarriageNumber
            ? _value.miscarriageNumber
            : miscarriageNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        namaLengkap: null == namaLengkap
            ? _value.namaLengkap
            : namaLengkap // ignore: cast_nullable_to_non_nullable
                  as String,
        nik: null == nik
            ? _value.nik
            : nik // ignore: cast_nullable_to_non_nullable
                  as String,
        pernahCaesar: null == pernahCaesar
            ? _value.pernahCaesar
            : pernahCaesar // ignore: cast_nullable_to_non_nullable
                  as bool,
        pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil
            ? _value.pernahPerdarahanSaatHamil
            : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
                  as bool,
        previousPregnancyComplications:
            freezed == previousPregnancyComplications
            ? _value.previousPregnancyComplications
            : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinsi: null == provinsi
            ? _value.provinsi
            : provinsi // ignore: cast_nullable_to_non_nullable
                  as String,
        riskLevel: freezed == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        riwayatKesehatanIbu: null == riwayatKesehatanIbu
            ? _value.riwayatKesehatanIbu
            : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
                  as RiwayatKesehatanIbuData,
        usiaKehamilan: freezed == usiaKehamilan
            ? _value.usiaKehamilan
            : usiaKehamilan // ignore: cast_nullable_to_non_nullable
                  as int?,
        whatsappConsent: null == whatsappConsent
            ? _value.whatsappConsent
            : whatsappConsent // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IbuHamilDataImpl implements _IbuHamilData {
  const _$IbuHamilDataImpl({
    required this.address,
    this.age,
    @JsonKey(name: 'blood_type') this.bloodType,
    @JsonKey(name: 'data_sharing_consent') this.dataSharingConsent = false,
    @JsonKey(name: 'date_of_birth') required this.dateOfBirth,
    @JsonKey(name: 'emergency_contact_name') required this.emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone')
    required this.emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation') this.emergencyContactRelation,
    @JsonKey(name: 'estimated_due_date') this.estimatedDueDate,
    @JsonKey(name: 'healthcare_preference') this.healthcarePreference,
    @JsonKey(name: 'jarak_kehamilan_terakhir') this.jarakKehamilanTerakhir,
    @JsonKey(name: 'jumlah_anak') this.jumlahAnak,
    required this.kecamatan,
    @JsonKey(name: 'kehamilan_ke') this.kehamilanKe,
    this.kelurahan,
    @JsonKey(name: 'kota_kabupaten') required this.kotaKabupaten,
    @JsonKey(name: 'last_menstrual_period') this.lastMenstrualPeriod,
    required final List<double> location,
    @JsonKey(name: 'miscarriage_number') this.miscarriageNumber = 0,
    @JsonKey(name: 'nama_lengkap') required this.namaLengkap,
    required this.nik,
    @JsonKey(name: 'pernah_caesar') this.pernahCaesar = false,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    this.pernahPerdarahanSaatHamil = false,
    @JsonKey(name: 'previous_pregnancy_complications')
    this.previousPregnancyComplications,
    required this.provinsi,
    @JsonKey(name: 'risk_level') this.riskLevel,
    @JsonKey(name: 'riwayat_kesehatan_ibu') required this.riwayatKesehatanIbu,
    @JsonKey(name: 'usia_kehamilan') this.usiaKehamilan,
    @JsonKey(name: 'whatsapp_consent') this.whatsappConsent = false,
  }) : _location = location;

  factory _$IbuHamilDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IbuHamilDataImplFromJson(json);

  @override
  final String address;
  @override
  final int? age;
  @override
  @JsonKey(name: 'blood_type')
  final String? bloodType;
  @override
  @JsonKey(name: 'data_sharing_consent')
  final bool dataSharingConsent;
  @override
  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;
  @override
  @JsonKey(name: 'emergency_contact_name')
  final String emergencyContactName;
  @override
  @JsonKey(name: 'emergency_contact_phone')
  final String emergencyContactPhone;
  @override
  @JsonKey(name: 'emergency_contact_relation')
  final String? emergencyContactRelation;
  @override
  @JsonKey(name: 'estimated_due_date')
  final String? estimatedDueDate;
  @override
  @JsonKey(name: 'healthcare_preference')
  final String? healthcarePreference;
  @override
  @JsonKey(name: 'jarak_kehamilan_terakhir')
  final String? jarakKehamilanTerakhir;
  @override
  @JsonKey(name: 'jumlah_anak')
  final int? jumlahAnak;
  @override
  final String kecamatan;
  @override
  @JsonKey(name: 'kehamilan_ke')
  final int? kehamilanKe;
  @override
  final String? kelurahan;
  @override
  @JsonKey(name: 'kota_kabupaten')
  final String kotaKabupaten;
  @override
  @JsonKey(name: 'last_menstrual_period')
  final String? lastMenstrualPeriod;
  final List<double> _location;
  @override
  List<double> get location {
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_location);
  }

  // [longitude, latitude]
  @override
  @JsonKey(name: 'miscarriage_number')
  final int miscarriageNumber;
  @override
  @JsonKey(name: 'nama_lengkap')
  final String namaLengkap;
  @override
  final String nik;
  @override
  @JsonKey(name: 'pernah_caesar')
  final bool pernahCaesar;
  @override
  @JsonKey(name: 'pernah_perdarahan_saat_hamil')
  final bool pernahPerdarahanSaatHamil;
  @override
  @JsonKey(name: 'previous_pregnancy_complications')
  final String? previousPregnancyComplications;
  @override
  final String provinsi;
  @override
  @JsonKey(name: 'risk_level')
  final String? riskLevel;
  @override
  @JsonKey(name: 'riwayat_kesehatan_ibu')
  final RiwayatKesehatanIbuData riwayatKesehatanIbu;
  @override
  @JsonKey(name: 'usia_kehamilan')
  final int? usiaKehamilan;
  @override
  @JsonKey(name: 'whatsapp_consent')
  final bool whatsappConsent;

  @override
  String toString() {
    return 'IbuHamilData(address: $address, age: $age, bloodType: $bloodType, dataSharingConsent: $dataSharingConsent, dateOfBirth: $dateOfBirth, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelation: $emergencyContactRelation, estimatedDueDate: $estimatedDueDate, healthcarePreference: $healthcarePreference, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, jumlahAnak: $jumlahAnak, kecamatan: $kecamatan, kehamilanKe: $kehamilanKe, kelurahan: $kelurahan, kotaKabupaten: $kotaKabupaten, lastMenstrualPeriod: $lastMenstrualPeriod, location: $location, miscarriageNumber: $miscarriageNumber, namaLengkap: $namaLengkap, nik: $nik, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, previousPregnancyComplications: $previousPregnancyComplications, provinsi: $provinsi, riskLevel: $riskLevel, riwayatKesehatanIbu: $riwayatKesehatanIbu, usiaKehamilan: $usiaKehamilan, whatsappConsent: $whatsappConsent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IbuHamilDataImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.dataSharingConsent, dataSharingConsent) ||
                other.dataSharingConsent == dataSharingConsent) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.emergencyContactName, emergencyContactName) ||
                other.emergencyContactName == emergencyContactName) &&
            (identical(other.emergencyContactPhone, emergencyContactPhone) ||
                other.emergencyContactPhone == emergencyContactPhone) &&
            (identical(
                  other.emergencyContactRelation,
                  emergencyContactRelation,
                ) ||
                other.emergencyContactRelation == emergencyContactRelation) &&
            (identical(other.estimatedDueDate, estimatedDueDate) ||
                other.estimatedDueDate == estimatedDueDate) &&
            (identical(other.healthcarePreference, healthcarePreference) ||
                other.healthcarePreference == healthcarePreference) &&
            (identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) ||
                other.jarakKehamilanTerakhir == jarakKehamilanTerakhir) &&
            (identical(other.jumlahAnak, jumlahAnak) ||
                other.jumlahAnak == jumlahAnak) &&
            (identical(other.kecamatan, kecamatan) ||
                other.kecamatan == kecamatan) &&
            (identical(other.kehamilanKe, kehamilanKe) ||
                other.kehamilanKe == kehamilanKe) &&
            (identical(other.kelurahan, kelurahan) ||
                other.kelurahan == kelurahan) &&
            (identical(other.kotaKabupaten, kotaKabupaten) ||
                other.kotaKabupaten == kotaKabupaten) &&
            (identical(other.lastMenstrualPeriod, lastMenstrualPeriod) ||
                other.lastMenstrualPeriod == lastMenstrualPeriod) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.miscarriageNumber, miscarriageNumber) ||
                other.miscarriageNumber == miscarriageNumber) &&
            (identical(other.namaLengkap, namaLengkap) ||
                other.namaLengkap == namaLengkap) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.pernahCaesar, pernahCaesar) ||
                other.pernahCaesar == pernahCaesar) &&
            (identical(
                  other.pernahPerdarahanSaatHamil,
                  pernahPerdarahanSaatHamil,
                ) ||
                other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil) &&
            (identical(
                  other.previousPregnancyComplications,
                  previousPregnancyComplications,
                ) ||
                other.previousPregnancyComplications ==
                    previousPregnancyComplications) &&
            (identical(other.provinsi, provinsi) ||
                other.provinsi == provinsi) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) ||
                other.riwayatKesehatanIbu == riwayatKesehatanIbu) &&
            (identical(other.usiaKehamilan, usiaKehamilan) ||
                other.usiaKehamilan == usiaKehamilan) &&
            (identical(other.whatsappConsent, whatsappConsent) ||
                other.whatsappConsent == whatsappConsent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    address,
    age,
    bloodType,
    dataSharingConsent,
    dateOfBirth,
    emergencyContactName,
    emergencyContactPhone,
    emergencyContactRelation,
    estimatedDueDate,
    healthcarePreference,
    jarakKehamilanTerakhir,
    jumlahAnak,
    kecamatan,
    kehamilanKe,
    kelurahan,
    kotaKabupaten,
    lastMenstrualPeriod,
    const DeepCollectionEquality().hash(_location),
    miscarriageNumber,
    namaLengkap,
    nik,
    pernahCaesar,
    pernahPerdarahanSaatHamil,
    previousPregnancyComplications,
    provinsi,
    riskLevel,
    riwayatKesehatanIbu,
    usiaKehamilan,
    whatsappConsent,
  ]);

  /// Create a copy of IbuHamilData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IbuHamilDataImplCopyWith<_$IbuHamilDataImpl> get copyWith =>
      __$$IbuHamilDataImplCopyWithImpl<_$IbuHamilDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IbuHamilDataImplToJson(this);
  }
}

abstract class _IbuHamilData implements IbuHamilData {
  const factory _IbuHamilData({
    required final String address,
    final int? age,
    @JsonKey(name: 'blood_type') final String? bloodType,
    @JsonKey(name: 'data_sharing_consent') final bool dataSharingConsent,
    @JsonKey(name: 'date_of_birth') required final String dateOfBirth,
    @JsonKey(name: 'emergency_contact_name')
    required final String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone')
    required final String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation')
    final String? emergencyContactRelation,
    @JsonKey(name: 'estimated_due_date') final String? estimatedDueDate,
    @JsonKey(name: 'healthcare_preference') final String? healthcarePreference,
    @JsonKey(name: 'jarak_kehamilan_terakhir')
    final String? jarakKehamilanTerakhir,
    @JsonKey(name: 'jumlah_anak') final int? jumlahAnak,
    required final String kecamatan,
    @JsonKey(name: 'kehamilan_ke') final int? kehamilanKe,
    final String? kelurahan,
    @JsonKey(name: 'kota_kabupaten') required final String kotaKabupaten,
    @JsonKey(name: 'last_menstrual_period') final String? lastMenstrualPeriod,
    required final List<double> location,
    @JsonKey(name: 'miscarriage_number') final int miscarriageNumber,
    @JsonKey(name: 'nama_lengkap') required final String namaLengkap,
    required final String nik,
    @JsonKey(name: 'pernah_caesar') final bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
    final bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'previous_pregnancy_complications')
    final String? previousPregnancyComplications,
    required final String provinsi,
    @JsonKey(name: 'risk_level') final String? riskLevel,
    @JsonKey(name: 'riwayat_kesehatan_ibu')
    required final RiwayatKesehatanIbuData riwayatKesehatanIbu,
    @JsonKey(name: 'usia_kehamilan') final int? usiaKehamilan,
    @JsonKey(name: 'whatsapp_consent') final bool whatsappConsent,
  }) = _$IbuHamilDataImpl;

  factory _IbuHamilData.fromJson(Map<String, dynamic> json) =
      _$IbuHamilDataImpl.fromJson;

  @override
  String get address;
  @override
  int? get age;
  @override
  @JsonKey(name: 'blood_type')
  String? get bloodType;
  @override
  @JsonKey(name: 'data_sharing_consent')
  bool get dataSharingConsent;
  @override
  @JsonKey(name: 'date_of_birth')
  String get dateOfBirth;
  @override
  @JsonKey(name: 'emergency_contact_name')
  String get emergencyContactName;
  @override
  @JsonKey(name: 'emergency_contact_phone')
  String get emergencyContactPhone;
  @override
  @JsonKey(name: 'emergency_contact_relation')
  String? get emergencyContactRelation;
  @override
  @JsonKey(name: 'estimated_due_date')
  String? get estimatedDueDate;
  @override
  @JsonKey(name: 'healthcare_preference')
  String? get healthcarePreference;
  @override
  @JsonKey(name: 'jarak_kehamilan_terakhir')
  String? get jarakKehamilanTerakhir;
  @override
  @JsonKey(name: 'jumlah_anak')
  int? get jumlahAnak;
  @override
  String get kecamatan;
  @override
  @JsonKey(name: 'kehamilan_ke')
  int? get kehamilanKe;
  @override
  String? get kelurahan;
  @override
  @JsonKey(name: 'kota_kabupaten')
  String get kotaKabupaten;
  @override
  @JsonKey(name: 'last_menstrual_period')
  String? get lastMenstrualPeriod;
  @override
  List<double> get location; // [longitude, latitude]
  @override
  @JsonKey(name: 'miscarriage_number')
  int get miscarriageNumber;
  @override
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap;
  @override
  String get nik;
  @override
  @JsonKey(name: 'pernah_caesar')
  bool get pernahCaesar;
  @override
  @JsonKey(name: 'pernah_perdarahan_saat_hamil')
  bool get pernahPerdarahanSaatHamil;
  @override
  @JsonKey(name: 'previous_pregnancy_complications')
  String? get previousPregnancyComplications;
  @override
  String get provinsi;
  @override
  @JsonKey(name: 'risk_level')
  String? get riskLevel;
  @override
  @JsonKey(name: 'riwayat_kesehatan_ibu')
  RiwayatKesehatanIbuData get riwayatKesehatanIbu;
  @override
  @JsonKey(name: 'usia_kehamilan')
  int? get usiaKehamilan;
  @override
  @JsonKey(name: 'whatsapp_consent')
  bool get whatsappConsent;

  /// Create a copy of IbuHamilData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IbuHamilDataImplCopyWith<_$IbuHamilDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiwayatKesehatanIbuData _$RiwayatKesehatanIbuDataFromJson(
  Map<String, dynamic> json,
) {
  return _RiwayatKesehatanIbuData.fromJson(json);
}

/// @nodoc
mixin _$RiwayatKesehatanIbuData {
  bool get anemia => throw _privateConstructorUsedError;
  bool get asma => throw _privateConstructorUsedError;
  @JsonKey(name: 'darah_tinggi')
  bool get darahTinggi => throw _privateConstructorUsedError;
  bool get diabetes => throw _privateConstructorUsedError;
  @JsonKey(name: 'penyakit_ginjal')
  bool get penyakitGinjal => throw _privateConstructorUsedError;
  @JsonKey(name: 'penyakit_jantung')
  bool get penyakitJantung => throw _privateConstructorUsedError;
  @JsonKey(name: 'tbc_malaria')
  bool get tbcMalaria => throw _privateConstructorUsedError;

  /// Serializes this RiwayatKesehatanIbuData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiwayatKesehatanIbuData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiwayatKesehatanIbuDataCopyWith<RiwayatKesehatanIbuData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiwayatKesehatanIbuDataCopyWith<$Res> {
  factory $RiwayatKesehatanIbuDataCopyWith(
    RiwayatKesehatanIbuData value,
    $Res Function(RiwayatKesehatanIbuData) then,
  ) = _$RiwayatKesehatanIbuDataCopyWithImpl<$Res, RiwayatKesehatanIbuData>;
  @useResult
  $Res call({
    bool anemia,
    bool asma,
    @JsonKey(name: 'darah_tinggi') bool darahTinggi,
    bool diabetes,
    @JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,
    @JsonKey(name: 'penyakit_jantung') bool penyakitJantung,
    @JsonKey(name: 'tbc_malaria') bool tbcMalaria,
  });
}

/// @nodoc
class _$RiwayatKesehatanIbuDataCopyWithImpl<
  $Res,
  $Val extends RiwayatKesehatanIbuData
>
    implements $RiwayatKesehatanIbuDataCopyWith<$Res> {
  _$RiwayatKesehatanIbuDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiwayatKesehatanIbuData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anemia = null,
    Object? asma = null,
    Object? darahTinggi = null,
    Object? diabetes = null,
    Object? penyakitGinjal = null,
    Object? penyakitJantung = null,
    Object? tbcMalaria = null,
  }) {
    return _then(
      _value.copyWith(
            anemia: null == anemia
                ? _value.anemia
                : anemia // ignore: cast_nullable_to_non_nullable
                      as bool,
            asma: null == asma
                ? _value.asma
                : asma // ignore: cast_nullable_to_non_nullable
                      as bool,
            darahTinggi: null == darahTinggi
                ? _value.darahTinggi
                : darahTinggi // ignore: cast_nullable_to_non_nullable
                      as bool,
            diabetes: null == diabetes
                ? _value.diabetes
                : diabetes // ignore: cast_nullable_to_non_nullable
                      as bool,
            penyakitGinjal: null == penyakitGinjal
                ? _value.penyakitGinjal
                : penyakitGinjal // ignore: cast_nullable_to_non_nullable
                      as bool,
            penyakitJantung: null == penyakitJantung
                ? _value.penyakitJantung
                : penyakitJantung // ignore: cast_nullable_to_non_nullable
                      as bool,
            tbcMalaria: null == tbcMalaria
                ? _value.tbcMalaria
                : tbcMalaria // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RiwayatKesehatanIbuDataImplCopyWith<$Res>
    implements $RiwayatKesehatanIbuDataCopyWith<$Res> {
  factory _$$RiwayatKesehatanIbuDataImplCopyWith(
    _$RiwayatKesehatanIbuDataImpl value,
    $Res Function(_$RiwayatKesehatanIbuDataImpl) then,
  ) = __$$RiwayatKesehatanIbuDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool anemia,
    bool asma,
    @JsonKey(name: 'darah_tinggi') bool darahTinggi,
    bool diabetes,
    @JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,
    @JsonKey(name: 'penyakit_jantung') bool penyakitJantung,
    @JsonKey(name: 'tbc_malaria') bool tbcMalaria,
  });
}

/// @nodoc
class __$$RiwayatKesehatanIbuDataImplCopyWithImpl<$Res>
    extends
        _$RiwayatKesehatanIbuDataCopyWithImpl<
          $Res,
          _$RiwayatKesehatanIbuDataImpl
        >
    implements _$$RiwayatKesehatanIbuDataImplCopyWith<$Res> {
  __$$RiwayatKesehatanIbuDataImplCopyWithImpl(
    _$RiwayatKesehatanIbuDataImpl _value,
    $Res Function(_$RiwayatKesehatanIbuDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RiwayatKesehatanIbuData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anemia = null,
    Object? asma = null,
    Object? darahTinggi = null,
    Object? diabetes = null,
    Object? penyakitGinjal = null,
    Object? penyakitJantung = null,
    Object? tbcMalaria = null,
  }) {
    return _then(
      _$RiwayatKesehatanIbuDataImpl(
        anemia: null == anemia
            ? _value.anemia
            : anemia // ignore: cast_nullable_to_non_nullable
                  as bool,
        asma: null == asma
            ? _value.asma
            : asma // ignore: cast_nullable_to_non_nullable
                  as bool,
        darahTinggi: null == darahTinggi
            ? _value.darahTinggi
            : darahTinggi // ignore: cast_nullable_to_non_nullable
                  as bool,
        diabetes: null == diabetes
            ? _value.diabetes
            : diabetes // ignore: cast_nullable_to_non_nullable
                  as bool,
        penyakitGinjal: null == penyakitGinjal
            ? _value.penyakitGinjal
            : penyakitGinjal // ignore: cast_nullable_to_non_nullable
                  as bool,
        penyakitJantung: null == penyakitJantung
            ? _value.penyakitJantung
            : penyakitJantung // ignore: cast_nullable_to_non_nullable
                  as bool,
        tbcMalaria: null == tbcMalaria
            ? _value.tbcMalaria
            : tbcMalaria // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiwayatKesehatanIbuDataImpl implements _RiwayatKesehatanIbuData {
  const _$RiwayatKesehatanIbuDataImpl({
    this.anemia = false,
    this.asma = false,
    @JsonKey(name: 'darah_tinggi') this.darahTinggi = false,
    this.diabetes = false,
    @JsonKey(name: 'penyakit_ginjal') this.penyakitGinjal = false,
    @JsonKey(name: 'penyakit_jantung') this.penyakitJantung = false,
    @JsonKey(name: 'tbc_malaria') this.tbcMalaria = false,
  });

  factory _$RiwayatKesehatanIbuDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiwayatKesehatanIbuDataImplFromJson(json);

  @override
  @JsonKey()
  final bool anemia;
  @override
  @JsonKey()
  final bool asma;
  @override
  @JsonKey(name: 'darah_tinggi')
  final bool darahTinggi;
  @override
  @JsonKey()
  final bool diabetes;
  @override
  @JsonKey(name: 'penyakit_ginjal')
  final bool penyakitGinjal;
  @override
  @JsonKey(name: 'penyakit_jantung')
  final bool penyakitJantung;
  @override
  @JsonKey(name: 'tbc_malaria')
  final bool tbcMalaria;

  @override
  String toString() {
    return 'RiwayatKesehatanIbuData(anemia: $anemia, asma: $asma, darahTinggi: $darahTinggi, diabetes: $diabetes, penyakitGinjal: $penyakitGinjal, penyakitJantung: $penyakitJantung, tbcMalaria: $tbcMalaria)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiwayatKesehatanIbuDataImpl &&
            (identical(other.anemia, anemia) || other.anemia == anemia) &&
            (identical(other.asma, asma) || other.asma == asma) &&
            (identical(other.darahTinggi, darahTinggi) ||
                other.darahTinggi == darahTinggi) &&
            (identical(other.diabetes, diabetes) ||
                other.diabetes == diabetes) &&
            (identical(other.penyakitGinjal, penyakitGinjal) ||
                other.penyakitGinjal == penyakitGinjal) &&
            (identical(other.penyakitJantung, penyakitJantung) ||
                other.penyakitJantung == penyakitJantung) &&
            (identical(other.tbcMalaria, tbcMalaria) ||
                other.tbcMalaria == tbcMalaria));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    anemia,
    asma,
    darahTinggi,
    diabetes,
    penyakitGinjal,
    penyakitJantung,
    tbcMalaria,
  );

  /// Create a copy of RiwayatKesehatanIbuData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiwayatKesehatanIbuDataImplCopyWith<_$RiwayatKesehatanIbuDataImpl>
  get copyWith =>
      __$$RiwayatKesehatanIbuDataImplCopyWithImpl<
        _$RiwayatKesehatanIbuDataImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiwayatKesehatanIbuDataImplToJson(this);
  }
}

abstract class _RiwayatKesehatanIbuData implements RiwayatKesehatanIbuData {
  const factory _RiwayatKesehatanIbuData({
    final bool anemia,
    final bool asma,
    @JsonKey(name: 'darah_tinggi') final bool darahTinggi,
    final bool diabetes,
    @JsonKey(name: 'penyakit_ginjal') final bool penyakitGinjal,
    @JsonKey(name: 'penyakit_jantung') final bool penyakitJantung,
    @JsonKey(name: 'tbc_malaria') final bool tbcMalaria,
  }) = _$RiwayatKesehatanIbuDataImpl;

  factory _RiwayatKesehatanIbuData.fromJson(Map<String, dynamic> json) =
      _$RiwayatKesehatanIbuDataImpl.fromJson;

  @override
  bool get anemia;
  @override
  bool get asma;
  @override
  @JsonKey(name: 'darah_tinggi')
  bool get darahTinggi;
  @override
  bool get diabetes;
  @override
  @JsonKey(name: 'penyakit_ginjal')
  bool get penyakitGinjal;
  @override
  @JsonKey(name: 'penyakit_jantung')
  bool get penyakitJantung;
  @override
  @JsonKey(name: 'tbc_malaria')
  bool get tbcMalaria;

  /// Create a copy of RiwayatKesehatanIbuData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiwayatKesehatanIbuDataImplCopyWith<_$RiwayatKesehatanIbuDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({
    String email,
    @JsonKey(name: 'full_name') String fullName,
    String password,
    String phone,
    String role,
  });
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? password = null,
    Object? phone = null,
    Object? role = null,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
    _$UserDataImpl value,
    $Res Function(_$UserDataImpl) then,
  ) = __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    @JsonKey(name: 'full_name') String fullName,
    String password,
    String phone,
    String role,
  });
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
    _$UserDataImpl _value,
    $Res Function(_$UserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? password = null,
    Object? phone = null,
    Object? role = null,
  }) {
    return _then(
      _$UserDataImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl({
    required this.email,
    @JsonKey(name: 'full_name') required this.fullName,
    required this.password,
    required this.phone,
    required this.role,
  });

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final String email;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String password;
  @override
  final String phone;
  @override
  final String role;

  @override
  String toString() {
    return 'UserData(email: $email, fullName: $fullName, password: $password, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, fullName, password, phone, role);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(this);
  }
}

abstract class _UserData implements UserData {
  const factory _UserData({
    required final String email,
    @JsonKey(name: 'full_name') required final String fullName,
    required final String password,
    required final String phone,
    required final String role,
  }) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get password;
  @override
  String get phone;
  @override
  String get role;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
