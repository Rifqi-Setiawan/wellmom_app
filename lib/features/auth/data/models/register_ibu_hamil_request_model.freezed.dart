// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_ibu_hamil_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterIbuHamilRequestModel {

@JsonKey(name: 'ibu_hamil') IbuHamilData get ibuHamil; UserData get user;
/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterIbuHamilRequestModelCopyWith<RegisterIbuHamilRequestModel> get copyWith => _$RegisterIbuHamilRequestModelCopyWithImpl<RegisterIbuHamilRequestModel>(this as RegisterIbuHamilRequestModel, _$identity);

  /// Serializes this RegisterIbuHamilRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterIbuHamilRequestModel&&(identical(other.ibuHamil, ibuHamil) || other.ibuHamil == ibuHamil)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ibuHamil,user);

@override
String toString() {
  return 'RegisterIbuHamilRequestModel(ibuHamil: $ibuHamil, user: $user)';
}


}

/// @nodoc
abstract mixin class $RegisterIbuHamilRequestModelCopyWith<$Res>  {
  factory $RegisterIbuHamilRequestModelCopyWith(RegisterIbuHamilRequestModel value, $Res Function(RegisterIbuHamilRequestModel) _then) = _$RegisterIbuHamilRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ibu_hamil') IbuHamilData ibuHamil, UserData user
});


$IbuHamilDataCopyWith<$Res> get ibuHamil;$UserDataCopyWith<$Res> get user;

}
/// @nodoc
class _$RegisterIbuHamilRequestModelCopyWithImpl<$Res>
    implements $RegisterIbuHamilRequestModelCopyWith<$Res> {
  _$RegisterIbuHamilRequestModelCopyWithImpl(this._self, this._then);

  final RegisterIbuHamilRequestModel _self;
  final $Res Function(RegisterIbuHamilRequestModel) _then;

/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ibuHamil = null,Object? user = null,}) {
  return _then(_self.copyWith(
ibuHamil: null == ibuHamil ? _self.ibuHamil : ibuHamil // ignore: cast_nullable_to_non_nullable
as IbuHamilData,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,
  ));
}
/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IbuHamilDataCopyWith<$Res> get ibuHamil {
  
  return $IbuHamilDataCopyWith<$Res>(_self.ibuHamil, (value) {
    return _then(_self.copyWith(ibuHamil: value));
  });
}/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterIbuHamilRequestModel].
extension RegisterIbuHamilRequestModelPatterns on RegisterIbuHamilRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterIbuHamilRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterIbuHamilRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterIbuHamilRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterIbuHamilRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterIbuHamilRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterIbuHamilRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ibu_hamil')  IbuHamilData ibuHamil,  UserData user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterIbuHamilRequestModel() when $default != null:
return $default(_that.ibuHamil,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ibu_hamil')  IbuHamilData ibuHamil,  UserData user)  $default,) {final _that = this;
switch (_that) {
case _RegisterIbuHamilRequestModel():
return $default(_that.ibuHamil,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ibu_hamil')  IbuHamilData ibuHamil,  UserData user)?  $default,) {final _that = this;
switch (_that) {
case _RegisterIbuHamilRequestModel() when $default != null:
return $default(_that.ibuHamil,_that.user);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _RegisterIbuHamilRequestModel implements RegisterIbuHamilRequestModel {
  const _RegisterIbuHamilRequestModel({@JsonKey(name: 'ibu_hamil') required this.ibuHamil, required this.user});
  factory _RegisterIbuHamilRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterIbuHamilRequestModelFromJson(json);

@override@JsonKey(name: 'ibu_hamil') final  IbuHamilData ibuHamil;
@override final  UserData user;

/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterIbuHamilRequestModelCopyWith<_RegisterIbuHamilRequestModel> get copyWith => __$RegisterIbuHamilRequestModelCopyWithImpl<_RegisterIbuHamilRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterIbuHamilRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterIbuHamilRequestModel&&(identical(other.ibuHamil, ibuHamil) || other.ibuHamil == ibuHamil)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ibuHamil,user);

@override
String toString() {
  return 'RegisterIbuHamilRequestModel(ibuHamil: $ibuHamil, user: $user)';
}


}

/// @nodoc
abstract mixin class _$RegisterIbuHamilRequestModelCopyWith<$Res> implements $RegisterIbuHamilRequestModelCopyWith<$Res> {
  factory _$RegisterIbuHamilRequestModelCopyWith(_RegisterIbuHamilRequestModel value, $Res Function(_RegisterIbuHamilRequestModel) _then) = __$RegisterIbuHamilRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ibu_hamil') IbuHamilData ibuHamil, UserData user
});


@override $IbuHamilDataCopyWith<$Res> get ibuHamil;@override $UserDataCopyWith<$Res> get user;

}
/// @nodoc
class __$RegisterIbuHamilRequestModelCopyWithImpl<$Res>
    implements _$RegisterIbuHamilRequestModelCopyWith<$Res> {
  __$RegisterIbuHamilRequestModelCopyWithImpl(this._self, this._then);

  final _RegisterIbuHamilRequestModel _self;
  final $Res Function(_RegisterIbuHamilRequestModel) _then;

/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ibuHamil = null,Object? user = null,}) {
  return _then(_RegisterIbuHamilRequestModel(
ibuHamil: null == ibuHamil ? _self.ibuHamil : ibuHamil // ignore: cast_nullable_to_non_nullable
as IbuHamilData,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,
  ));
}

/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IbuHamilDataCopyWith<$Res> get ibuHamil {
  
  return $IbuHamilDataCopyWith<$Res>(_self.ibuHamil, (value) {
    return _then(_self.copyWith(ibuHamil: value));
  });
}/// Create a copy of RegisterIbuHamilRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$IbuHamilData {

@JsonKey(name: 'nama_lengkap') String get namaLengkap; String get nik;@JsonKey(name: 'date_of_birth') String get dateOfBirth; String get address; List<double> get location;@JsonKey(name: 'emergency_contact_name') String get emergencyContactName;@JsonKey(name: 'emergency_contact_phone') String get emergencyContactPhone;@JsonKey(name: 'blood_type') String? get bloodType; int? get age;@JsonKey(name: 'emergency_contact_relation') String? get emergencyContactRelation; String? get provinsi;@JsonKey(name: 'kota_kabupaten') String? get kotaKabupaten; String? get kecamatan; String? get kelurahan;@JsonKey(name: 'last_menstrual_period') String? get lastMenstrualPeriod;@JsonKey(name: 'estimated_due_date') String? get estimatedDueDate;@JsonKey(name: 'usia_kehamilan') int? get usiaKehamilan;@JsonKey(name: 'kehamilan_ke') int? get kehamilanKe;@JsonKey(name: 'jumlah_anak') int? get jumlahAnak;@JsonKey(name: 'jarak_kehamilan_terakhir') String? get jarakKehamilanTerakhir;@JsonKey(name: 'miscarriage_number') int? get miscarriageNumber;@JsonKey(name: 'previous_pregnancy_complications') String? get previousPregnancyComplications;@JsonKey(name: 'pernah_caesar') bool get pernahCaesar;@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool get pernahPerdarahanSaatHamil;@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuData? get riwayatKesehatanIbu;@JsonKey(name: 'healthcare_preference') String? get healthcarePreference;@JsonKey(name: 'whatsapp_consent') bool get whatsappConsent;@JsonKey(name: 'data_sharing_consent') bool get dataSharingConsent;
/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IbuHamilDataCopyWith<IbuHamilData> get copyWith => _$IbuHamilDataCopyWithImpl<IbuHamilData>(this as IbuHamilData, _$identity);

  /// Serializes this IbuHamilData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IbuHamilData&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.age, age) || other.age == age)&&(identical(other.emergencyContactRelation, emergencyContactRelation) || other.emergencyContactRelation == emergencyContactRelation)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.kotaKabupaten, kotaKabupaten) || other.kotaKabupaten == kotaKabupaten)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&(identical(other.estimatedDueDate, estimatedDueDate) || other.estimatedDueDate == estimatedDueDate)&&(identical(other.usiaKehamilan, usiaKehamilan) || other.usiaKehamilan == usiaKehamilan)&&(identical(other.kehamilanKe, kehamilanKe) || other.kehamilanKe == kehamilanKe)&&(identical(other.jumlahAnak, jumlahAnak) || other.jumlahAnak == jumlahAnak)&&(identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) || other.jarakKehamilanTerakhir == jarakKehamilanTerakhir)&&(identical(other.miscarriageNumber, miscarriageNumber) || other.miscarriageNumber == miscarriageNumber)&&(identical(other.previousPregnancyComplications, previousPregnancyComplications) || other.previousPregnancyComplications == previousPregnancyComplications)&&(identical(other.pernahCaesar, pernahCaesar) || other.pernahCaesar == pernahCaesar)&&(identical(other.pernahPerdarahanSaatHamil, pernahPerdarahanSaatHamil) || other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil)&&(identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) || other.riwayatKesehatanIbu == riwayatKesehatanIbu)&&(identical(other.healthcarePreference, healthcarePreference) || other.healthcarePreference == healthcarePreference)&&(identical(other.whatsappConsent, whatsappConsent) || other.whatsappConsent == whatsappConsent)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,namaLengkap,nik,dateOfBirth,address,const DeepCollectionEquality().hash(location),emergencyContactName,emergencyContactPhone,bloodType,age,emergencyContactRelation,provinsi,kotaKabupaten,kecamatan,kelurahan,lastMenstrualPeriod,estimatedDueDate,usiaKehamilan,kehamilanKe,jumlahAnak,jarakKehamilanTerakhir,miscarriageNumber,previousPregnancyComplications,pernahCaesar,pernahPerdarahanSaatHamil,riwayatKesehatanIbu,healthcarePreference,whatsappConsent,dataSharingConsent]);

@override
String toString() {
  return 'IbuHamilData(namaLengkap: $namaLengkap, nik: $nik, dateOfBirth: $dateOfBirth, address: $address, location: $location, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, bloodType: $bloodType, age: $age, emergencyContactRelation: $emergencyContactRelation, provinsi: $provinsi, kotaKabupaten: $kotaKabupaten, kecamatan: $kecamatan, kelurahan: $kelurahan, lastMenstrualPeriod: $lastMenstrualPeriod, estimatedDueDate: $estimatedDueDate, usiaKehamilan: $usiaKehamilan, kehamilanKe: $kehamilanKe, jumlahAnak: $jumlahAnak, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, miscarriageNumber: $miscarriageNumber, previousPregnancyComplications: $previousPregnancyComplications, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, riwayatKesehatanIbu: $riwayatKesehatanIbu, healthcarePreference: $healthcarePreference, whatsappConsent: $whatsappConsent, dataSharingConsent: $dataSharingConsent)';
}


}

/// @nodoc
abstract mixin class $IbuHamilDataCopyWith<$Res>  {
  factory $IbuHamilDataCopyWith(IbuHamilData value, $Res Function(IbuHamilData) _then) = _$IbuHamilDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik,@JsonKey(name: 'date_of_birth') String dateOfBirth, String address, List<double> location,@JsonKey(name: 'emergency_contact_name') String emergencyContactName,@JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,@JsonKey(name: 'blood_type') String? bloodType, int? age,@JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation, String? provinsi,@JsonKey(name: 'kota_kabupaten') String? kotaKabupaten, String? kecamatan, String? kelurahan,@JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod,@JsonKey(name: 'estimated_due_date') String? estimatedDueDate,@JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,@JsonKey(name: 'kehamilan_ke') int? kehamilanKe,@JsonKey(name: 'jumlah_anak') int? jumlahAnak,@JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,@JsonKey(name: 'miscarriage_number') int? miscarriageNumber,@JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications,@JsonKey(name: 'pernah_caesar') bool pernahCaesar,@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool pernahPerdarahanSaatHamil,@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuData? riwayatKesehatanIbu,@JsonKey(name: 'healthcare_preference') String? healthcarePreference,@JsonKey(name: 'whatsapp_consent') bool whatsappConsent,@JsonKey(name: 'data_sharing_consent') bool dataSharingConsent
});


$RiwayatKesehatanIbuDataCopyWith<$Res>? get riwayatKesehatanIbu;

}
/// @nodoc
class _$IbuHamilDataCopyWithImpl<$Res>
    implements $IbuHamilDataCopyWith<$Res> {
  _$IbuHamilDataCopyWithImpl(this._self, this._then);

  final IbuHamilData _self;
  final $Res Function(IbuHamilData) _then;

/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? namaLengkap = null,Object? nik = null,Object? dateOfBirth = null,Object? address = null,Object? location = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? bloodType = freezed,Object? age = freezed,Object? emergencyContactRelation = freezed,Object? provinsi = freezed,Object? kotaKabupaten = freezed,Object? kecamatan = freezed,Object? kelurahan = freezed,Object? lastMenstrualPeriod = freezed,Object? estimatedDueDate = freezed,Object? usiaKehamilan = freezed,Object? kehamilanKe = freezed,Object? jumlahAnak = freezed,Object? jarakKehamilanTerakhir = freezed,Object? miscarriageNumber = freezed,Object? previousPregnancyComplications = freezed,Object? pernahCaesar = null,Object? pernahPerdarahanSaatHamil = null,Object? riwayatKesehatanIbu = freezed,Object? healthcarePreference = freezed,Object? whatsappConsent = null,Object? dataSharingConsent = null,}) {
  return _then(_self.copyWith(
namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<double>,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,emergencyContactRelation: freezed == emergencyContactRelation ? _self.emergencyContactRelation : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
as String?,provinsi: freezed == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String?,kotaKabupaten: freezed == kotaKabupaten ? _self.kotaKabupaten : kotaKabupaten // ignore: cast_nullable_to_non_nullable
as String?,kecamatan: freezed == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as String?,estimatedDueDate: freezed == estimatedDueDate ? _self.estimatedDueDate : estimatedDueDate // ignore: cast_nullable_to_non_nullable
as String?,usiaKehamilan: freezed == usiaKehamilan ? _self.usiaKehamilan : usiaKehamilan // ignore: cast_nullable_to_non_nullable
as int?,kehamilanKe: freezed == kehamilanKe ? _self.kehamilanKe : kehamilanKe // ignore: cast_nullable_to_non_nullable
as int?,jumlahAnak: freezed == jumlahAnak ? _self.jumlahAnak : jumlahAnak // ignore: cast_nullable_to_non_nullable
as int?,jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir ? _self.jarakKehamilanTerakhir : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
as String?,miscarriageNumber: freezed == miscarriageNumber ? _self.miscarriageNumber : miscarriageNumber // ignore: cast_nullable_to_non_nullable
as int?,previousPregnancyComplications: freezed == previousPregnancyComplications ? _self.previousPregnancyComplications : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
as String?,pernahCaesar: null == pernahCaesar ? _self.pernahCaesar : pernahCaesar // ignore: cast_nullable_to_non_nullable
as bool,pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil ? _self.pernahPerdarahanSaatHamil : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
as bool,riwayatKesehatanIbu: freezed == riwayatKesehatanIbu ? _self.riwayatKesehatanIbu : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
as RiwayatKesehatanIbuData?,healthcarePreference: freezed == healthcarePreference ? _self.healthcarePreference : healthcarePreference // ignore: cast_nullable_to_non_nullable
as String?,whatsappConsent: null == whatsappConsent ? _self.whatsappConsent : whatsappConsent // ignore: cast_nullable_to_non_nullable
as bool,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuDataCopyWith<$Res>? get riwayatKesehatanIbu {
    if (_self.riwayatKesehatanIbu == null) {
    return null;
  }

  return $RiwayatKesehatanIbuDataCopyWith<$Res>(_self.riwayatKesehatanIbu!, (value) {
    return _then(_self.copyWith(riwayatKesehatanIbu: value));
  });
}
}


/// Adds pattern-matching-related methods to [IbuHamilData].
extension IbuHamilDataPatterns on IbuHamilData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IbuHamilData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IbuHamilData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IbuHamilData value)  $default,){
final _that = this;
switch (_that) {
case _IbuHamilData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IbuHamilData value)?  $default,){
final _that = this;
switch (_that) {
case _IbuHamilData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'date_of_birth')  String dateOfBirth,  String address,  List<double> location, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'blood_type')  String? bloodType,  int? age, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation,  String? provinsi, @JsonKey(name: 'kota_kabupaten')  String? kotaKabupaten,  String? kecamatan,  String? kelurahan, @JsonKey(name: 'last_menstrual_period')  String? lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date')  String? estimatedDueDate, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number')  int? miscarriageNumber, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuData? riwayatKesehatanIbu, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IbuHamilData() when $default != null:
return $default(_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.address,_that.location,_that.emergencyContactName,_that.emergencyContactPhone,_that.bloodType,_that.age,_that.emergencyContactRelation,_that.provinsi,_that.kotaKabupaten,_that.kecamatan,_that.kelurahan,_that.lastMenstrualPeriod,_that.estimatedDueDate,_that.usiaKehamilan,_that.kehamilanKe,_that.jumlahAnak,_that.jarakKehamilanTerakhir,_that.miscarriageNumber,_that.previousPregnancyComplications,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.riwayatKesehatanIbu,_that.healthcarePreference,_that.whatsappConsent,_that.dataSharingConsent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'date_of_birth')  String dateOfBirth,  String address,  List<double> location, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'blood_type')  String? bloodType,  int? age, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation,  String? provinsi, @JsonKey(name: 'kota_kabupaten')  String? kotaKabupaten,  String? kecamatan,  String? kelurahan, @JsonKey(name: 'last_menstrual_period')  String? lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date')  String? estimatedDueDate, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number')  int? miscarriageNumber, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuData? riwayatKesehatanIbu, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent)  $default,) {final _that = this;
switch (_that) {
case _IbuHamilData():
return $default(_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.address,_that.location,_that.emergencyContactName,_that.emergencyContactPhone,_that.bloodType,_that.age,_that.emergencyContactRelation,_that.provinsi,_that.kotaKabupaten,_that.kecamatan,_that.kelurahan,_that.lastMenstrualPeriod,_that.estimatedDueDate,_that.usiaKehamilan,_that.kehamilanKe,_that.jumlahAnak,_that.jarakKehamilanTerakhir,_that.miscarriageNumber,_that.previousPregnancyComplications,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.riwayatKesehatanIbu,_that.healthcarePreference,_that.whatsappConsent,_that.dataSharingConsent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'date_of_birth')  String dateOfBirth,  String address,  List<double> location, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'blood_type')  String? bloodType,  int? age, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation,  String? provinsi, @JsonKey(name: 'kota_kabupaten')  String? kotaKabupaten,  String? kecamatan,  String? kelurahan, @JsonKey(name: 'last_menstrual_period')  String? lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date')  String? estimatedDueDate, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number')  int? miscarriageNumber, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuData? riwayatKesehatanIbu, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent)?  $default,) {final _that = this;
switch (_that) {
case _IbuHamilData() when $default != null:
return $default(_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.address,_that.location,_that.emergencyContactName,_that.emergencyContactPhone,_that.bloodType,_that.age,_that.emergencyContactRelation,_that.provinsi,_that.kotaKabupaten,_that.kecamatan,_that.kelurahan,_that.lastMenstrualPeriod,_that.estimatedDueDate,_that.usiaKehamilan,_that.kehamilanKe,_that.jumlahAnak,_that.jarakKehamilanTerakhir,_that.miscarriageNumber,_that.previousPregnancyComplications,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.riwayatKesehatanIbu,_that.healthcarePreference,_that.whatsappConsent,_that.dataSharingConsent);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _IbuHamilData implements IbuHamilData {
  const _IbuHamilData({@JsonKey(name: 'nama_lengkap') required this.namaLengkap, required this.nik, @JsonKey(name: 'date_of_birth') required this.dateOfBirth, required this.address, required final  List<double> location, @JsonKey(name: 'emergency_contact_name') required this.emergencyContactName, @JsonKey(name: 'emergency_contact_phone') required this.emergencyContactPhone, @JsonKey(name: 'blood_type') this.bloodType, this.age, @JsonKey(name: 'emergency_contact_relation') this.emergencyContactRelation, this.provinsi, @JsonKey(name: 'kota_kabupaten') this.kotaKabupaten, this.kecamatan, this.kelurahan, @JsonKey(name: 'last_menstrual_period') this.lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date') this.estimatedDueDate, @JsonKey(name: 'usia_kehamilan') this.usiaKehamilan, @JsonKey(name: 'kehamilan_ke') this.kehamilanKe, @JsonKey(name: 'jumlah_anak') this.jumlahAnak, @JsonKey(name: 'jarak_kehamilan_terakhir') this.jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number') this.miscarriageNumber, @JsonKey(name: 'previous_pregnancy_complications') this.previousPregnancyComplications, @JsonKey(name: 'pernah_caesar') this.pernahCaesar = false, @JsonKey(name: 'pernah_perdarahan_saat_hamil') this.pernahPerdarahanSaatHamil = false, @JsonKey(name: 'riwayat_kesehatan_ibu') this.riwayatKesehatanIbu, @JsonKey(name: 'healthcare_preference') this.healthcarePreference, @JsonKey(name: 'whatsapp_consent') this.whatsappConsent = true, @JsonKey(name: 'data_sharing_consent') this.dataSharingConsent = false}): _location = location;
  factory _IbuHamilData.fromJson(Map<String, dynamic> json) => _$IbuHamilDataFromJson(json);

@override@JsonKey(name: 'nama_lengkap') final  String namaLengkap;
@override final  String nik;
@override@JsonKey(name: 'date_of_birth') final  String dateOfBirth;
@override final  String address;
 final  List<double> _location;
@override List<double> get location {
  if (_location is EqualUnmodifiableListView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_location);
}

@override@JsonKey(name: 'emergency_contact_name') final  String emergencyContactName;
@override@JsonKey(name: 'emergency_contact_phone') final  String emergencyContactPhone;
@override@JsonKey(name: 'blood_type') final  String? bloodType;
@override final  int? age;
@override@JsonKey(name: 'emergency_contact_relation') final  String? emergencyContactRelation;
@override final  String? provinsi;
@override@JsonKey(name: 'kota_kabupaten') final  String? kotaKabupaten;
@override final  String? kecamatan;
@override final  String? kelurahan;
@override@JsonKey(name: 'last_menstrual_period') final  String? lastMenstrualPeriod;
@override@JsonKey(name: 'estimated_due_date') final  String? estimatedDueDate;
@override@JsonKey(name: 'usia_kehamilan') final  int? usiaKehamilan;
@override@JsonKey(name: 'kehamilan_ke') final  int? kehamilanKe;
@override@JsonKey(name: 'jumlah_anak') final  int? jumlahAnak;
@override@JsonKey(name: 'jarak_kehamilan_terakhir') final  String? jarakKehamilanTerakhir;
@override@JsonKey(name: 'miscarriage_number') final  int? miscarriageNumber;
@override@JsonKey(name: 'previous_pregnancy_complications') final  String? previousPregnancyComplications;
@override@JsonKey(name: 'pernah_caesar') final  bool pernahCaesar;
@override@JsonKey(name: 'pernah_perdarahan_saat_hamil') final  bool pernahPerdarahanSaatHamil;
@override@JsonKey(name: 'riwayat_kesehatan_ibu') final  RiwayatKesehatanIbuData? riwayatKesehatanIbu;
@override@JsonKey(name: 'healthcare_preference') final  String? healthcarePreference;
@override@JsonKey(name: 'whatsapp_consent') final  bool whatsappConsent;
@override@JsonKey(name: 'data_sharing_consent') final  bool dataSharingConsent;

/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IbuHamilDataCopyWith<_IbuHamilData> get copyWith => __$IbuHamilDataCopyWithImpl<_IbuHamilData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IbuHamilDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IbuHamilData&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._location, _location)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.age, age) || other.age == age)&&(identical(other.emergencyContactRelation, emergencyContactRelation) || other.emergencyContactRelation == emergencyContactRelation)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.kotaKabupaten, kotaKabupaten) || other.kotaKabupaten == kotaKabupaten)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&(identical(other.estimatedDueDate, estimatedDueDate) || other.estimatedDueDate == estimatedDueDate)&&(identical(other.usiaKehamilan, usiaKehamilan) || other.usiaKehamilan == usiaKehamilan)&&(identical(other.kehamilanKe, kehamilanKe) || other.kehamilanKe == kehamilanKe)&&(identical(other.jumlahAnak, jumlahAnak) || other.jumlahAnak == jumlahAnak)&&(identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) || other.jarakKehamilanTerakhir == jarakKehamilanTerakhir)&&(identical(other.miscarriageNumber, miscarriageNumber) || other.miscarriageNumber == miscarriageNumber)&&(identical(other.previousPregnancyComplications, previousPregnancyComplications) || other.previousPregnancyComplications == previousPregnancyComplications)&&(identical(other.pernahCaesar, pernahCaesar) || other.pernahCaesar == pernahCaesar)&&(identical(other.pernahPerdarahanSaatHamil, pernahPerdarahanSaatHamil) || other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil)&&(identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) || other.riwayatKesehatanIbu == riwayatKesehatanIbu)&&(identical(other.healthcarePreference, healthcarePreference) || other.healthcarePreference == healthcarePreference)&&(identical(other.whatsappConsent, whatsappConsent) || other.whatsappConsent == whatsappConsent)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,namaLengkap,nik,dateOfBirth,address,const DeepCollectionEquality().hash(_location),emergencyContactName,emergencyContactPhone,bloodType,age,emergencyContactRelation,provinsi,kotaKabupaten,kecamatan,kelurahan,lastMenstrualPeriod,estimatedDueDate,usiaKehamilan,kehamilanKe,jumlahAnak,jarakKehamilanTerakhir,miscarriageNumber,previousPregnancyComplications,pernahCaesar,pernahPerdarahanSaatHamil,riwayatKesehatanIbu,healthcarePreference,whatsappConsent,dataSharingConsent]);

@override
String toString() {
  return 'IbuHamilData(namaLengkap: $namaLengkap, nik: $nik, dateOfBirth: $dateOfBirth, address: $address, location: $location, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, bloodType: $bloodType, age: $age, emergencyContactRelation: $emergencyContactRelation, provinsi: $provinsi, kotaKabupaten: $kotaKabupaten, kecamatan: $kecamatan, kelurahan: $kelurahan, lastMenstrualPeriod: $lastMenstrualPeriod, estimatedDueDate: $estimatedDueDate, usiaKehamilan: $usiaKehamilan, kehamilanKe: $kehamilanKe, jumlahAnak: $jumlahAnak, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, miscarriageNumber: $miscarriageNumber, previousPregnancyComplications: $previousPregnancyComplications, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, riwayatKesehatanIbu: $riwayatKesehatanIbu, healthcarePreference: $healthcarePreference, whatsappConsent: $whatsappConsent, dataSharingConsent: $dataSharingConsent)';
}


}

/// @nodoc
abstract mixin class _$IbuHamilDataCopyWith<$Res> implements $IbuHamilDataCopyWith<$Res> {
  factory _$IbuHamilDataCopyWith(_IbuHamilData value, $Res Function(_IbuHamilData) _then) = __$IbuHamilDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik,@JsonKey(name: 'date_of_birth') String dateOfBirth, String address, List<double> location,@JsonKey(name: 'emergency_contact_name') String emergencyContactName,@JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,@JsonKey(name: 'blood_type') String? bloodType, int? age,@JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation, String? provinsi,@JsonKey(name: 'kota_kabupaten') String? kotaKabupaten, String? kecamatan, String? kelurahan,@JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod,@JsonKey(name: 'estimated_due_date') String? estimatedDueDate,@JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,@JsonKey(name: 'kehamilan_ke') int? kehamilanKe,@JsonKey(name: 'jumlah_anak') int? jumlahAnak,@JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,@JsonKey(name: 'miscarriage_number') int? miscarriageNumber,@JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications,@JsonKey(name: 'pernah_caesar') bool pernahCaesar,@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool pernahPerdarahanSaatHamil,@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuData? riwayatKesehatanIbu,@JsonKey(name: 'healthcare_preference') String? healthcarePreference,@JsonKey(name: 'whatsapp_consent') bool whatsappConsent,@JsonKey(name: 'data_sharing_consent') bool dataSharingConsent
});


@override $RiwayatKesehatanIbuDataCopyWith<$Res>? get riwayatKesehatanIbu;

}
/// @nodoc
class __$IbuHamilDataCopyWithImpl<$Res>
    implements _$IbuHamilDataCopyWith<$Res> {
  __$IbuHamilDataCopyWithImpl(this._self, this._then);

  final _IbuHamilData _self;
  final $Res Function(_IbuHamilData) _then;

/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? namaLengkap = null,Object? nik = null,Object? dateOfBirth = null,Object? address = null,Object? location = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? bloodType = freezed,Object? age = freezed,Object? emergencyContactRelation = freezed,Object? provinsi = freezed,Object? kotaKabupaten = freezed,Object? kecamatan = freezed,Object? kelurahan = freezed,Object? lastMenstrualPeriod = freezed,Object? estimatedDueDate = freezed,Object? usiaKehamilan = freezed,Object? kehamilanKe = freezed,Object? jumlahAnak = freezed,Object? jarakKehamilanTerakhir = freezed,Object? miscarriageNumber = freezed,Object? previousPregnancyComplications = freezed,Object? pernahCaesar = null,Object? pernahPerdarahanSaatHamil = null,Object? riwayatKesehatanIbu = freezed,Object? healthcarePreference = freezed,Object? whatsappConsent = null,Object? dataSharingConsent = null,}) {
  return _then(_IbuHamilData(
namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<double>,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,emergencyContactRelation: freezed == emergencyContactRelation ? _self.emergencyContactRelation : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
as String?,provinsi: freezed == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String?,kotaKabupaten: freezed == kotaKabupaten ? _self.kotaKabupaten : kotaKabupaten // ignore: cast_nullable_to_non_nullable
as String?,kecamatan: freezed == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as String?,estimatedDueDate: freezed == estimatedDueDate ? _self.estimatedDueDate : estimatedDueDate // ignore: cast_nullable_to_non_nullable
as String?,usiaKehamilan: freezed == usiaKehamilan ? _self.usiaKehamilan : usiaKehamilan // ignore: cast_nullable_to_non_nullable
as int?,kehamilanKe: freezed == kehamilanKe ? _self.kehamilanKe : kehamilanKe // ignore: cast_nullable_to_non_nullable
as int?,jumlahAnak: freezed == jumlahAnak ? _self.jumlahAnak : jumlahAnak // ignore: cast_nullable_to_non_nullable
as int?,jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir ? _self.jarakKehamilanTerakhir : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
as String?,miscarriageNumber: freezed == miscarriageNumber ? _self.miscarriageNumber : miscarriageNumber // ignore: cast_nullable_to_non_nullable
as int?,previousPregnancyComplications: freezed == previousPregnancyComplications ? _self.previousPregnancyComplications : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
as String?,pernahCaesar: null == pernahCaesar ? _self.pernahCaesar : pernahCaesar // ignore: cast_nullable_to_non_nullable
as bool,pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil ? _self.pernahPerdarahanSaatHamil : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
as bool,riwayatKesehatanIbu: freezed == riwayatKesehatanIbu ? _self.riwayatKesehatanIbu : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
as RiwayatKesehatanIbuData?,healthcarePreference: freezed == healthcarePreference ? _self.healthcarePreference : healthcarePreference // ignore: cast_nullable_to_non_nullable
as String?,whatsappConsent: null == whatsappConsent ? _self.whatsappConsent : whatsappConsent // ignore: cast_nullable_to_non_nullable
as bool,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuDataCopyWith<$Res>? get riwayatKesehatanIbu {
    if (_self.riwayatKesehatanIbu == null) {
    return null;
  }

  return $RiwayatKesehatanIbuDataCopyWith<$Res>(_self.riwayatKesehatanIbu!, (value) {
    return _then(_self.copyWith(riwayatKesehatanIbu: value));
  });
}
}


/// @nodoc
mixin _$RiwayatKesehatanIbuData {

@JsonKey(name: 'darah_tinggi') bool get darahTinggi; bool get diabetes; bool get anemia;@JsonKey(name: 'penyakit_jantung') bool get penyakitJantung; bool get asma;@JsonKey(name: 'penyakit_ginjal') bool get penyakitGinjal;@JsonKey(name: 'tbc_malaria') bool get tbcMalaria;
/// Create a copy of RiwayatKesehatanIbuData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuDataCopyWith<RiwayatKesehatanIbuData> get copyWith => _$RiwayatKesehatanIbuDataCopyWithImpl<RiwayatKesehatanIbuData>(this as RiwayatKesehatanIbuData, _$identity);

  /// Serializes this RiwayatKesehatanIbuData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RiwayatKesehatanIbuData&&(identical(other.darahTinggi, darahTinggi) || other.darahTinggi == darahTinggi)&&(identical(other.diabetes, diabetes) || other.diabetes == diabetes)&&(identical(other.anemia, anemia) || other.anemia == anemia)&&(identical(other.penyakitJantung, penyakitJantung) || other.penyakitJantung == penyakitJantung)&&(identical(other.asma, asma) || other.asma == asma)&&(identical(other.penyakitGinjal, penyakitGinjal) || other.penyakitGinjal == penyakitGinjal)&&(identical(other.tbcMalaria, tbcMalaria) || other.tbcMalaria == tbcMalaria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,darahTinggi,diabetes,anemia,penyakitJantung,asma,penyakitGinjal,tbcMalaria);

@override
String toString() {
  return 'RiwayatKesehatanIbuData(darahTinggi: $darahTinggi, diabetes: $diabetes, anemia: $anemia, penyakitJantung: $penyakitJantung, asma: $asma, penyakitGinjal: $penyakitGinjal, tbcMalaria: $tbcMalaria)';
}


}

/// @nodoc
abstract mixin class $RiwayatKesehatanIbuDataCopyWith<$Res>  {
  factory $RiwayatKesehatanIbuDataCopyWith(RiwayatKesehatanIbuData value, $Res Function(RiwayatKesehatanIbuData) _then) = _$RiwayatKesehatanIbuDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'darah_tinggi') bool darahTinggi, bool diabetes, bool anemia,@JsonKey(name: 'penyakit_jantung') bool penyakitJantung, bool asma,@JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,@JsonKey(name: 'tbc_malaria') bool tbcMalaria
});




}
/// @nodoc
class _$RiwayatKesehatanIbuDataCopyWithImpl<$Res>
    implements $RiwayatKesehatanIbuDataCopyWith<$Res> {
  _$RiwayatKesehatanIbuDataCopyWithImpl(this._self, this._then);

  final RiwayatKesehatanIbuData _self;
  final $Res Function(RiwayatKesehatanIbuData) _then;

/// Create a copy of RiwayatKesehatanIbuData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? darahTinggi = null,Object? diabetes = null,Object? anemia = null,Object? penyakitJantung = null,Object? asma = null,Object? penyakitGinjal = null,Object? tbcMalaria = null,}) {
  return _then(_self.copyWith(
darahTinggi: null == darahTinggi ? _self.darahTinggi : darahTinggi // ignore: cast_nullable_to_non_nullable
as bool,diabetes: null == diabetes ? _self.diabetes : diabetes // ignore: cast_nullable_to_non_nullable
as bool,anemia: null == anemia ? _self.anemia : anemia // ignore: cast_nullable_to_non_nullable
as bool,penyakitJantung: null == penyakitJantung ? _self.penyakitJantung : penyakitJantung // ignore: cast_nullable_to_non_nullable
as bool,asma: null == asma ? _self.asma : asma // ignore: cast_nullable_to_non_nullable
as bool,penyakitGinjal: null == penyakitGinjal ? _self.penyakitGinjal : penyakitGinjal // ignore: cast_nullable_to_non_nullable
as bool,tbcMalaria: null == tbcMalaria ? _self.tbcMalaria : tbcMalaria // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RiwayatKesehatanIbuData].
extension RiwayatKesehatanIbuDataPatterns on RiwayatKesehatanIbuData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RiwayatKesehatanIbuData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RiwayatKesehatanIbuData value)  $default,){
final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RiwayatKesehatanIbuData value)?  $default,){
final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes,  bool anemia, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung,  bool asma, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData() when $default != null:
return $default(_that.darahTinggi,_that.diabetes,_that.anemia,_that.penyakitJantung,_that.asma,_that.penyakitGinjal,_that.tbcMalaria);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes,  bool anemia, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung,  bool asma, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)  $default,) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData():
return $default(_that.darahTinggi,_that.diabetes,_that.anemia,_that.penyakitJantung,_that.asma,_that.penyakitGinjal,_that.tbcMalaria);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes,  bool anemia, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung,  bool asma, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)?  $default,) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData() when $default != null:
return $default(_that.darahTinggi,_that.diabetes,_that.anemia,_that.penyakitJantung,_that.asma,_that.penyakitGinjal,_that.tbcMalaria);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _RiwayatKesehatanIbuData implements RiwayatKesehatanIbuData {
  const _RiwayatKesehatanIbuData({@JsonKey(name: 'darah_tinggi') this.darahTinggi = false, this.diabetes = false, this.anemia = false, @JsonKey(name: 'penyakit_jantung') this.penyakitJantung = false, this.asma = false, @JsonKey(name: 'penyakit_ginjal') this.penyakitGinjal = false, @JsonKey(name: 'tbc_malaria') this.tbcMalaria = false});
  factory _RiwayatKesehatanIbuData.fromJson(Map<String, dynamic> json) => _$RiwayatKesehatanIbuDataFromJson(json);

@override@JsonKey(name: 'darah_tinggi') final  bool darahTinggi;
@override@JsonKey() final  bool diabetes;
@override@JsonKey() final  bool anemia;
@override@JsonKey(name: 'penyakit_jantung') final  bool penyakitJantung;
@override@JsonKey() final  bool asma;
@override@JsonKey(name: 'penyakit_ginjal') final  bool penyakitGinjal;
@override@JsonKey(name: 'tbc_malaria') final  bool tbcMalaria;

/// Create a copy of RiwayatKesehatanIbuData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RiwayatKesehatanIbuDataCopyWith<_RiwayatKesehatanIbuData> get copyWith => __$RiwayatKesehatanIbuDataCopyWithImpl<_RiwayatKesehatanIbuData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RiwayatKesehatanIbuDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RiwayatKesehatanIbuData&&(identical(other.darahTinggi, darahTinggi) || other.darahTinggi == darahTinggi)&&(identical(other.diabetes, diabetes) || other.diabetes == diabetes)&&(identical(other.anemia, anemia) || other.anemia == anemia)&&(identical(other.penyakitJantung, penyakitJantung) || other.penyakitJantung == penyakitJantung)&&(identical(other.asma, asma) || other.asma == asma)&&(identical(other.penyakitGinjal, penyakitGinjal) || other.penyakitGinjal == penyakitGinjal)&&(identical(other.tbcMalaria, tbcMalaria) || other.tbcMalaria == tbcMalaria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,darahTinggi,diabetes,anemia,penyakitJantung,asma,penyakitGinjal,tbcMalaria);

@override
String toString() {
  return 'RiwayatKesehatanIbuData(darahTinggi: $darahTinggi, diabetes: $diabetes, anemia: $anemia, penyakitJantung: $penyakitJantung, asma: $asma, penyakitGinjal: $penyakitGinjal, tbcMalaria: $tbcMalaria)';
}


}

/// @nodoc
abstract mixin class _$RiwayatKesehatanIbuDataCopyWith<$Res> implements $RiwayatKesehatanIbuDataCopyWith<$Res> {
  factory _$RiwayatKesehatanIbuDataCopyWith(_RiwayatKesehatanIbuData value, $Res Function(_RiwayatKesehatanIbuData) _then) = __$RiwayatKesehatanIbuDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'darah_tinggi') bool darahTinggi, bool diabetes, bool anemia,@JsonKey(name: 'penyakit_jantung') bool penyakitJantung, bool asma,@JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,@JsonKey(name: 'tbc_malaria') bool tbcMalaria
});




}
/// @nodoc
class __$RiwayatKesehatanIbuDataCopyWithImpl<$Res>
    implements _$RiwayatKesehatanIbuDataCopyWith<$Res> {
  __$RiwayatKesehatanIbuDataCopyWithImpl(this._self, this._then);

  final _RiwayatKesehatanIbuData _self;
  final $Res Function(_RiwayatKesehatanIbuData) _then;

/// Create a copy of RiwayatKesehatanIbuData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? darahTinggi = null,Object? diabetes = null,Object? anemia = null,Object? penyakitJantung = null,Object? asma = null,Object? penyakitGinjal = null,Object? tbcMalaria = null,}) {
  return _then(_RiwayatKesehatanIbuData(
darahTinggi: null == darahTinggi ? _self.darahTinggi : darahTinggi // ignore: cast_nullable_to_non_nullable
as bool,diabetes: null == diabetes ? _self.diabetes : diabetes // ignore: cast_nullable_to_non_nullable
as bool,anemia: null == anemia ? _self.anemia : anemia // ignore: cast_nullable_to_non_nullable
as bool,penyakitJantung: null == penyakitJantung ? _self.penyakitJantung : penyakitJantung // ignore: cast_nullable_to_non_nullable
as bool,asma: null == asma ? _self.asma : asma // ignore: cast_nullable_to_non_nullable
as bool,penyakitGinjal: null == penyakitGinjal ? _self.penyakitGinjal : penyakitGinjal // ignore: cast_nullable_to_non_nullable
as bool,tbcMalaria: null == tbcMalaria ? _self.tbcMalaria : tbcMalaria // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserData {

 String get phone; String get password;@JsonKey(name: 'full_name') String get fullName; String get role; String? get email;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,password,fullName,role,email);

@override
String toString() {
  return 'UserData(phone: $phone, password: $password, fullName: $fullName, role: $role, email: $email)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 String phone, String password,@JsonKey(name: 'full_name') String fullName, String role, String? email
});




}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? password = null,Object? fullName = null,Object? role = null,Object? email = freezed,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserData].
extension UserDataPatterns on UserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserData value)  $default,){
final _that = this;
switch (_that) {
case _UserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserData value)?  $default,){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String password, @JsonKey(name: 'full_name')  String fullName,  String role,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.phone,_that.password,_that.fullName,_that.role,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String password, @JsonKey(name: 'full_name')  String fullName,  String role,  String? email)  $default,) {final _that = this;
switch (_that) {
case _UserData():
return $default(_that.phone,_that.password,_that.fullName,_that.role,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String password, @JsonKey(name: 'full_name')  String fullName,  String role,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.phone,_that.password,_that.fullName,_that.role,_that.email);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _UserData implements UserData {
  const _UserData({required this.phone, required this.password, @JsonKey(name: 'full_name') required this.fullName, required this.role, this.email});
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override final  String phone;
@override final  String password;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String role;
@override final  String? email;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,password,fullName,role,email);

@override
String toString() {
  return 'UserData(phone: $phone, password: $password, fullName: $fullName, role: $role, email: $email)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 String phone, String password,@JsonKey(name: 'full_name') String fullName, String role, String? email
});




}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? password = null,Object? fullName = null,Object? role = null,Object? email = freezed,}) {
  return _then(_UserData(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
