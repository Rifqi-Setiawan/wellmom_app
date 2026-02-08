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

@JsonSerializable(explicitToJson: true)
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

 String get address; int? get age;@JsonKey(name: 'blood_type') String? get bloodType;@JsonKey(name: 'data_sharing_consent') bool get dataSharingConsent;@JsonKey(name: 'date_of_birth') String get dateOfBirth;@JsonKey(name: 'emergency_contact_name') String get emergencyContactName;@JsonKey(name: 'emergency_contact_phone') String get emergencyContactPhone;@JsonKey(name: 'emergency_contact_relation') String? get emergencyContactRelation;@JsonKey(name: 'estimated_due_date') String? get estimatedDueDate;@JsonKey(name: 'healthcare_preference') String? get healthcarePreference;@JsonKey(name: 'jarak_kehamilan_terakhir') String? get jarakKehamilanTerakhir;@JsonKey(name: 'jumlah_anak') int? get jumlahAnak; String get kecamatan;@JsonKey(name: 'kehamilan_ke') int? get kehamilanKe; String? get kelurahan;@JsonKey(name: 'kota_kabupaten') String get kotaKabupaten;@JsonKey(name: 'last_menstrual_period') String? get lastMenstrualPeriod; List<double> get location;// [longitude, latitude]
@JsonKey(name: 'miscarriage_number') int get miscarriageNumber;@JsonKey(name: 'nama_lengkap') String get namaLengkap; String get nik;@JsonKey(name: 'pernah_caesar') bool get pernahCaesar;@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool get pernahPerdarahanSaatHamil;@JsonKey(name: 'previous_pregnancy_complications') String? get previousPregnancyComplications; String get provinsi;@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuData get riwayatKesehatanIbu;@JsonKey(name: 'usia_kehamilan') int? get usiaKehamilan;@JsonKey(name: 'whatsapp_consent') bool get whatsappConsent;
/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IbuHamilDataCopyWith<IbuHamilData> get copyWith => _$IbuHamilDataCopyWithImpl<IbuHamilData>(this as IbuHamilData, _$identity);

  /// Serializes this IbuHamilData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IbuHamilData&&(identical(other.address, address) || other.address == address)&&(identical(other.age, age) || other.age == age)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.emergencyContactRelation, emergencyContactRelation) || other.emergencyContactRelation == emergencyContactRelation)&&(identical(other.estimatedDueDate, estimatedDueDate) || other.estimatedDueDate == estimatedDueDate)&&(identical(other.healthcarePreference, healthcarePreference) || other.healthcarePreference == healthcarePreference)&&(identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) || other.jarakKehamilanTerakhir == jarakKehamilanTerakhir)&&(identical(other.jumlahAnak, jumlahAnak) || other.jumlahAnak == jumlahAnak)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kehamilanKe, kehamilanKe) || other.kehamilanKe == kehamilanKe)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kotaKabupaten, kotaKabupaten) || other.kotaKabupaten == kotaKabupaten)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.miscarriageNumber, miscarriageNumber) || other.miscarriageNumber == miscarriageNumber)&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.pernahCaesar, pernahCaesar) || other.pernahCaesar == pernahCaesar)&&(identical(other.pernahPerdarahanSaatHamil, pernahPerdarahanSaatHamil) || other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil)&&(identical(other.previousPregnancyComplications, previousPregnancyComplications) || other.previousPregnancyComplications == previousPregnancyComplications)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) || other.riwayatKesehatanIbu == riwayatKesehatanIbu)&&(identical(other.usiaKehamilan, usiaKehamilan) || other.usiaKehamilan == usiaKehamilan)&&(identical(other.whatsappConsent, whatsappConsent) || other.whatsappConsent == whatsappConsent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,address,age,bloodType,dataSharingConsent,dateOfBirth,emergencyContactName,emergencyContactPhone,emergencyContactRelation,estimatedDueDate,healthcarePreference,jarakKehamilanTerakhir,jumlahAnak,kecamatan,kehamilanKe,kelurahan,kotaKabupaten,lastMenstrualPeriod,const DeepCollectionEquality().hash(location),miscarriageNumber,namaLengkap,nik,pernahCaesar,pernahPerdarahanSaatHamil,previousPregnancyComplications,provinsi,riwayatKesehatanIbu,usiaKehamilan,whatsappConsent]);

@override
String toString() {
  return 'IbuHamilData(address: $address, age: $age, bloodType: $bloodType, dataSharingConsent: $dataSharingConsent, dateOfBirth: $dateOfBirth, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelation: $emergencyContactRelation, estimatedDueDate: $estimatedDueDate, healthcarePreference: $healthcarePreference, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, jumlahAnak: $jumlahAnak, kecamatan: $kecamatan, kehamilanKe: $kehamilanKe, kelurahan: $kelurahan, kotaKabupaten: $kotaKabupaten, lastMenstrualPeriod: $lastMenstrualPeriod, location: $location, miscarriageNumber: $miscarriageNumber, namaLengkap: $namaLengkap, nik: $nik, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, previousPregnancyComplications: $previousPregnancyComplications, provinsi: $provinsi, riwayatKesehatanIbu: $riwayatKesehatanIbu, usiaKehamilan: $usiaKehamilan, whatsappConsent: $whatsappConsent)';
}


}

/// @nodoc
abstract mixin class $IbuHamilDataCopyWith<$Res>  {
  factory $IbuHamilDataCopyWith(IbuHamilData value, $Res Function(IbuHamilData) _then) = _$IbuHamilDataCopyWithImpl;
@useResult
$Res call({
 String address, int? age,@JsonKey(name: 'blood_type') String? bloodType,@JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,@JsonKey(name: 'date_of_birth') String dateOfBirth,@JsonKey(name: 'emergency_contact_name') String emergencyContactName,@JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,@JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation,@JsonKey(name: 'estimated_due_date') String? estimatedDueDate,@JsonKey(name: 'healthcare_preference') String? healthcarePreference,@JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,@JsonKey(name: 'jumlah_anak') int? jumlahAnak, String kecamatan,@JsonKey(name: 'kehamilan_ke') int? kehamilanKe, String? kelurahan,@JsonKey(name: 'kota_kabupaten') String kotaKabupaten,@JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod, List<double> location,@JsonKey(name: 'miscarriage_number') int miscarriageNumber,@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik,@JsonKey(name: 'pernah_caesar') bool pernahCaesar,@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool pernahPerdarahanSaatHamil,@JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications, String provinsi,@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuData riwayatKesehatanIbu,@JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,@JsonKey(name: 'whatsapp_consent') bool whatsappConsent
});


$RiwayatKesehatanIbuDataCopyWith<$Res> get riwayatKesehatanIbu;

}
/// @nodoc
class _$IbuHamilDataCopyWithImpl<$Res>
    implements $IbuHamilDataCopyWith<$Res> {
  _$IbuHamilDataCopyWithImpl(this._self, this._then);

  final IbuHamilData _self;
  final $Res Function(IbuHamilData) _then;

/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? age = freezed,Object? bloodType = freezed,Object? dataSharingConsent = null,Object? dateOfBirth = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? emergencyContactRelation = freezed,Object? estimatedDueDate = freezed,Object? healthcarePreference = freezed,Object? jarakKehamilanTerakhir = freezed,Object? jumlahAnak = freezed,Object? kecamatan = null,Object? kehamilanKe = freezed,Object? kelurahan = freezed,Object? kotaKabupaten = null,Object? lastMenstrualPeriod = freezed,Object? location = null,Object? miscarriageNumber = null,Object? namaLengkap = null,Object? nik = null,Object? pernahCaesar = null,Object? pernahPerdarahanSaatHamil = null,Object? previousPregnancyComplications = freezed,Object? provinsi = null,Object? riwayatKesehatanIbu = null,Object? usiaKehamilan = freezed,Object? whatsappConsent = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,emergencyContactRelation: freezed == emergencyContactRelation ? _self.emergencyContactRelation : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
as String?,estimatedDueDate: freezed == estimatedDueDate ? _self.estimatedDueDate : estimatedDueDate // ignore: cast_nullable_to_non_nullable
as String?,healthcarePreference: freezed == healthcarePreference ? _self.healthcarePreference : healthcarePreference // ignore: cast_nullable_to_non_nullable
as String?,jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir ? _self.jarakKehamilanTerakhir : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
as String?,jumlahAnak: freezed == jumlahAnak ? _self.jumlahAnak : jumlahAnak // ignore: cast_nullable_to_non_nullable
as int?,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,kehamilanKe: freezed == kehamilanKe ? _self.kehamilanKe : kehamilanKe // ignore: cast_nullable_to_non_nullable
as int?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,kotaKabupaten: null == kotaKabupaten ? _self.kotaKabupaten : kotaKabupaten // ignore: cast_nullable_to_non_nullable
as String,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<double>,miscarriageNumber: null == miscarriageNumber ? _self.miscarriageNumber : miscarriageNumber // ignore: cast_nullable_to_non_nullable
as int,namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,pernahCaesar: null == pernahCaesar ? _self.pernahCaesar : pernahCaesar // ignore: cast_nullable_to_non_nullable
as bool,pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil ? _self.pernahPerdarahanSaatHamil : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
as bool,previousPregnancyComplications: freezed == previousPregnancyComplications ? _self.previousPregnancyComplications : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
as String?,provinsi: null == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String,riwayatKesehatanIbu: null == riwayatKesehatanIbu ? _self.riwayatKesehatanIbu : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
as RiwayatKesehatanIbuData,usiaKehamilan: freezed == usiaKehamilan ? _self.usiaKehamilan : usiaKehamilan // ignore: cast_nullable_to_non_nullable
as int?,whatsappConsent: null == whatsappConsent ? _self.whatsappConsent : whatsappConsent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuDataCopyWith<$Res> get riwayatKesehatanIbu {
  
  return $RiwayatKesehatanIbuDataCopyWith<$Res>(_self.riwayatKesehatanIbu, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  int? age, @JsonKey(name: 'blood_type')  String? bloodType, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent, @JsonKey(name: 'date_of_birth')  String dateOfBirth, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation, @JsonKey(name: 'estimated_due_date')  String? estimatedDueDate, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak,  String kecamatan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe,  String? kelurahan, @JsonKey(name: 'kota_kabupaten')  String kotaKabupaten, @JsonKey(name: 'last_menstrual_period')  String? lastMenstrualPeriod,  List<double> location, @JsonKey(name: 'miscarriage_number')  int miscarriageNumber, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications,  String provinsi, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuData riwayatKesehatanIbu, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IbuHamilData() when $default != null:
return $default(_that.address,_that.age,_that.bloodType,_that.dataSharingConsent,_that.dateOfBirth,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelation,_that.estimatedDueDate,_that.healthcarePreference,_that.jarakKehamilanTerakhir,_that.jumlahAnak,_that.kecamatan,_that.kehamilanKe,_that.kelurahan,_that.kotaKabupaten,_that.lastMenstrualPeriod,_that.location,_that.miscarriageNumber,_that.namaLengkap,_that.nik,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.previousPregnancyComplications,_that.provinsi,_that.riwayatKesehatanIbu,_that.usiaKehamilan,_that.whatsappConsent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  int? age, @JsonKey(name: 'blood_type')  String? bloodType, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent, @JsonKey(name: 'date_of_birth')  String dateOfBirth, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation, @JsonKey(name: 'estimated_due_date')  String? estimatedDueDate, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak,  String kecamatan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe,  String? kelurahan, @JsonKey(name: 'kota_kabupaten')  String kotaKabupaten, @JsonKey(name: 'last_menstrual_period')  String? lastMenstrualPeriod,  List<double> location, @JsonKey(name: 'miscarriage_number')  int miscarriageNumber, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications,  String provinsi, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuData riwayatKesehatanIbu, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent)  $default,) {final _that = this;
switch (_that) {
case _IbuHamilData():
return $default(_that.address,_that.age,_that.bloodType,_that.dataSharingConsent,_that.dateOfBirth,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelation,_that.estimatedDueDate,_that.healthcarePreference,_that.jarakKehamilanTerakhir,_that.jumlahAnak,_that.kecamatan,_that.kehamilanKe,_that.kelurahan,_that.kotaKabupaten,_that.lastMenstrualPeriod,_that.location,_that.miscarriageNumber,_that.namaLengkap,_that.nik,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.previousPregnancyComplications,_that.provinsi,_that.riwayatKesehatanIbu,_that.usiaKehamilan,_that.whatsappConsent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  int? age, @JsonKey(name: 'blood_type')  String? bloodType, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent, @JsonKey(name: 'date_of_birth')  String dateOfBirth, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation, @JsonKey(name: 'estimated_due_date')  String? estimatedDueDate, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak,  String kecamatan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe,  String? kelurahan, @JsonKey(name: 'kota_kabupaten')  String kotaKabupaten, @JsonKey(name: 'last_menstrual_period')  String? lastMenstrualPeriod,  List<double> location, @JsonKey(name: 'miscarriage_number')  int miscarriageNumber, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications,  String provinsi, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuData riwayatKesehatanIbu, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent)?  $default,) {final _that = this;
switch (_that) {
case _IbuHamilData() when $default != null:
return $default(_that.address,_that.age,_that.bloodType,_that.dataSharingConsent,_that.dateOfBirth,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelation,_that.estimatedDueDate,_that.healthcarePreference,_that.jarakKehamilanTerakhir,_that.jumlahAnak,_that.kecamatan,_that.kehamilanKe,_that.kelurahan,_that.kotaKabupaten,_that.lastMenstrualPeriod,_that.location,_that.miscarriageNumber,_that.namaLengkap,_that.nik,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.previousPregnancyComplications,_that.provinsi,_that.riwayatKesehatanIbu,_that.usiaKehamilan,_that.whatsappConsent);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _IbuHamilData implements IbuHamilData {
  const _IbuHamilData({required this.address, this.age, @JsonKey(name: 'blood_type') this.bloodType, @JsonKey(name: 'data_sharing_consent') this.dataSharingConsent = false, @JsonKey(name: 'date_of_birth') required this.dateOfBirth, @JsonKey(name: 'emergency_contact_name') required this.emergencyContactName, @JsonKey(name: 'emergency_contact_phone') required this.emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation') this.emergencyContactRelation, @JsonKey(name: 'estimated_due_date') this.estimatedDueDate, @JsonKey(name: 'healthcare_preference') this.healthcarePreference, @JsonKey(name: 'jarak_kehamilan_terakhir') this.jarakKehamilanTerakhir, @JsonKey(name: 'jumlah_anak') this.jumlahAnak, required this.kecamatan, @JsonKey(name: 'kehamilan_ke') this.kehamilanKe, this.kelurahan, @JsonKey(name: 'kota_kabupaten') required this.kotaKabupaten, @JsonKey(name: 'last_menstrual_period') this.lastMenstrualPeriod, required final  List<double> location, @JsonKey(name: 'miscarriage_number') this.miscarriageNumber = 0, @JsonKey(name: 'nama_lengkap') required this.namaLengkap, required this.nik, @JsonKey(name: 'pernah_caesar') this.pernahCaesar = false, @JsonKey(name: 'pernah_perdarahan_saat_hamil') this.pernahPerdarahanSaatHamil = false, @JsonKey(name: 'previous_pregnancy_complications') this.previousPregnancyComplications, required this.provinsi, @JsonKey(name: 'riwayat_kesehatan_ibu') required this.riwayatKesehatanIbu, @JsonKey(name: 'usia_kehamilan') this.usiaKehamilan, @JsonKey(name: 'whatsapp_consent') this.whatsappConsent = false}): _location = location;
  factory _IbuHamilData.fromJson(Map<String, dynamic> json) => _$IbuHamilDataFromJson(json);

@override final  String address;
@override final  int? age;
@override@JsonKey(name: 'blood_type') final  String? bloodType;
@override@JsonKey(name: 'data_sharing_consent') final  bool dataSharingConsent;
@override@JsonKey(name: 'date_of_birth') final  String dateOfBirth;
@override@JsonKey(name: 'emergency_contact_name') final  String emergencyContactName;
@override@JsonKey(name: 'emergency_contact_phone') final  String emergencyContactPhone;
@override@JsonKey(name: 'emergency_contact_relation') final  String? emergencyContactRelation;
@override@JsonKey(name: 'estimated_due_date') final  String? estimatedDueDate;
@override@JsonKey(name: 'healthcare_preference') final  String? healthcarePreference;
@override@JsonKey(name: 'jarak_kehamilan_terakhir') final  String? jarakKehamilanTerakhir;
@override@JsonKey(name: 'jumlah_anak') final  int? jumlahAnak;
@override final  String kecamatan;
@override@JsonKey(name: 'kehamilan_ke') final  int? kehamilanKe;
@override final  String? kelurahan;
@override@JsonKey(name: 'kota_kabupaten') final  String kotaKabupaten;
@override@JsonKey(name: 'last_menstrual_period') final  String? lastMenstrualPeriod;
 final  List<double> _location;
@override List<double> get location {
  if (_location is EqualUnmodifiableListView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_location);
}

// [longitude, latitude]
@override@JsonKey(name: 'miscarriage_number') final  int miscarriageNumber;
@override@JsonKey(name: 'nama_lengkap') final  String namaLengkap;
@override final  String nik;
@override@JsonKey(name: 'pernah_caesar') final  bool pernahCaesar;
@override@JsonKey(name: 'pernah_perdarahan_saat_hamil') final  bool pernahPerdarahanSaatHamil;
@override@JsonKey(name: 'previous_pregnancy_complications') final  String? previousPregnancyComplications;
@override final  String provinsi;
@override@JsonKey(name: 'riwayat_kesehatan_ibu') final  RiwayatKesehatanIbuData riwayatKesehatanIbu;
@override@JsonKey(name: 'usia_kehamilan') final  int? usiaKehamilan;
@override@JsonKey(name: 'whatsapp_consent') final  bool whatsappConsent;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IbuHamilData&&(identical(other.address, address) || other.address == address)&&(identical(other.age, age) || other.age == age)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.emergencyContactRelation, emergencyContactRelation) || other.emergencyContactRelation == emergencyContactRelation)&&(identical(other.estimatedDueDate, estimatedDueDate) || other.estimatedDueDate == estimatedDueDate)&&(identical(other.healthcarePreference, healthcarePreference) || other.healthcarePreference == healthcarePreference)&&(identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) || other.jarakKehamilanTerakhir == jarakKehamilanTerakhir)&&(identical(other.jumlahAnak, jumlahAnak) || other.jumlahAnak == jumlahAnak)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.kehamilanKe, kehamilanKe) || other.kehamilanKe == kehamilanKe)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kotaKabupaten, kotaKabupaten) || other.kotaKabupaten == kotaKabupaten)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&const DeepCollectionEquality().equals(other._location, _location)&&(identical(other.miscarriageNumber, miscarriageNumber) || other.miscarriageNumber == miscarriageNumber)&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.pernahCaesar, pernahCaesar) || other.pernahCaesar == pernahCaesar)&&(identical(other.pernahPerdarahanSaatHamil, pernahPerdarahanSaatHamil) || other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil)&&(identical(other.previousPregnancyComplications, previousPregnancyComplications) || other.previousPregnancyComplications == previousPregnancyComplications)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) || other.riwayatKesehatanIbu == riwayatKesehatanIbu)&&(identical(other.usiaKehamilan, usiaKehamilan) || other.usiaKehamilan == usiaKehamilan)&&(identical(other.whatsappConsent, whatsappConsent) || other.whatsappConsent == whatsappConsent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,address,age,bloodType,dataSharingConsent,dateOfBirth,emergencyContactName,emergencyContactPhone,emergencyContactRelation,estimatedDueDate,healthcarePreference,jarakKehamilanTerakhir,jumlahAnak,kecamatan,kehamilanKe,kelurahan,kotaKabupaten,lastMenstrualPeriod,const DeepCollectionEquality().hash(_location),miscarriageNumber,namaLengkap,nik,pernahCaesar,pernahPerdarahanSaatHamil,previousPregnancyComplications,provinsi,riwayatKesehatanIbu,usiaKehamilan,whatsappConsent]);

@override
String toString() {
  return 'IbuHamilData(address: $address, age: $age, bloodType: $bloodType, dataSharingConsent: $dataSharingConsent, dateOfBirth: $dateOfBirth, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelation: $emergencyContactRelation, estimatedDueDate: $estimatedDueDate, healthcarePreference: $healthcarePreference, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, jumlahAnak: $jumlahAnak, kecamatan: $kecamatan, kehamilanKe: $kehamilanKe, kelurahan: $kelurahan, kotaKabupaten: $kotaKabupaten, lastMenstrualPeriod: $lastMenstrualPeriod, location: $location, miscarriageNumber: $miscarriageNumber, namaLengkap: $namaLengkap, nik: $nik, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, previousPregnancyComplications: $previousPregnancyComplications, provinsi: $provinsi, riwayatKesehatanIbu: $riwayatKesehatanIbu, usiaKehamilan: $usiaKehamilan, whatsappConsent: $whatsappConsent)';
}


}

/// @nodoc
abstract mixin class _$IbuHamilDataCopyWith<$Res> implements $IbuHamilDataCopyWith<$Res> {
  factory _$IbuHamilDataCopyWith(_IbuHamilData value, $Res Function(_IbuHamilData) _then) = __$IbuHamilDataCopyWithImpl;
@override @useResult
$Res call({
 String address, int? age,@JsonKey(name: 'blood_type') String? bloodType,@JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,@JsonKey(name: 'date_of_birth') String dateOfBirth,@JsonKey(name: 'emergency_contact_name') String emergencyContactName,@JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,@JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation,@JsonKey(name: 'estimated_due_date') String? estimatedDueDate,@JsonKey(name: 'healthcare_preference') String? healthcarePreference,@JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,@JsonKey(name: 'jumlah_anak') int? jumlahAnak, String kecamatan,@JsonKey(name: 'kehamilan_ke') int? kehamilanKe, String? kelurahan,@JsonKey(name: 'kota_kabupaten') String kotaKabupaten,@JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod, List<double> location,@JsonKey(name: 'miscarriage_number') int miscarriageNumber,@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik,@JsonKey(name: 'pernah_caesar') bool pernahCaesar,@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool pernahPerdarahanSaatHamil,@JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications, String provinsi,@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuData riwayatKesehatanIbu,@JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,@JsonKey(name: 'whatsapp_consent') bool whatsappConsent
});


@override $RiwayatKesehatanIbuDataCopyWith<$Res> get riwayatKesehatanIbu;

}
/// @nodoc
class __$IbuHamilDataCopyWithImpl<$Res>
    implements _$IbuHamilDataCopyWith<$Res> {
  __$IbuHamilDataCopyWithImpl(this._self, this._then);

  final _IbuHamilData _self;
  final $Res Function(_IbuHamilData) _then;

/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? age = freezed,Object? bloodType = freezed,Object? dataSharingConsent = null,Object? dateOfBirth = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? emergencyContactRelation = freezed,Object? estimatedDueDate = freezed,Object? healthcarePreference = freezed,Object? jarakKehamilanTerakhir = freezed,Object? jumlahAnak = freezed,Object? kecamatan = null,Object? kehamilanKe = freezed,Object? kelurahan = freezed,Object? kotaKabupaten = null,Object? lastMenstrualPeriod = freezed,Object? location = null,Object? miscarriageNumber = null,Object? namaLengkap = null,Object? nik = null,Object? pernahCaesar = null,Object? pernahPerdarahanSaatHamil = null,Object? previousPregnancyComplications = freezed,Object? provinsi = null,Object? riwayatKesehatanIbu = null,Object? usiaKehamilan = freezed,Object? whatsappConsent = null,}) {
  return _then(_IbuHamilData(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,emergencyContactRelation: freezed == emergencyContactRelation ? _self.emergencyContactRelation : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
as String?,estimatedDueDate: freezed == estimatedDueDate ? _self.estimatedDueDate : estimatedDueDate // ignore: cast_nullable_to_non_nullable
as String?,healthcarePreference: freezed == healthcarePreference ? _self.healthcarePreference : healthcarePreference // ignore: cast_nullable_to_non_nullable
as String?,jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir ? _self.jarakKehamilanTerakhir : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
as String?,jumlahAnak: freezed == jumlahAnak ? _self.jumlahAnak : jumlahAnak // ignore: cast_nullable_to_non_nullable
as int?,kecamatan: null == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String,kehamilanKe: freezed == kehamilanKe ? _self.kehamilanKe : kehamilanKe // ignore: cast_nullable_to_non_nullable
as int?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,kotaKabupaten: null == kotaKabupaten ? _self.kotaKabupaten : kotaKabupaten // ignore: cast_nullable_to_non_nullable
as String,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as String?,location: null == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<double>,miscarriageNumber: null == miscarriageNumber ? _self.miscarriageNumber : miscarriageNumber // ignore: cast_nullable_to_non_nullable
as int,namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,pernahCaesar: null == pernahCaesar ? _self.pernahCaesar : pernahCaesar // ignore: cast_nullable_to_non_nullable
as bool,pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil ? _self.pernahPerdarahanSaatHamil : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
as bool,previousPregnancyComplications: freezed == previousPregnancyComplications ? _self.previousPregnancyComplications : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
as String?,provinsi: null == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String,riwayatKesehatanIbu: null == riwayatKesehatanIbu ? _self.riwayatKesehatanIbu : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
as RiwayatKesehatanIbuData,usiaKehamilan: freezed == usiaKehamilan ? _self.usiaKehamilan : usiaKehamilan // ignore: cast_nullable_to_non_nullable
as int?,whatsappConsent: null == whatsappConsent ? _self.whatsappConsent : whatsappConsent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of IbuHamilData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuDataCopyWith<$Res> get riwayatKesehatanIbu {
  
  return $RiwayatKesehatanIbuDataCopyWith<$Res>(_self.riwayatKesehatanIbu, (value) {
    return _then(_self.copyWith(riwayatKesehatanIbu: value));
  });
}
}


/// @nodoc
mixin _$RiwayatKesehatanIbuData {

 bool get anemia; bool get asma;@JsonKey(name: 'darah_tinggi') bool get darahTinggi; bool get diabetes;@JsonKey(name: 'penyakit_ginjal') bool get penyakitGinjal;@JsonKey(name: 'penyakit_jantung') bool get penyakitJantung;@JsonKey(name: 'tbc_malaria') bool get tbcMalaria;
/// Create a copy of RiwayatKesehatanIbuData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuDataCopyWith<RiwayatKesehatanIbuData> get copyWith => _$RiwayatKesehatanIbuDataCopyWithImpl<RiwayatKesehatanIbuData>(this as RiwayatKesehatanIbuData, _$identity);

  /// Serializes this RiwayatKesehatanIbuData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RiwayatKesehatanIbuData&&(identical(other.anemia, anemia) || other.anemia == anemia)&&(identical(other.asma, asma) || other.asma == asma)&&(identical(other.darahTinggi, darahTinggi) || other.darahTinggi == darahTinggi)&&(identical(other.diabetes, diabetes) || other.diabetes == diabetes)&&(identical(other.penyakitGinjal, penyakitGinjal) || other.penyakitGinjal == penyakitGinjal)&&(identical(other.penyakitJantung, penyakitJantung) || other.penyakitJantung == penyakitJantung)&&(identical(other.tbcMalaria, tbcMalaria) || other.tbcMalaria == tbcMalaria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anemia,asma,darahTinggi,diabetes,penyakitGinjal,penyakitJantung,tbcMalaria);

@override
String toString() {
  return 'RiwayatKesehatanIbuData(anemia: $anemia, asma: $asma, darahTinggi: $darahTinggi, diabetes: $diabetes, penyakitGinjal: $penyakitGinjal, penyakitJantung: $penyakitJantung, tbcMalaria: $tbcMalaria)';
}


}

/// @nodoc
abstract mixin class $RiwayatKesehatanIbuDataCopyWith<$Res>  {
  factory $RiwayatKesehatanIbuDataCopyWith(RiwayatKesehatanIbuData value, $Res Function(RiwayatKesehatanIbuData) _then) = _$RiwayatKesehatanIbuDataCopyWithImpl;
@useResult
$Res call({
 bool anemia, bool asma,@JsonKey(name: 'darah_tinggi') bool darahTinggi, bool diabetes,@JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,@JsonKey(name: 'penyakit_jantung') bool penyakitJantung,@JsonKey(name: 'tbc_malaria') bool tbcMalaria
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
@pragma('vm:prefer-inline') @override $Res call({Object? anemia = null,Object? asma = null,Object? darahTinggi = null,Object? diabetes = null,Object? penyakitGinjal = null,Object? penyakitJantung = null,Object? tbcMalaria = null,}) {
  return _then(_self.copyWith(
anemia: null == anemia ? _self.anemia : anemia // ignore: cast_nullable_to_non_nullable
as bool,asma: null == asma ? _self.asma : asma // ignore: cast_nullable_to_non_nullable
as bool,darahTinggi: null == darahTinggi ? _self.darahTinggi : darahTinggi // ignore: cast_nullable_to_non_nullable
as bool,diabetes: null == diabetes ? _self.diabetes : diabetes // ignore: cast_nullable_to_non_nullable
as bool,penyakitGinjal: null == penyakitGinjal ? _self.penyakitGinjal : penyakitGinjal // ignore: cast_nullable_to_non_nullable
as bool,penyakitJantung: null == penyakitJantung ? _self.penyakitJantung : penyakitJantung // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool anemia,  bool asma, @JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData() when $default != null:
return $default(_that.anemia,_that.asma,_that.darahTinggi,_that.diabetes,_that.penyakitGinjal,_that.penyakitJantung,_that.tbcMalaria);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool anemia,  bool asma, @JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)  $default,) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData():
return $default(_that.anemia,_that.asma,_that.darahTinggi,_that.diabetes,_that.penyakitGinjal,_that.penyakitJantung,_that.tbcMalaria);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool anemia,  bool asma, @JsonKey(name: 'darah_tinggi')  bool darahTinggi,  bool diabetes, @JsonKey(name: 'penyakit_ginjal')  bool penyakitGinjal, @JsonKey(name: 'penyakit_jantung')  bool penyakitJantung, @JsonKey(name: 'tbc_malaria')  bool tbcMalaria)?  $default,) {final _that = this;
switch (_that) {
case _RiwayatKesehatanIbuData() when $default != null:
return $default(_that.anemia,_that.asma,_that.darahTinggi,_that.diabetes,_that.penyakitGinjal,_that.penyakitJantung,_that.tbcMalaria);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RiwayatKesehatanIbuData implements RiwayatKesehatanIbuData {
  const _RiwayatKesehatanIbuData({this.anemia = false, this.asma = false, @JsonKey(name: 'darah_tinggi') this.darahTinggi = false, this.diabetes = false, @JsonKey(name: 'penyakit_ginjal') this.penyakitGinjal = false, @JsonKey(name: 'penyakit_jantung') this.penyakitJantung = false, @JsonKey(name: 'tbc_malaria') this.tbcMalaria = false});
  factory _RiwayatKesehatanIbuData.fromJson(Map<String, dynamic> json) => _$RiwayatKesehatanIbuDataFromJson(json);

@override@JsonKey() final  bool anemia;
@override@JsonKey() final  bool asma;
@override@JsonKey(name: 'darah_tinggi') final  bool darahTinggi;
@override@JsonKey() final  bool diabetes;
@override@JsonKey(name: 'penyakit_ginjal') final  bool penyakitGinjal;
@override@JsonKey(name: 'penyakit_jantung') final  bool penyakitJantung;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RiwayatKesehatanIbuData&&(identical(other.anemia, anemia) || other.anemia == anemia)&&(identical(other.asma, asma) || other.asma == asma)&&(identical(other.darahTinggi, darahTinggi) || other.darahTinggi == darahTinggi)&&(identical(other.diabetes, diabetes) || other.diabetes == diabetes)&&(identical(other.penyakitGinjal, penyakitGinjal) || other.penyakitGinjal == penyakitGinjal)&&(identical(other.penyakitJantung, penyakitJantung) || other.penyakitJantung == penyakitJantung)&&(identical(other.tbcMalaria, tbcMalaria) || other.tbcMalaria == tbcMalaria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anemia,asma,darahTinggi,diabetes,penyakitGinjal,penyakitJantung,tbcMalaria);

@override
String toString() {
  return 'RiwayatKesehatanIbuData(anemia: $anemia, asma: $asma, darahTinggi: $darahTinggi, diabetes: $diabetes, penyakitGinjal: $penyakitGinjal, penyakitJantung: $penyakitJantung, tbcMalaria: $tbcMalaria)';
}


}

/// @nodoc
abstract mixin class _$RiwayatKesehatanIbuDataCopyWith<$Res> implements $RiwayatKesehatanIbuDataCopyWith<$Res> {
  factory _$RiwayatKesehatanIbuDataCopyWith(_RiwayatKesehatanIbuData value, $Res Function(_RiwayatKesehatanIbuData) _then) = __$RiwayatKesehatanIbuDataCopyWithImpl;
@override @useResult
$Res call({
 bool anemia, bool asma,@JsonKey(name: 'darah_tinggi') bool darahTinggi, bool diabetes,@JsonKey(name: 'penyakit_ginjal') bool penyakitGinjal,@JsonKey(name: 'penyakit_jantung') bool penyakitJantung,@JsonKey(name: 'tbc_malaria') bool tbcMalaria
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
@override @pragma('vm:prefer-inline') $Res call({Object? anemia = null,Object? asma = null,Object? darahTinggi = null,Object? diabetes = null,Object? penyakitGinjal = null,Object? penyakitJantung = null,Object? tbcMalaria = null,}) {
  return _then(_RiwayatKesehatanIbuData(
anemia: null == anemia ? _self.anemia : anemia // ignore: cast_nullable_to_non_nullable
as bool,asma: null == asma ? _self.asma : asma // ignore: cast_nullable_to_non_nullable
as bool,darahTinggi: null == darahTinggi ? _self.darahTinggi : darahTinggi // ignore: cast_nullable_to_non_nullable
as bool,diabetes: null == diabetes ? _self.diabetes : diabetes // ignore: cast_nullable_to_non_nullable
as bool,penyakitGinjal: null == penyakitGinjal ? _self.penyakitGinjal : penyakitGinjal // ignore: cast_nullable_to_non_nullable
as bool,penyakitJantung: null == penyakitJantung ? _self.penyakitJantung : penyakitJantung // ignore: cast_nullable_to_non_nullable
as bool,tbcMalaria: null == tbcMalaria ? _self.tbcMalaria : tbcMalaria // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserData {

 String get email;// Required: email must be provided
@JsonKey(name: 'full_name') String get fullName; String get password; String get phone; String get role;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,fullName,password,phone,role);

@override
String toString() {
  return 'UserData(email: $email, fullName: $fullName, password: $password, phone: $phone, role: $role)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 String email,@JsonKey(name: 'full_name') String fullName, String password, String phone, String role
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
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? fullName = null,Object? password = null,Object? phone = null,Object? role = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'full_name')  String fullName,  String password,  String phone,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.email,_that.fullName,_that.password,_that.phone,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'full_name')  String fullName,  String password,  String phone,  String role)  $default,) {final _that = this;
switch (_that) {
case _UserData():
return $default(_that.email,_that.fullName,_that.password,_that.phone,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email, @JsonKey(name: 'full_name')  String fullName,  String password,  String phone,  String role)?  $default,) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.email,_that.fullName,_that.password,_that.phone,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserData implements UserData {
  const _UserData({required this.email, @JsonKey(name: 'full_name') required this.fullName, required this.password, required this.phone, required this.role});
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override final  String email;
// Required: email must be provided
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String password;
@override final  String phone;
@override final  String role;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,fullName,password,phone,role);

@override
String toString() {
  return 'UserData(email: $email, fullName: $fullName, password: $password, phone: $phone, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 String email,@JsonKey(name: 'full_name') String fullName, String password, String phone, String role
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
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? fullName = null,Object? password = null,Object? phone = null,Object? role = null,}) {
  return _then(_UserData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
