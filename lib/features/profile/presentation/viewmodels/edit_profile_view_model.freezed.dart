// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProfileState {

// Form fields
 String get namaLengkap; String get nik; DateTime? get dateOfBirth; String get address; String get jalan;// Location
 Position? get currentPosition; List<double> get location;// [longitude, latitude]
// Wilayah dropdowns
 List<Provinsi> get provinces; List<KotaKabupaten> get regencies; List<Kecamatan> get districts; Provinsi? get selectedProvinsi; KotaKabupaten? get selectedKota; Kecamatan? get selectedKecamatan; String get provinsiId; String get kotaId; String get kecamatanId; String get provinsiName; String get kotaName; String get kecamatanName; String get kelurahan;// Loading states
 bool get isLoading; bool get isLoadingLocation; bool get isLoadingProvinces; bool get isLoadingRegencies; bool get isLoadingDistricts;// Error states
 String? get error; String? get locationError; String? get wilayahError;
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileStateCopyWith<EditProfileState> get copyWith => _$EditProfileStateCopyWithImpl<EditProfileState>(this as EditProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileState&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.address, address) || other.address == address)&&(identical(other.jalan, jalan) || other.jalan == jalan)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.provinces, provinces)&&const DeepCollectionEquality().equals(other.regencies, regencies)&&const DeepCollectionEquality().equals(other.districts, districts)&&(identical(other.selectedProvinsi, selectedProvinsi) || other.selectedProvinsi == selectedProvinsi)&&(identical(other.selectedKota, selectedKota) || other.selectedKota == selectedKota)&&(identical(other.selectedKecamatan, selectedKecamatan) || other.selectedKecamatan == selectedKecamatan)&&(identical(other.provinsiId, provinsiId) || other.provinsiId == provinsiId)&&(identical(other.kotaId, kotaId) || other.kotaId == kotaId)&&(identical(other.kecamatanId, kecamatanId) || other.kecamatanId == kecamatanId)&&(identical(other.provinsiName, provinsiName) || other.provinsiName == provinsiName)&&(identical(other.kotaName, kotaName) || other.kotaName == kotaName)&&(identical(other.kecamatanName, kecamatanName) || other.kecamatanName == kecamatanName)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingLocation, isLoadingLocation) || other.isLoadingLocation == isLoadingLocation)&&(identical(other.isLoadingProvinces, isLoadingProvinces) || other.isLoadingProvinces == isLoadingProvinces)&&(identical(other.isLoadingRegencies, isLoadingRegencies) || other.isLoadingRegencies == isLoadingRegencies)&&(identical(other.isLoadingDistricts, isLoadingDistricts) || other.isLoadingDistricts == isLoadingDistricts)&&(identical(other.error, error) || other.error == error)&&(identical(other.locationError, locationError) || other.locationError == locationError)&&(identical(other.wilayahError, wilayahError) || other.wilayahError == wilayahError));
}


@override
int get hashCode => Object.hashAll([runtimeType,namaLengkap,nik,dateOfBirth,address,jalan,currentPosition,const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(provinces),const DeepCollectionEquality().hash(regencies),const DeepCollectionEquality().hash(districts),selectedProvinsi,selectedKota,selectedKecamatan,provinsiId,kotaId,kecamatanId,provinsiName,kotaName,kecamatanName,kelurahan,isLoading,isLoadingLocation,isLoadingProvinces,isLoadingRegencies,isLoadingDistricts,error,locationError,wilayahError]);

@override
String toString() {
  return 'EditProfileState(namaLengkap: $namaLengkap, nik: $nik, dateOfBirth: $dateOfBirth, address: $address, jalan: $jalan, currentPosition: $currentPosition, location: $location, provinces: $provinces, regencies: $regencies, districts: $districts, selectedProvinsi: $selectedProvinsi, selectedKota: $selectedKota, selectedKecamatan: $selectedKecamatan, provinsiId: $provinsiId, kotaId: $kotaId, kecamatanId: $kecamatanId, provinsiName: $provinsiName, kotaName: $kotaName, kecamatanName: $kecamatanName, kelurahan: $kelurahan, isLoading: $isLoading, isLoadingLocation: $isLoadingLocation, isLoadingProvinces: $isLoadingProvinces, isLoadingRegencies: $isLoadingRegencies, isLoadingDistricts: $isLoadingDistricts, error: $error, locationError: $locationError, wilayahError: $wilayahError)';
}


}

/// @nodoc
abstract mixin class $EditProfileStateCopyWith<$Res>  {
  factory $EditProfileStateCopyWith(EditProfileState value, $Res Function(EditProfileState) _then) = _$EditProfileStateCopyWithImpl;
@useResult
$Res call({
 String namaLengkap, String nik, DateTime? dateOfBirth, String address, String jalan, Position? currentPosition, List<double> location, List<Provinsi> provinces, List<KotaKabupaten> regencies, List<Kecamatan> districts, Provinsi? selectedProvinsi, KotaKabupaten? selectedKota, Kecamatan? selectedKecamatan, String provinsiId, String kotaId, String kecamatanId, String provinsiName, String kotaName, String kecamatanName, String kelurahan, bool isLoading, bool isLoadingLocation, bool isLoadingProvinces, bool isLoadingRegencies, bool isLoadingDistricts, String? error, String? locationError, String? wilayahError
});




}
/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._self, this._then);

  final EditProfileState _self;
  final $Res Function(EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? namaLengkap = null,Object? nik = null,Object? dateOfBirth = freezed,Object? address = null,Object? jalan = null,Object? currentPosition = freezed,Object? location = null,Object? provinces = null,Object? regencies = null,Object? districts = null,Object? selectedProvinsi = freezed,Object? selectedKota = freezed,Object? selectedKecamatan = freezed,Object? provinsiId = null,Object? kotaId = null,Object? kecamatanId = null,Object? provinsiName = null,Object? kotaName = null,Object? kecamatanName = null,Object? kelurahan = null,Object? isLoading = null,Object? isLoadingLocation = null,Object? isLoadingProvinces = null,Object? isLoadingRegencies = null,Object? isLoadingDistricts = null,Object? error = freezed,Object? locationError = freezed,Object? wilayahError = freezed,}) {
  return _then(_self.copyWith(
namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,jalan: null == jalan ? _self.jalan : jalan // ignore: cast_nullable_to_non_nullable
as String,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as Position?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<double>,provinces: null == provinces ? _self.provinces : provinces // ignore: cast_nullable_to_non_nullable
as List<Provinsi>,regencies: null == regencies ? _self.regencies : regencies // ignore: cast_nullable_to_non_nullable
as List<KotaKabupaten>,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<Kecamatan>,selectedProvinsi: freezed == selectedProvinsi ? _self.selectedProvinsi : selectedProvinsi // ignore: cast_nullable_to_non_nullable
as Provinsi?,selectedKota: freezed == selectedKota ? _self.selectedKota : selectedKota // ignore: cast_nullable_to_non_nullable
as KotaKabupaten?,selectedKecamatan: freezed == selectedKecamatan ? _self.selectedKecamatan : selectedKecamatan // ignore: cast_nullable_to_non_nullable
as Kecamatan?,provinsiId: null == provinsiId ? _self.provinsiId : provinsiId // ignore: cast_nullable_to_non_nullable
as String,kotaId: null == kotaId ? _self.kotaId : kotaId // ignore: cast_nullable_to_non_nullable
as String,kecamatanId: null == kecamatanId ? _self.kecamatanId : kecamatanId // ignore: cast_nullable_to_non_nullable
as String,provinsiName: null == provinsiName ? _self.provinsiName : provinsiName // ignore: cast_nullable_to_non_nullable
as String,kotaName: null == kotaName ? _self.kotaName : kotaName // ignore: cast_nullable_to_non_nullable
as String,kecamatanName: null == kecamatanName ? _self.kecamatanName : kecamatanName // ignore: cast_nullable_to_non_nullable
as String,kelurahan: null == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingLocation: null == isLoadingLocation ? _self.isLoadingLocation : isLoadingLocation // ignore: cast_nullable_to_non_nullable
as bool,isLoadingProvinces: null == isLoadingProvinces ? _self.isLoadingProvinces : isLoadingProvinces // ignore: cast_nullable_to_non_nullable
as bool,isLoadingRegencies: null == isLoadingRegencies ? _self.isLoadingRegencies : isLoadingRegencies // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDistricts: null == isLoadingDistricts ? _self.isLoadingDistricts : isLoadingDistricts // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,locationError: freezed == locationError ? _self.locationError : locationError // ignore: cast_nullable_to_non_nullable
as String?,wilayahError: freezed == wilayahError ? _self.wilayahError : wilayahError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditProfileState].
extension EditProfileStatePatterns on EditProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditProfileState value)  $default,){
final _that = this;
switch (_that) {
case _EditProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String namaLengkap,  String nik,  DateTime? dateOfBirth,  String address,  String jalan,  Position? currentPosition,  List<double> location,  List<Provinsi> provinces,  List<KotaKabupaten> regencies,  List<Kecamatan> districts,  Provinsi? selectedProvinsi,  KotaKabupaten? selectedKota,  Kecamatan? selectedKecamatan,  String provinsiId,  String kotaId,  String kecamatanId,  String provinsiName,  String kotaName,  String kecamatanName,  String kelurahan,  bool isLoading,  bool isLoadingLocation,  bool isLoadingProvinces,  bool isLoadingRegencies,  bool isLoadingDistricts,  String? error,  String? locationError,  String? wilayahError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.address,_that.jalan,_that.currentPosition,_that.location,_that.provinces,_that.regencies,_that.districts,_that.selectedProvinsi,_that.selectedKota,_that.selectedKecamatan,_that.provinsiId,_that.kotaId,_that.kecamatanId,_that.provinsiName,_that.kotaName,_that.kecamatanName,_that.kelurahan,_that.isLoading,_that.isLoadingLocation,_that.isLoadingProvinces,_that.isLoadingRegencies,_that.isLoadingDistricts,_that.error,_that.locationError,_that.wilayahError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String namaLengkap,  String nik,  DateTime? dateOfBirth,  String address,  String jalan,  Position? currentPosition,  List<double> location,  List<Provinsi> provinces,  List<KotaKabupaten> regencies,  List<Kecamatan> districts,  Provinsi? selectedProvinsi,  KotaKabupaten? selectedKota,  Kecamatan? selectedKecamatan,  String provinsiId,  String kotaId,  String kecamatanId,  String provinsiName,  String kotaName,  String kecamatanName,  String kelurahan,  bool isLoading,  bool isLoadingLocation,  bool isLoadingProvinces,  bool isLoadingRegencies,  bool isLoadingDistricts,  String? error,  String? locationError,  String? wilayahError)  $default,) {final _that = this;
switch (_that) {
case _EditProfileState():
return $default(_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.address,_that.jalan,_that.currentPosition,_that.location,_that.provinces,_that.regencies,_that.districts,_that.selectedProvinsi,_that.selectedKota,_that.selectedKecamatan,_that.provinsiId,_that.kotaId,_that.kecamatanId,_that.provinsiName,_that.kotaName,_that.kecamatanName,_that.kelurahan,_that.isLoading,_that.isLoadingLocation,_that.isLoadingProvinces,_that.isLoadingRegencies,_that.isLoadingDistricts,_that.error,_that.locationError,_that.wilayahError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String namaLengkap,  String nik,  DateTime? dateOfBirth,  String address,  String jalan,  Position? currentPosition,  List<double> location,  List<Provinsi> provinces,  List<KotaKabupaten> regencies,  List<Kecamatan> districts,  Provinsi? selectedProvinsi,  KotaKabupaten? selectedKota,  Kecamatan? selectedKecamatan,  String provinsiId,  String kotaId,  String kecamatanId,  String provinsiName,  String kotaName,  String kecamatanName,  String kelurahan,  bool isLoading,  bool isLoadingLocation,  bool isLoadingProvinces,  bool isLoadingRegencies,  bool isLoadingDistricts,  String? error,  String? locationError,  String? wilayahError)?  $default,) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.namaLengkap,_that.nik,_that.dateOfBirth,_that.address,_that.jalan,_that.currentPosition,_that.location,_that.provinces,_that.regencies,_that.districts,_that.selectedProvinsi,_that.selectedKota,_that.selectedKecamatan,_that.provinsiId,_that.kotaId,_that.kecamatanId,_that.provinsiName,_that.kotaName,_that.kecamatanName,_that.kelurahan,_that.isLoading,_that.isLoadingLocation,_that.isLoadingProvinces,_that.isLoadingRegencies,_that.isLoadingDistricts,_that.error,_that.locationError,_that.wilayahError);case _:
  return null;

}
}

}

/// @nodoc


class _EditProfileState implements EditProfileState {
  const _EditProfileState({this.namaLengkap = '', this.nik = '', this.dateOfBirth, this.address = '', this.jalan = '', this.currentPosition, final  List<double> location = const [0.0, 0.0], final  List<Provinsi> provinces = const [], final  List<KotaKabupaten> regencies = const [], final  List<Kecamatan> districts = const [], this.selectedProvinsi, this.selectedKota, this.selectedKecamatan, this.provinsiId = '', this.kotaId = '', this.kecamatanId = '', this.provinsiName = '', this.kotaName = '', this.kecamatanName = '', this.kelurahan = '', this.isLoading = false, this.isLoadingLocation = false, this.isLoadingProvinces = false, this.isLoadingRegencies = false, this.isLoadingDistricts = false, this.error, this.locationError, this.wilayahError}): _location = location,_provinces = provinces,_regencies = regencies,_districts = districts;
  

// Form fields
@override@JsonKey() final  String namaLengkap;
@override@JsonKey() final  String nik;
@override final  DateTime? dateOfBirth;
@override@JsonKey() final  String address;
@override@JsonKey() final  String jalan;
// Location
@override final  Position? currentPosition;
 final  List<double> _location;
@override@JsonKey() List<double> get location {
  if (_location is EqualUnmodifiableListView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_location);
}

// [longitude, latitude]
// Wilayah dropdowns
 final  List<Provinsi> _provinces;
// [longitude, latitude]
// Wilayah dropdowns
@override@JsonKey() List<Provinsi> get provinces {
  if (_provinces is EqualUnmodifiableListView) return _provinces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_provinces);
}

 final  List<KotaKabupaten> _regencies;
@override@JsonKey() List<KotaKabupaten> get regencies {
  if (_regencies is EqualUnmodifiableListView) return _regencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regencies);
}

 final  List<Kecamatan> _districts;
@override@JsonKey() List<Kecamatan> get districts {
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_districts);
}

@override final  Provinsi? selectedProvinsi;
@override final  KotaKabupaten? selectedKota;
@override final  Kecamatan? selectedKecamatan;
@override@JsonKey() final  String provinsiId;
@override@JsonKey() final  String kotaId;
@override@JsonKey() final  String kecamatanId;
@override@JsonKey() final  String provinsiName;
@override@JsonKey() final  String kotaName;
@override@JsonKey() final  String kecamatanName;
@override@JsonKey() final  String kelurahan;
// Loading states
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingLocation;
@override@JsonKey() final  bool isLoadingProvinces;
@override@JsonKey() final  bool isLoadingRegencies;
@override@JsonKey() final  bool isLoadingDistricts;
// Error states
@override final  String? error;
@override final  String? locationError;
@override final  String? wilayahError;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileStateCopyWith<_EditProfileState> get copyWith => __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfileState&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.address, address) || other.address == address)&&(identical(other.jalan, jalan) || other.jalan == jalan)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._provinces, _provinces)&&const DeepCollectionEquality().equals(other._regencies, _regencies)&&const DeepCollectionEquality().equals(other._districts, _districts)&&(identical(other.selectedProvinsi, selectedProvinsi) || other.selectedProvinsi == selectedProvinsi)&&(identical(other.selectedKota, selectedKota) || other.selectedKota == selectedKota)&&(identical(other.selectedKecamatan, selectedKecamatan) || other.selectedKecamatan == selectedKecamatan)&&(identical(other.provinsiId, provinsiId) || other.provinsiId == provinsiId)&&(identical(other.kotaId, kotaId) || other.kotaId == kotaId)&&(identical(other.kecamatanId, kecamatanId) || other.kecamatanId == kecamatanId)&&(identical(other.provinsiName, provinsiName) || other.provinsiName == provinsiName)&&(identical(other.kotaName, kotaName) || other.kotaName == kotaName)&&(identical(other.kecamatanName, kecamatanName) || other.kecamatanName == kecamatanName)&&(identical(other.kelurahan, kelurahan) || other.kelurahan == kelurahan)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingLocation, isLoadingLocation) || other.isLoadingLocation == isLoadingLocation)&&(identical(other.isLoadingProvinces, isLoadingProvinces) || other.isLoadingProvinces == isLoadingProvinces)&&(identical(other.isLoadingRegencies, isLoadingRegencies) || other.isLoadingRegencies == isLoadingRegencies)&&(identical(other.isLoadingDistricts, isLoadingDistricts) || other.isLoadingDistricts == isLoadingDistricts)&&(identical(other.error, error) || other.error == error)&&(identical(other.locationError, locationError) || other.locationError == locationError)&&(identical(other.wilayahError, wilayahError) || other.wilayahError == wilayahError));
}


@override
int get hashCode => Object.hashAll([runtimeType,namaLengkap,nik,dateOfBirth,address,jalan,currentPosition,const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_provinces),const DeepCollectionEquality().hash(_regencies),const DeepCollectionEquality().hash(_districts),selectedProvinsi,selectedKota,selectedKecamatan,provinsiId,kotaId,kecamatanId,provinsiName,kotaName,kecamatanName,kelurahan,isLoading,isLoadingLocation,isLoadingProvinces,isLoadingRegencies,isLoadingDistricts,error,locationError,wilayahError]);

@override
String toString() {
  return 'EditProfileState(namaLengkap: $namaLengkap, nik: $nik, dateOfBirth: $dateOfBirth, address: $address, jalan: $jalan, currentPosition: $currentPosition, location: $location, provinces: $provinces, regencies: $regencies, districts: $districts, selectedProvinsi: $selectedProvinsi, selectedKota: $selectedKota, selectedKecamatan: $selectedKecamatan, provinsiId: $provinsiId, kotaId: $kotaId, kecamatanId: $kecamatanId, provinsiName: $provinsiName, kotaName: $kotaName, kecamatanName: $kecamatanName, kelurahan: $kelurahan, isLoading: $isLoading, isLoadingLocation: $isLoadingLocation, isLoadingProvinces: $isLoadingProvinces, isLoadingRegencies: $isLoadingRegencies, isLoadingDistricts: $isLoadingDistricts, error: $error, locationError: $locationError, wilayahError: $wilayahError)';
}


}

/// @nodoc
abstract mixin class _$EditProfileStateCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(_EditProfileState value, $Res Function(_EditProfileState) _then) = __$EditProfileStateCopyWithImpl;
@override @useResult
$Res call({
 String namaLengkap, String nik, DateTime? dateOfBirth, String address, String jalan, Position? currentPosition, List<double> location, List<Provinsi> provinces, List<KotaKabupaten> regencies, List<Kecamatan> districts, Provinsi? selectedProvinsi, KotaKabupaten? selectedKota, Kecamatan? selectedKecamatan, String provinsiId, String kotaId, String kecamatanId, String provinsiName, String kotaName, String kecamatanName, String kelurahan, bool isLoading, bool isLoadingLocation, bool isLoadingProvinces, bool isLoadingRegencies, bool isLoadingDistricts, String? error, String? locationError, String? wilayahError
});




}
/// @nodoc
class __$EditProfileStateCopyWithImpl<$Res>
    implements _$EditProfileStateCopyWith<$Res> {
  __$EditProfileStateCopyWithImpl(this._self, this._then);

  final _EditProfileState _self;
  final $Res Function(_EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? namaLengkap = null,Object? nik = null,Object? dateOfBirth = freezed,Object? address = null,Object? jalan = null,Object? currentPosition = freezed,Object? location = null,Object? provinces = null,Object? regencies = null,Object? districts = null,Object? selectedProvinsi = freezed,Object? selectedKota = freezed,Object? selectedKecamatan = freezed,Object? provinsiId = null,Object? kotaId = null,Object? kecamatanId = null,Object? provinsiName = null,Object? kotaName = null,Object? kecamatanName = null,Object? kelurahan = null,Object? isLoading = null,Object? isLoadingLocation = null,Object? isLoadingProvinces = null,Object? isLoadingRegencies = null,Object? isLoadingDistricts = null,Object? error = freezed,Object? locationError = freezed,Object? wilayahError = freezed,}) {
  return _then(_EditProfileState(
namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,jalan: null == jalan ? _self.jalan : jalan // ignore: cast_nullable_to_non_nullable
as String,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as Position?,location: null == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<double>,provinces: null == provinces ? _self._provinces : provinces // ignore: cast_nullable_to_non_nullable
as List<Provinsi>,regencies: null == regencies ? _self._regencies : regencies // ignore: cast_nullable_to_non_nullable
as List<KotaKabupaten>,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<Kecamatan>,selectedProvinsi: freezed == selectedProvinsi ? _self.selectedProvinsi : selectedProvinsi // ignore: cast_nullable_to_non_nullable
as Provinsi?,selectedKota: freezed == selectedKota ? _self.selectedKota : selectedKota // ignore: cast_nullable_to_non_nullable
as KotaKabupaten?,selectedKecamatan: freezed == selectedKecamatan ? _self.selectedKecamatan : selectedKecamatan // ignore: cast_nullable_to_non_nullable
as Kecamatan?,provinsiId: null == provinsiId ? _self.provinsiId : provinsiId // ignore: cast_nullable_to_non_nullable
as String,kotaId: null == kotaId ? _self.kotaId : kotaId // ignore: cast_nullable_to_non_nullable
as String,kecamatanId: null == kecamatanId ? _self.kecamatanId : kecamatanId // ignore: cast_nullable_to_non_nullable
as String,provinsiName: null == provinsiName ? _self.provinsiName : provinsiName // ignore: cast_nullable_to_non_nullable
as String,kotaName: null == kotaName ? _self.kotaName : kotaName // ignore: cast_nullable_to_non_nullable
as String,kecamatanName: null == kecamatanName ? _self.kecamatanName : kecamatanName // ignore: cast_nullable_to_non_nullable
as String,kelurahan: null == kelurahan ? _self.kelurahan : kelurahan // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingLocation: null == isLoadingLocation ? _self.isLoadingLocation : isLoadingLocation // ignore: cast_nullable_to_non_nullable
as bool,isLoadingProvinces: null == isLoadingProvinces ? _self.isLoadingProvinces : isLoadingProvinces // ignore: cast_nullable_to_non_nullable
as bool,isLoadingRegencies: null == isLoadingRegencies ? _self.isLoadingRegencies : isLoadingRegencies // ignore: cast_nullable_to_non_nullable
as bool,isLoadingDistricts: null == isLoadingDistricts ? _self.isLoadingDistricts : isLoadingDistricts // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,locationError: freezed == locationError ? _self.locationError : locationError // ignore: cast_nullable_to_non_nullable
as String?,wilayahError: freezed == wilayahError ? _self.wilayahError : wilayahError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
