// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ibu_hamil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IbuHamilModel {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'nama_lengkap') String get namaLengkap; String get nik;// 16 digit
@JsonKey(name: 'date_of_birth') DateTime get dateOfBirth;@JsonKey(name: 'profile_photo_url') String? get profilePhotoUrl;// Alamat & Lokasi
 String get address; Location get location;// longitude & latitude
 String? get provinsi;@JsonKey(name: 'kota_kabupaten') String? get kotaKabupaten; String? get kelurahan; String? get kecamatan;@JsonKey(name: 'rt_rw') String? get rtRw;// Data Kehamilan
@JsonKey(name: 'last_menstrual_period') DateTime? get lastMenstrualPeriod;// HPHT
@JsonKey(name: 'estimated_due_date') DateTime? get estimatedDueDate;// HPL
@JsonKey(name: 'usia_kehamilan') int? get usiaKehamilan;// minggu
@JsonKey(name: 'kehamilan_ke') int? get kehamilanKe;@JsonKey(name: 'jumlah_anak') int? get jumlahAnak;@JsonKey(name: 'jarak_kehamilan_terakhir') String? get jarakKehamilanTerakhir;@JsonKey(name: 'miscarriage_number') int? get miscarriageNumber;@JsonKey(name: 'previous_pregnancy_complications') String? get previousPregnancyComplications;@JsonKey(name: 'pernah_caesar') bool get pernahCaesar;@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool get pernahPerdarahanSaatHamil;// Riwayat Kesehatan (nested object)
@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuModel get riwayatKesehatanIbu;// Kontak Darurat
@JsonKey(name: 'emergency_contact_name') String get emergencyContactName;@JsonKey(name: 'emergency_contact_phone') String get emergencyContactPhone;@JsonKey(name: 'emergency_contact_relation') String? get emergencyContactRelation;// Data Tambahan
 int? get age;@JsonKey(name: 'blood_type') String? get bloodType;@JsonKey(name: 'height_cm') double? get heightCm;@JsonKey(name: 'pre_pregnancy_weight_kg') double? get prePregnancyWeightKg;@JsonKey(name: 'medical_history') String? get medicalHistory;@JsonKey(name: 'current_medications') String? get currentMedications;@JsonKey(name: 'risk_level') String? get riskLevel;// 'low', 'normal', 'high'
@JsonKey(name: 'healthcare_preference') String? get healthcarePreference;@JsonKey(name: 'whatsapp_consent') bool get whatsappConsent;@JsonKey(name: 'data_sharing_consent') bool get dataSharingConsent;// Assignment (opsional untuk mobile)
@JsonKey(name: 'puskesmas_id') int? get puskesmasId;@JsonKey(name: 'perawat_id') int? get perawatId;@JsonKey(name: 'assignment_date') DateTime? get assignmentDate;@JsonKey(name: 'assignment_distance_km') double? get assignmentDistanceKm;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IbuHamilModelCopyWith<IbuHamilModel> get copyWith => _$IbuHamilModelCopyWithImpl<IbuHamilModel>(this as IbuHamilModel, _$identity);

  /// Serializes this IbuHamilModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IbuHamilModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.kotaKabupaten, kotaKabupaten) || other.kotaKabupaten == kotaKabupaten)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.rtRw, rtRw) || other.rtRw == rtRw)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&(identical(other.estimatedDueDate, estimatedDueDate) || other.estimatedDueDate == estimatedDueDate)&&(identical(other.usiaKehamilan, usiaKehamilan) || other.usiaKehamilan == usiaKehamilan)&&(identical(other.kehamilanKe, kehamilanKe) || other.kehamilanKe == kehamilanKe)&&(identical(other.jumlahAnak, jumlahAnak) || other.jumlahAnak == jumlahAnak)&&(identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) || other.jarakKehamilanTerakhir == jarakKehamilanTerakhir)&&(identical(other.miscarriageNumber, miscarriageNumber) || other.miscarriageNumber == miscarriageNumber)&&(identical(other.previousPregnancyComplications, previousPregnancyComplications) || other.previousPregnancyComplications == previousPregnancyComplications)&&(identical(other.pernahCaesar, pernahCaesar) || other.pernahCaesar == pernahCaesar)&&(identical(other.pernahPerdarahanSaatHamil, pernahPerdarahanSaatHamil) || other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil)&&(identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) || other.riwayatKesehatanIbu == riwayatKesehatanIbu)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.emergencyContactRelation, emergencyContactRelation) || other.emergencyContactRelation == emergencyContactRelation)&&(identical(other.age, age) || other.age == age)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.prePregnancyWeightKg, prePregnancyWeightKg) || other.prePregnancyWeightKg == prePregnancyWeightKg)&&(identical(other.medicalHistory, medicalHistory) || other.medicalHistory == medicalHistory)&&(identical(other.currentMedications, currentMedications) || other.currentMedications == currentMedications)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.healthcarePreference, healthcarePreference) || other.healthcarePreference == healthcarePreference)&&(identical(other.whatsappConsent, whatsappConsent) || other.whatsappConsent == whatsappConsent)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent)&&(identical(other.puskesmasId, puskesmasId) || other.puskesmasId == puskesmasId)&&(identical(other.perawatId, perawatId) || other.perawatId == perawatId)&&(identical(other.assignmentDate, assignmentDate) || other.assignmentDate == assignmentDate)&&(identical(other.assignmentDistanceKm, assignmentDistanceKm) || other.assignmentDistanceKm == assignmentDistanceKm)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,namaLengkap,nik,dateOfBirth,profilePhotoUrl,address,location,provinsi,kotaKabupaten,kelurahan,kecamatan,rtRw,lastMenstrualPeriod,estimatedDueDate,usiaKehamilan,kehamilanKe,jumlahAnak,jarakKehamilanTerakhir,miscarriageNumber,previousPregnancyComplications,pernahCaesar,pernahPerdarahanSaatHamil,riwayatKesehatanIbu,emergencyContactName,emergencyContactPhone,emergencyContactRelation,age,bloodType,heightCm,prePregnancyWeightKg,medicalHistory,currentMedications,riskLevel,healthcarePreference,whatsappConsent,dataSharingConsent,puskesmasId,perawatId,assignmentDate,assignmentDistanceKm,isActive,createdAt,updatedAt]);

@override
String toString() {
  return 'IbuHamilModel(id: $id, userId: $userId, namaLengkap: $namaLengkap, nik: $nik, dateOfBirth: $dateOfBirth, profilePhotoUrl: $profilePhotoUrl, address: $address, location: $location, provinsi: $provinsi, kotaKabupaten: $kotaKabupaten, kelurahan: $kelurahan, kecamatan: $kecamatan, rtRw: $rtRw, lastMenstrualPeriod: $lastMenstrualPeriod, estimatedDueDate: $estimatedDueDate, usiaKehamilan: $usiaKehamilan, kehamilanKe: $kehamilanKe, jumlahAnak: $jumlahAnak, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, miscarriageNumber: $miscarriageNumber, previousPregnancyComplications: $previousPregnancyComplications, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, riwayatKesehatanIbu: $riwayatKesehatanIbu, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelation: $emergencyContactRelation, age: $age, bloodType: $bloodType, heightCm: $heightCm, prePregnancyWeightKg: $prePregnancyWeightKg, medicalHistory: $medicalHistory, currentMedications: $currentMedications, riskLevel: $riskLevel, healthcarePreference: $healthcarePreference, whatsappConsent: $whatsappConsent, dataSharingConsent: $dataSharingConsent, puskesmasId: $puskesmasId, perawatId: $perawatId, assignmentDate: $assignmentDate, assignmentDistanceKm: $assignmentDistanceKm, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IbuHamilModelCopyWith<$Res>  {
  factory $IbuHamilModelCopyWith(IbuHamilModel value, $Res Function(IbuHamilModel) _then) = _$IbuHamilModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik,@JsonKey(name: 'date_of_birth') DateTime dateOfBirth,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl, String address, Location location, String? provinsi,@JsonKey(name: 'kota_kabupaten') String? kotaKabupaten, String? kelurahan, String? kecamatan,@JsonKey(name: 'rt_rw') String? rtRw,@JsonKey(name: 'last_menstrual_period') DateTime? lastMenstrualPeriod,@JsonKey(name: 'estimated_due_date') DateTime? estimatedDueDate,@JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,@JsonKey(name: 'kehamilan_ke') int? kehamilanKe,@JsonKey(name: 'jumlah_anak') int? jumlahAnak,@JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,@JsonKey(name: 'miscarriage_number') int? miscarriageNumber,@JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications,@JsonKey(name: 'pernah_caesar') bool pernahCaesar,@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool pernahPerdarahanSaatHamil,@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuModel riwayatKesehatanIbu,@JsonKey(name: 'emergency_contact_name') String emergencyContactName,@JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,@JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation, int? age,@JsonKey(name: 'blood_type') String? bloodType,@JsonKey(name: 'height_cm') double? heightCm,@JsonKey(name: 'pre_pregnancy_weight_kg') double? prePregnancyWeightKg,@JsonKey(name: 'medical_history') String? medicalHistory,@JsonKey(name: 'current_medications') String? currentMedications,@JsonKey(name: 'risk_level') String? riskLevel,@JsonKey(name: 'healthcare_preference') String? healthcarePreference,@JsonKey(name: 'whatsapp_consent') bool whatsappConsent,@JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,@JsonKey(name: 'puskesmas_id') int? puskesmasId,@JsonKey(name: 'perawat_id') int? perawatId,@JsonKey(name: 'assignment_date') DateTime? assignmentDate,@JsonKey(name: 'assignment_distance_km') double? assignmentDistanceKm,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


$LocationCopyWith<$Res> get location;$RiwayatKesehatanIbuModelCopyWith<$Res> get riwayatKesehatanIbu;

}
/// @nodoc
class _$IbuHamilModelCopyWithImpl<$Res>
    implements $IbuHamilModelCopyWith<$Res> {
  _$IbuHamilModelCopyWithImpl(this._self, this._then);

  final IbuHamilModel _self;
  final $Res Function(IbuHamilModel) _then;

/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? namaLengkap = null,Object? nik = null,Object? dateOfBirth = null,Object? profilePhotoUrl = freezed,Object? address = null,Object? location = null,Object? provinsi = freezed,Object? kotaKabupaten = freezed,Object? kelurahan = freezed,Object? kecamatan = freezed,Object? rtRw = freezed,Object? lastMenstrualPeriod = freezed,Object? estimatedDueDate = freezed,Object? usiaKehamilan = freezed,Object? kehamilanKe = freezed,Object? jumlahAnak = freezed,Object? jarakKehamilanTerakhir = freezed,Object? miscarriageNumber = freezed,Object? previousPregnancyComplications = freezed,Object? pernahCaesar = null,Object? pernahPerdarahanSaatHamil = null,Object? riwayatKesehatanIbu = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? emergencyContactRelation = freezed,Object? age = freezed,Object? bloodType = freezed,Object? heightCm = freezed,Object? prePregnancyWeightKg = freezed,Object? medicalHistory = freezed,Object? currentMedications = freezed,Object? riskLevel = freezed,Object? healthcarePreference = freezed,Object? whatsappConsent = null,Object? dataSharingConsent = null,Object? puskesmasId = freezed,Object? perawatId = freezed,Object? assignmentDate = freezed,Object? assignmentDistanceKm = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,provinsi: freezed == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String?,kotaKabupaten: freezed == kotaKabupaten ? _self.kotaKabupaten : kotaKabupaten // ignore: cast_nullable_to_non_nullable
as String?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,kecamatan: freezed == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String?,rtRw: freezed == rtRw ? _self.rtRw : rtRw // ignore: cast_nullable_to_non_nullable
as String?,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDueDate: freezed == estimatedDueDate ? _self.estimatedDueDate : estimatedDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,usiaKehamilan: freezed == usiaKehamilan ? _self.usiaKehamilan : usiaKehamilan // ignore: cast_nullable_to_non_nullable
as int?,kehamilanKe: freezed == kehamilanKe ? _self.kehamilanKe : kehamilanKe // ignore: cast_nullable_to_non_nullable
as int?,jumlahAnak: freezed == jumlahAnak ? _self.jumlahAnak : jumlahAnak // ignore: cast_nullable_to_non_nullable
as int?,jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir ? _self.jarakKehamilanTerakhir : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
as String?,miscarriageNumber: freezed == miscarriageNumber ? _self.miscarriageNumber : miscarriageNumber // ignore: cast_nullable_to_non_nullable
as int?,previousPregnancyComplications: freezed == previousPregnancyComplications ? _self.previousPregnancyComplications : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
as String?,pernahCaesar: null == pernahCaesar ? _self.pernahCaesar : pernahCaesar // ignore: cast_nullable_to_non_nullable
as bool,pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil ? _self.pernahPerdarahanSaatHamil : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
as bool,riwayatKesehatanIbu: null == riwayatKesehatanIbu ? _self.riwayatKesehatanIbu : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
as RiwayatKesehatanIbuModel,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,emergencyContactRelation: freezed == emergencyContactRelation ? _self.emergencyContactRelation : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double?,prePregnancyWeightKg: freezed == prePregnancyWeightKg ? _self.prePregnancyWeightKg : prePregnancyWeightKg // ignore: cast_nullable_to_non_nullable
as double?,medicalHistory: freezed == medicalHistory ? _self.medicalHistory : medicalHistory // ignore: cast_nullable_to_non_nullable
as String?,currentMedications: freezed == currentMedications ? _self.currentMedications : currentMedications // ignore: cast_nullable_to_non_nullable
as String?,riskLevel: freezed == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String?,healthcarePreference: freezed == healthcarePreference ? _self.healthcarePreference : healthcarePreference // ignore: cast_nullable_to_non_nullable
as String?,whatsappConsent: null == whatsappConsent ? _self.whatsappConsent : whatsappConsent // ignore: cast_nullable_to_non_nullable
as bool,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,puskesmasId: freezed == puskesmasId ? _self.puskesmasId : puskesmasId // ignore: cast_nullable_to_non_nullable
as int?,perawatId: freezed == perawatId ? _self.perawatId : perawatId // ignore: cast_nullable_to_non_nullable
as int?,assignmentDate: freezed == assignmentDate ? _self.assignmentDate : assignmentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,assignmentDistanceKm: freezed == assignmentDistanceKm ? _self.assignmentDistanceKm : assignmentDistanceKm // ignore: cast_nullable_to_non_nullable
as double?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuModelCopyWith<$Res> get riwayatKesehatanIbu {
  
  return $RiwayatKesehatanIbuModelCopyWith<$Res>(_self.riwayatKesehatanIbu, (value) {
    return _then(_self.copyWith(riwayatKesehatanIbu: value));
  });
}
}


/// Adds pattern-matching-related methods to [IbuHamilModel].
extension IbuHamilModelPatterns on IbuHamilModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IbuHamilModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IbuHamilModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IbuHamilModel value)  $default,){
final _that = this;
switch (_that) {
case _IbuHamilModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IbuHamilModel value)?  $default,){
final _that = this;
switch (_that) {
case _IbuHamilModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'date_of_birth')  DateTime dateOfBirth, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl,  String address,  Location location,  String? provinsi, @JsonKey(name: 'kota_kabupaten')  String? kotaKabupaten,  String? kelurahan,  String? kecamatan, @JsonKey(name: 'rt_rw')  String? rtRw, @JsonKey(name: 'last_menstrual_period')  DateTime? lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date')  DateTime? estimatedDueDate, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number')  int? miscarriageNumber, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuModel riwayatKesehatanIbu, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation,  int? age, @JsonKey(name: 'blood_type')  String? bloodType, @JsonKey(name: 'height_cm')  double? heightCm, @JsonKey(name: 'pre_pregnancy_weight_kg')  double? prePregnancyWeightKg, @JsonKey(name: 'medical_history')  String? medicalHistory, @JsonKey(name: 'current_medications')  String? currentMedications, @JsonKey(name: 'risk_level')  String? riskLevel, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent, @JsonKey(name: 'puskesmas_id')  int? puskesmasId, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'assignment_date')  DateTime? assignmentDate, @JsonKey(name: 'assignment_distance_km')  double? assignmentDistanceKm, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IbuHamilModel() when $default != null:
return $default(_that.id,_that.userId,_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.profilePhotoUrl,_that.address,_that.location,_that.provinsi,_that.kotaKabupaten,_that.kelurahan,_that.kecamatan,_that.rtRw,_that.lastMenstrualPeriod,_that.estimatedDueDate,_that.usiaKehamilan,_that.kehamilanKe,_that.jumlahAnak,_that.jarakKehamilanTerakhir,_that.miscarriageNumber,_that.previousPregnancyComplications,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.riwayatKesehatanIbu,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelation,_that.age,_that.bloodType,_that.heightCm,_that.prePregnancyWeightKg,_that.medicalHistory,_that.currentMedications,_that.riskLevel,_that.healthcarePreference,_that.whatsappConsent,_that.dataSharingConsent,_that.puskesmasId,_that.perawatId,_that.assignmentDate,_that.assignmentDistanceKm,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'date_of_birth')  DateTime dateOfBirth, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl,  String address,  Location location,  String? provinsi, @JsonKey(name: 'kota_kabupaten')  String? kotaKabupaten,  String? kelurahan,  String? kecamatan, @JsonKey(name: 'rt_rw')  String? rtRw, @JsonKey(name: 'last_menstrual_period')  DateTime? lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date')  DateTime? estimatedDueDate, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number')  int? miscarriageNumber, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuModel riwayatKesehatanIbu, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation,  int? age, @JsonKey(name: 'blood_type')  String? bloodType, @JsonKey(name: 'height_cm')  double? heightCm, @JsonKey(name: 'pre_pregnancy_weight_kg')  double? prePregnancyWeightKg, @JsonKey(name: 'medical_history')  String? medicalHistory, @JsonKey(name: 'current_medications')  String? currentMedications, @JsonKey(name: 'risk_level')  String? riskLevel, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent, @JsonKey(name: 'puskesmas_id')  int? puskesmasId, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'assignment_date')  DateTime? assignmentDate, @JsonKey(name: 'assignment_distance_km')  double? assignmentDistanceKm, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _IbuHamilModel():
return $default(_that.id,_that.userId,_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.profilePhotoUrl,_that.address,_that.location,_that.provinsi,_that.kotaKabupaten,_that.kelurahan,_that.kecamatan,_that.rtRw,_that.lastMenstrualPeriod,_that.estimatedDueDate,_that.usiaKehamilan,_that.kehamilanKe,_that.jumlahAnak,_that.jarakKehamilanTerakhir,_that.miscarriageNumber,_that.previousPregnancyComplications,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.riwayatKesehatanIbu,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelation,_that.age,_that.bloodType,_that.heightCm,_that.prePregnancyWeightKg,_that.medicalHistory,_that.currentMedications,_that.riskLevel,_that.healthcarePreference,_that.whatsappConsent,_that.dataSharingConsent,_that.puskesmasId,_that.perawatId,_that.assignmentDate,_that.assignmentDistanceKm,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik, @JsonKey(name: 'date_of_birth')  DateTime dateOfBirth, @JsonKey(name: 'profile_photo_url')  String? profilePhotoUrl,  String address,  Location location,  String? provinsi, @JsonKey(name: 'kota_kabupaten')  String? kotaKabupaten,  String? kelurahan,  String? kecamatan, @JsonKey(name: 'rt_rw')  String? rtRw, @JsonKey(name: 'last_menstrual_period')  DateTime? lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date')  DateTime? estimatedDueDate, @JsonKey(name: 'usia_kehamilan')  int? usiaKehamilan, @JsonKey(name: 'kehamilan_ke')  int? kehamilanKe, @JsonKey(name: 'jumlah_anak')  int? jumlahAnak, @JsonKey(name: 'jarak_kehamilan_terakhir')  String? jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number')  int? miscarriageNumber, @JsonKey(name: 'previous_pregnancy_complications')  String? previousPregnancyComplications, @JsonKey(name: 'pernah_caesar')  bool pernahCaesar, @JsonKey(name: 'pernah_perdarahan_saat_hamil')  bool pernahPerdarahanSaatHamil, @JsonKey(name: 'riwayat_kesehatan_ibu')  RiwayatKesehatanIbuModel riwayatKesehatanIbu, @JsonKey(name: 'emergency_contact_name')  String emergencyContactName, @JsonKey(name: 'emergency_contact_phone')  String emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation')  String? emergencyContactRelation,  int? age, @JsonKey(name: 'blood_type')  String? bloodType, @JsonKey(name: 'height_cm')  double? heightCm, @JsonKey(name: 'pre_pregnancy_weight_kg')  double? prePregnancyWeightKg, @JsonKey(name: 'medical_history')  String? medicalHistory, @JsonKey(name: 'current_medications')  String? currentMedications, @JsonKey(name: 'risk_level')  String? riskLevel, @JsonKey(name: 'healthcare_preference')  String? healthcarePreference, @JsonKey(name: 'whatsapp_consent')  bool whatsappConsent, @JsonKey(name: 'data_sharing_consent')  bool dataSharingConsent, @JsonKey(name: 'puskesmas_id')  int? puskesmasId, @JsonKey(name: 'perawat_id')  int? perawatId, @JsonKey(name: 'assignment_date')  DateTime? assignmentDate, @JsonKey(name: 'assignment_distance_km')  double? assignmentDistanceKm, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _IbuHamilModel() when $default != null:
return $default(_that.id,_that.userId,_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.profilePhotoUrl,_that.address,_that.location,_that.provinsi,_that.kotaKabupaten,_that.kelurahan,_that.kecamatan,_that.rtRw,_that.lastMenstrualPeriod,_that.estimatedDueDate,_that.usiaKehamilan,_that.kehamilanKe,_that.jumlahAnak,_that.jarakKehamilanTerakhir,_that.miscarriageNumber,_that.previousPregnancyComplications,_that.pernahCaesar,_that.pernahPerdarahanSaatHamil,_that.riwayatKesehatanIbu,_that.emergencyContactName,_that.emergencyContactPhone,_that.emergencyContactRelation,_that.age,_that.bloodType,_that.heightCm,_that.prePregnancyWeightKg,_that.medicalHistory,_that.currentMedications,_that.riskLevel,_that.healthcarePreference,_that.whatsappConsent,_that.dataSharingConsent,_that.puskesmasId,_that.perawatId,_that.assignmentDate,_that.assignmentDistanceKm,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IbuHamilModel implements IbuHamilModel {
  const _IbuHamilModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'nama_lengkap') required this.namaLengkap, required this.nik, @JsonKey(name: 'date_of_birth') required this.dateOfBirth, @JsonKey(name: 'profile_photo_url') this.profilePhotoUrl, required this.address, required this.location, this.provinsi, @JsonKey(name: 'kota_kabupaten') this.kotaKabupaten, this.kelurahan, this.kecamatan, @JsonKey(name: 'rt_rw') this.rtRw, @JsonKey(name: 'last_menstrual_period') this.lastMenstrualPeriod, @JsonKey(name: 'estimated_due_date') this.estimatedDueDate, @JsonKey(name: 'usia_kehamilan') this.usiaKehamilan, @JsonKey(name: 'kehamilan_ke') this.kehamilanKe = 1, @JsonKey(name: 'jumlah_anak') this.jumlahAnak = 0, @JsonKey(name: 'jarak_kehamilan_terakhir') this.jarakKehamilanTerakhir, @JsonKey(name: 'miscarriage_number') this.miscarriageNumber = 0, @JsonKey(name: 'previous_pregnancy_complications') this.previousPregnancyComplications, @JsonKey(name: 'pernah_caesar') this.pernahCaesar = false, @JsonKey(name: 'pernah_perdarahan_saat_hamil') this.pernahPerdarahanSaatHamil = false, @JsonKey(name: 'riwayat_kesehatan_ibu') required this.riwayatKesehatanIbu, @JsonKey(name: 'emergency_contact_name') required this.emergencyContactName, @JsonKey(name: 'emergency_contact_phone') required this.emergencyContactPhone, @JsonKey(name: 'emergency_contact_relation') this.emergencyContactRelation, this.age, @JsonKey(name: 'blood_type') this.bloodType, @JsonKey(name: 'height_cm') this.heightCm, @JsonKey(name: 'pre_pregnancy_weight_kg') this.prePregnancyWeightKg, @JsonKey(name: 'medical_history') this.medicalHistory, @JsonKey(name: 'current_medications') this.currentMedications, @JsonKey(name: 'risk_level') this.riskLevel, @JsonKey(name: 'healthcare_preference') this.healthcarePreference, @JsonKey(name: 'whatsapp_consent') this.whatsappConsent = true, @JsonKey(name: 'data_sharing_consent') this.dataSharingConsent = false, @JsonKey(name: 'puskesmas_id') this.puskesmasId, @JsonKey(name: 'perawat_id') this.perawatId, @JsonKey(name: 'assignment_date') this.assignmentDate, @JsonKey(name: 'assignment_distance_km') this.assignmentDistanceKm, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _IbuHamilModel.fromJson(Map<String, dynamic> json) => _$IbuHamilModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'nama_lengkap') final  String namaLengkap;
@override final  String nik;
// 16 digit
@override@JsonKey(name: 'date_of_birth') final  DateTime dateOfBirth;
@override@JsonKey(name: 'profile_photo_url') final  String? profilePhotoUrl;
// Alamat & Lokasi
@override final  String address;
@override final  Location location;
// longitude & latitude
@override final  String? provinsi;
@override@JsonKey(name: 'kota_kabupaten') final  String? kotaKabupaten;
@override final  String? kelurahan;
@override final  String? kecamatan;
@override@JsonKey(name: 'rt_rw') final  String? rtRw;
// Data Kehamilan
@override@JsonKey(name: 'last_menstrual_period') final  DateTime? lastMenstrualPeriod;
// HPHT
@override@JsonKey(name: 'estimated_due_date') final  DateTime? estimatedDueDate;
// HPL
@override@JsonKey(name: 'usia_kehamilan') final  int? usiaKehamilan;
// minggu
@override@JsonKey(name: 'kehamilan_ke') final  int? kehamilanKe;
@override@JsonKey(name: 'jumlah_anak') final  int? jumlahAnak;
@override@JsonKey(name: 'jarak_kehamilan_terakhir') final  String? jarakKehamilanTerakhir;
@override@JsonKey(name: 'miscarriage_number') final  int? miscarriageNumber;
@override@JsonKey(name: 'previous_pregnancy_complications') final  String? previousPregnancyComplications;
@override@JsonKey(name: 'pernah_caesar') final  bool pernahCaesar;
@override@JsonKey(name: 'pernah_perdarahan_saat_hamil') final  bool pernahPerdarahanSaatHamil;
// Riwayat Kesehatan (nested object)
@override@JsonKey(name: 'riwayat_kesehatan_ibu') final  RiwayatKesehatanIbuModel riwayatKesehatanIbu;
// Kontak Darurat
@override@JsonKey(name: 'emergency_contact_name') final  String emergencyContactName;
@override@JsonKey(name: 'emergency_contact_phone') final  String emergencyContactPhone;
@override@JsonKey(name: 'emergency_contact_relation') final  String? emergencyContactRelation;
// Data Tambahan
@override final  int? age;
@override@JsonKey(name: 'blood_type') final  String? bloodType;
@override@JsonKey(name: 'height_cm') final  double? heightCm;
@override@JsonKey(name: 'pre_pregnancy_weight_kg') final  double? prePregnancyWeightKg;
@override@JsonKey(name: 'medical_history') final  String? medicalHistory;
@override@JsonKey(name: 'current_medications') final  String? currentMedications;
@override@JsonKey(name: 'risk_level') final  String? riskLevel;
// 'low', 'normal', 'high'
@override@JsonKey(name: 'healthcare_preference') final  String? healthcarePreference;
@override@JsonKey(name: 'whatsapp_consent') final  bool whatsappConsent;
@override@JsonKey(name: 'data_sharing_consent') final  bool dataSharingConsent;
// Assignment (opsional untuk mobile)
@override@JsonKey(name: 'puskesmas_id') final  int? puskesmasId;
@override@JsonKey(name: 'perawat_id') final  int? perawatId;
@override@JsonKey(name: 'assignment_date') final  DateTime? assignmentDate;
@override@JsonKey(name: 'assignment_distance_km') final  double? assignmentDistanceKm;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IbuHamilModelCopyWith<_IbuHamilModel> get copyWith => __$IbuHamilModelCopyWithImpl<_IbuHamilModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IbuHamilModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IbuHamilModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.profilePhotoUrl, profilePhotoUrl) || other.profilePhotoUrl == profilePhotoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.provinsi, provinsi) || other.provinsi == provinsi)&&(identical(other.kotaKabupaten, kotaKabupaten) || other.kotaKabupaten == kotaKabupaten)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.kecamatan, kecamatan) || other.kecamatan == kecamatan)&&(identical(other.rtRw, rtRw) || other.rtRw == rtRw)&&(identical(other.lastMenstrualPeriod, lastMenstrualPeriod) || other.lastMenstrualPeriod == lastMenstrualPeriod)&&(identical(other.estimatedDueDate, estimatedDueDate) || other.estimatedDueDate == estimatedDueDate)&&(identical(other.usiaKehamilan, usiaKehamilan) || other.usiaKehamilan == usiaKehamilan)&&(identical(other.kehamilanKe, kehamilanKe) || other.kehamilanKe == kehamilanKe)&&(identical(other.jumlahAnak, jumlahAnak) || other.jumlahAnak == jumlahAnak)&&(identical(other.jarakKehamilanTerakhir, jarakKehamilanTerakhir) || other.jarakKehamilanTerakhir == jarakKehamilanTerakhir)&&(identical(other.miscarriageNumber, miscarriageNumber) || other.miscarriageNumber == miscarriageNumber)&&(identical(other.previousPregnancyComplications, previousPregnancyComplications) || other.previousPregnancyComplications == previousPregnancyComplications)&&(identical(other.pernahCaesar, pernahCaesar) || other.pernahCaesar == pernahCaesar)&&(identical(other.pernahPerdarahanSaatHamil, pernahPerdarahanSaatHamil) || other.pernahPerdarahanSaatHamil == pernahPerdarahanSaatHamil)&&(identical(other.riwayatKesehatanIbu, riwayatKesehatanIbu) || other.riwayatKesehatanIbu == riwayatKesehatanIbu)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.emergencyContactRelation, emergencyContactRelation) || other.emergencyContactRelation == emergencyContactRelation)&&(identical(other.age, age) || other.age == age)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.prePregnancyWeightKg, prePregnancyWeightKg) || other.prePregnancyWeightKg == prePregnancyWeightKg)&&(identical(other.medicalHistory, medicalHistory) || other.medicalHistory == medicalHistory)&&(identical(other.currentMedications, currentMedications) || other.currentMedications == currentMedications)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.healthcarePreference, healthcarePreference) || other.healthcarePreference == healthcarePreference)&&(identical(other.whatsappConsent, whatsappConsent) || other.whatsappConsent == whatsappConsent)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent)&&(identical(other.puskesmasId, puskesmasId) || other.puskesmasId == puskesmasId)&&(identical(other.perawatId, perawatId) || other.perawatId == perawatId)&&(identical(other.assignmentDate, assignmentDate) || other.assignmentDate == assignmentDate)&&(identical(other.assignmentDistanceKm, assignmentDistanceKm) || other.assignmentDistanceKm == assignmentDistanceKm)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,namaLengkap,nik,dateOfBirth,profilePhotoUrl,address,location,provinsi,kotaKabupaten,kelurahan,kecamatan,rtRw,lastMenstrualPeriod,estimatedDueDate,usiaKehamilan,kehamilanKe,jumlahAnak,jarakKehamilanTerakhir,miscarriageNumber,previousPregnancyComplications,pernahCaesar,pernahPerdarahanSaatHamil,riwayatKesehatanIbu,emergencyContactName,emergencyContactPhone,emergencyContactRelation,age,bloodType,heightCm,prePregnancyWeightKg,medicalHistory,currentMedications,riskLevel,healthcarePreference,whatsappConsent,dataSharingConsent,puskesmasId,perawatId,assignmentDate,assignmentDistanceKm,isActive,createdAt,updatedAt]);

@override
String toString() {
  return 'IbuHamilModel(id: $id, userId: $userId, namaLengkap: $namaLengkap, nik: $nik, dateOfBirth: $dateOfBirth, profilePhotoUrl: $profilePhotoUrl, address: $address, location: $location, provinsi: $provinsi, kotaKabupaten: $kotaKabupaten, kelurahan: $kelurahan, kecamatan: $kecamatan, rtRw: $rtRw, lastMenstrualPeriod: $lastMenstrualPeriod, estimatedDueDate: $estimatedDueDate, usiaKehamilan: $usiaKehamilan, kehamilanKe: $kehamilanKe, jumlahAnak: $jumlahAnak, jarakKehamilanTerakhir: $jarakKehamilanTerakhir, miscarriageNumber: $miscarriageNumber, previousPregnancyComplications: $previousPregnancyComplications, pernahCaesar: $pernahCaesar, pernahPerdarahanSaatHamil: $pernahPerdarahanSaatHamil, riwayatKesehatanIbu: $riwayatKesehatanIbu, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, emergencyContactRelation: $emergencyContactRelation, age: $age, bloodType: $bloodType, heightCm: $heightCm, prePregnancyWeightKg: $prePregnancyWeightKg, medicalHistory: $medicalHistory, currentMedications: $currentMedications, riskLevel: $riskLevel, healthcarePreference: $healthcarePreference, whatsappConsent: $whatsappConsent, dataSharingConsent: $dataSharingConsent, puskesmasId: $puskesmasId, perawatId: $perawatId, assignmentDate: $assignmentDate, assignmentDistanceKm: $assignmentDistanceKm, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IbuHamilModelCopyWith<$Res> implements $IbuHamilModelCopyWith<$Res> {
  factory _$IbuHamilModelCopyWith(_IbuHamilModel value, $Res Function(_IbuHamilModel) _then) = __$IbuHamilModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik,@JsonKey(name: 'date_of_birth') DateTime dateOfBirth,@JsonKey(name: 'profile_photo_url') String? profilePhotoUrl, String address, Location location, String? provinsi,@JsonKey(name: 'kota_kabupaten') String? kotaKabupaten, String? kelurahan, String? kecamatan,@JsonKey(name: 'rt_rw') String? rtRw,@JsonKey(name: 'last_menstrual_period') DateTime? lastMenstrualPeriod,@JsonKey(name: 'estimated_due_date') DateTime? estimatedDueDate,@JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,@JsonKey(name: 'kehamilan_ke') int? kehamilanKe,@JsonKey(name: 'jumlah_anak') int? jumlahAnak,@JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,@JsonKey(name: 'miscarriage_number') int? miscarriageNumber,@JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications,@JsonKey(name: 'pernah_caesar') bool pernahCaesar,@JsonKey(name: 'pernah_perdarahan_saat_hamil') bool pernahPerdarahanSaatHamil,@JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuModel riwayatKesehatanIbu,@JsonKey(name: 'emergency_contact_name') String emergencyContactName,@JsonKey(name: 'emergency_contact_phone') String emergencyContactPhone,@JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation, int? age,@JsonKey(name: 'blood_type') String? bloodType,@JsonKey(name: 'height_cm') double? heightCm,@JsonKey(name: 'pre_pregnancy_weight_kg') double? prePregnancyWeightKg,@JsonKey(name: 'medical_history') String? medicalHistory,@JsonKey(name: 'current_medications') String? currentMedications,@JsonKey(name: 'risk_level') String? riskLevel,@JsonKey(name: 'healthcare_preference') String? healthcarePreference,@JsonKey(name: 'whatsapp_consent') bool whatsappConsent,@JsonKey(name: 'data_sharing_consent') bool dataSharingConsent,@JsonKey(name: 'puskesmas_id') int? puskesmasId,@JsonKey(name: 'perawat_id') int? perawatId,@JsonKey(name: 'assignment_date') DateTime? assignmentDate,@JsonKey(name: 'assignment_distance_km') double? assignmentDistanceKm,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


@override $LocationCopyWith<$Res> get location;@override $RiwayatKesehatanIbuModelCopyWith<$Res> get riwayatKesehatanIbu;

}
/// @nodoc
class __$IbuHamilModelCopyWithImpl<$Res>
    implements _$IbuHamilModelCopyWith<$Res> {
  __$IbuHamilModelCopyWithImpl(this._self, this._then);

  final _IbuHamilModel _self;
  final $Res Function(_IbuHamilModel) _then;

/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? namaLengkap = null,Object? nik = null,Object? dateOfBirth = null,Object? profilePhotoUrl = freezed,Object? address = null,Object? location = null,Object? provinsi = freezed,Object? kotaKabupaten = freezed,Object? kelurahan = freezed,Object? kecamatan = freezed,Object? rtRw = freezed,Object? lastMenstrualPeriod = freezed,Object? estimatedDueDate = freezed,Object? usiaKehamilan = freezed,Object? kehamilanKe = freezed,Object? jumlahAnak = freezed,Object? jarakKehamilanTerakhir = freezed,Object? miscarriageNumber = freezed,Object? previousPregnancyComplications = freezed,Object? pernahCaesar = null,Object? pernahPerdarahanSaatHamil = null,Object? riwayatKesehatanIbu = null,Object? emergencyContactName = null,Object? emergencyContactPhone = null,Object? emergencyContactRelation = freezed,Object? age = freezed,Object? bloodType = freezed,Object? heightCm = freezed,Object? prePregnancyWeightKg = freezed,Object? medicalHistory = freezed,Object? currentMedications = freezed,Object? riskLevel = freezed,Object? healthcarePreference = freezed,Object? whatsappConsent = null,Object? dataSharingConsent = null,Object? puskesmasId = freezed,Object? perawatId = freezed,Object? assignmentDate = freezed,Object? assignmentDistanceKm = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_IbuHamilModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,profilePhotoUrl: freezed == profilePhotoUrl ? _self.profilePhotoUrl : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,provinsi: freezed == provinsi ? _self.provinsi : provinsi // ignore: cast_nullable_to_non_nullable
as String?,kotaKabupaten: freezed == kotaKabupaten ? _self.kotaKabupaten : kotaKabupaten // ignore: cast_nullable_to_non_nullable
as String?,kelurahan: freezed == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String?,kecamatan: freezed == kecamatan ? _self.kecamatan : kecamatan // ignore: cast_nullable_to_non_nullable
as String?,rtRw: freezed == rtRw ? _self.rtRw : rtRw // ignore: cast_nullable_to_non_nullable
as String?,lastMenstrualPeriod: freezed == lastMenstrualPeriod ? _self.lastMenstrualPeriod : lastMenstrualPeriod // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedDueDate: freezed == estimatedDueDate ? _self.estimatedDueDate : estimatedDueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,usiaKehamilan: freezed == usiaKehamilan ? _self.usiaKehamilan : usiaKehamilan // ignore: cast_nullable_to_non_nullable
as int?,kehamilanKe: freezed == kehamilanKe ? _self.kehamilanKe : kehamilanKe // ignore: cast_nullable_to_non_nullable
as int?,jumlahAnak: freezed == jumlahAnak ? _self.jumlahAnak : jumlahAnak // ignore: cast_nullable_to_non_nullable
as int?,jarakKehamilanTerakhir: freezed == jarakKehamilanTerakhir ? _self.jarakKehamilanTerakhir : jarakKehamilanTerakhir // ignore: cast_nullable_to_non_nullable
as String?,miscarriageNumber: freezed == miscarriageNumber ? _self.miscarriageNumber : miscarriageNumber // ignore: cast_nullable_to_non_nullable
as int?,previousPregnancyComplications: freezed == previousPregnancyComplications ? _self.previousPregnancyComplications : previousPregnancyComplications // ignore: cast_nullable_to_non_nullable
as String?,pernahCaesar: null == pernahCaesar ? _self.pernahCaesar : pernahCaesar // ignore: cast_nullable_to_non_nullable
as bool,pernahPerdarahanSaatHamil: null == pernahPerdarahanSaatHamil ? _self.pernahPerdarahanSaatHamil : pernahPerdarahanSaatHamil // ignore: cast_nullable_to_non_nullable
as bool,riwayatKesehatanIbu: null == riwayatKesehatanIbu ? _self.riwayatKesehatanIbu : riwayatKesehatanIbu // ignore: cast_nullable_to_non_nullable
as RiwayatKesehatanIbuModel,emergencyContactName: null == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String,emergencyContactPhone: null == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String,emergencyContactRelation: freezed == emergencyContactRelation ? _self.emergencyContactRelation : emergencyContactRelation // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double?,prePregnancyWeightKg: freezed == prePregnancyWeightKg ? _self.prePregnancyWeightKg : prePregnancyWeightKg // ignore: cast_nullable_to_non_nullable
as double?,medicalHistory: freezed == medicalHistory ? _self.medicalHistory : medicalHistory // ignore: cast_nullable_to_non_nullable
as String?,currentMedications: freezed == currentMedications ? _self.currentMedications : currentMedications // ignore: cast_nullable_to_non_nullable
as String?,riskLevel: freezed == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String?,healthcarePreference: freezed == healthcarePreference ? _self.healthcarePreference : healthcarePreference // ignore: cast_nullable_to_non_nullable
as String?,whatsappConsent: null == whatsappConsent ? _self.whatsappConsent : whatsappConsent // ignore: cast_nullable_to_non_nullable
as bool,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,puskesmasId: freezed == puskesmasId ? _self.puskesmasId : puskesmasId // ignore: cast_nullable_to_non_nullable
as int?,perawatId: freezed == perawatId ? _self.perawatId : perawatId // ignore: cast_nullable_to_non_nullable
as int?,assignmentDate: freezed == assignmentDate ? _self.assignmentDate : assignmentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,assignmentDistanceKm: freezed == assignmentDistanceKm ? _self.assignmentDistanceKm : assignmentDistanceKm // ignore: cast_nullable_to_non_nullable
as double?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of IbuHamilModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiwayatKesehatanIbuModelCopyWith<$Res> get riwayatKesehatanIbu {
  
  return $RiwayatKesehatanIbuModelCopyWith<$Res>(_self.riwayatKesehatanIbu, (value) {
    return _then(_self.copyWith(riwayatKesehatanIbu: value));
  });
}
}

// dart format on
