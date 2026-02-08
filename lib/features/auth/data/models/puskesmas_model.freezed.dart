// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puskesmas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PuskesmasModel {

 int get id; String get name;@JsonKey(name: 'registration_status') String get registrationStatus;@JsonKey(name: 'is_active') bool get isActive; String? get phone; String? get email; String? get address;
/// Create a copy of PuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PuskesmasModelCopyWith<PuskesmasModel> get copyWith => _$PuskesmasModelCopyWithImpl<PuskesmasModel>(this as PuskesmasModel, _$identity);

  /// Serializes this PuskesmasModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PuskesmasModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.registrationStatus, registrationStatus) || other.registrationStatus == registrationStatus)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,registrationStatus,isActive,phone,email,address);

@override
String toString() {
  return 'PuskesmasModel(id: $id, name: $name, registrationStatus: $registrationStatus, isActive: $isActive, phone: $phone, email: $email, address: $address)';
}


}

/// @nodoc
abstract mixin class $PuskesmasModelCopyWith<$Res>  {
  factory $PuskesmasModelCopyWith(PuskesmasModel value, $Res Function(PuskesmasModel) _then) = _$PuskesmasModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'registration_status') String registrationStatus,@JsonKey(name: 'is_active') bool isActive, String? phone, String? email, String? address
});




}
/// @nodoc
class _$PuskesmasModelCopyWithImpl<$Res>
    implements $PuskesmasModelCopyWith<$Res> {
  _$PuskesmasModelCopyWithImpl(this._self, this._then);

  final PuskesmasModel _self;
  final $Res Function(PuskesmasModel) _then;

/// Create a copy of PuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? registrationStatus = null,Object? isActive = null,Object? phone = freezed,Object? email = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,registrationStatus: null == registrationStatus ? _self.registrationStatus : registrationStatus // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PuskesmasModel].
extension PuskesmasModelPatterns on PuskesmasModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PuskesmasModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PuskesmasModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PuskesmasModel value)  $default,){
final _that = this;
switch (_that) {
case _PuskesmasModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PuskesmasModel value)?  $default,){
final _that = this;
switch (_that) {
case _PuskesmasModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'registration_status')  String registrationStatus, @JsonKey(name: 'is_active')  bool isActive,  String? phone,  String? email,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PuskesmasModel() when $default != null:
return $default(_that.id,_that.name,_that.registrationStatus,_that.isActive,_that.phone,_that.email,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'registration_status')  String registrationStatus, @JsonKey(name: 'is_active')  bool isActive,  String? phone,  String? email,  String? address)  $default,) {final _that = this;
switch (_that) {
case _PuskesmasModel():
return $default(_that.id,_that.name,_that.registrationStatus,_that.isActive,_that.phone,_that.email,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'registration_status')  String registrationStatus, @JsonKey(name: 'is_active')  bool isActive,  String? phone,  String? email,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _PuskesmasModel() when $default != null:
return $default(_that.id,_that.name,_that.registrationStatus,_that.isActive,_that.phone,_that.email,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PuskesmasModel implements PuskesmasModel {
  const _PuskesmasModel({required this.id, required this.name, @JsonKey(name: 'registration_status') required this.registrationStatus, @JsonKey(name: 'is_active') this.isActive = true, this.phone, this.email, this.address});
  factory _PuskesmasModel.fromJson(Map<String, dynamic> json) => _$PuskesmasModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'registration_status') final  String registrationStatus;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override final  String? phone;
@override final  String? email;
@override final  String? address;

/// Create a copy of PuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PuskesmasModelCopyWith<_PuskesmasModel> get copyWith => __$PuskesmasModelCopyWithImpl<_PuskesmasModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PuskesmasModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PuskesmasModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.registrationStatus, registrationStatus) || other.registrationStatus == registrationStatus)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,registrationStatus,isActive,phone,email,address);

@override
String toString() {
  return 'PuskesmasModel(id: $id, name: $name, registrationStatus: $registrationStatus, isActive: $isActive, phone: $phone, email: $email, address: $address)';
}


}

/// @nodoc
abstract mixin class _$PuskesmasModelCopyWith<$Res> implements $PuskesmasModelCopyWith<$Res> {
  factory _$PuskesmasModelCopyWith(_PuskesmasModel value, $Res Function(_PuskesmasModel) _then) = __$PuskesmasModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'registration_status') String registrationStatus,@JsonKey(name: 'is_active') bool isActive, String? phone, String? email, String? address
});




}
/// @nodoc
class __$PuskesmasModelCopyWithImpl<$Res>
    implements _$PuskesmasModelCopyWith<$Res> {
  __$PuskesmasModelCopyWithImpl(this._self, this._then);

  final _PuskesmasModel _self;
  final $Res Function(_PuskesmasModel) _then;

/// Create a copy of PuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? registrationStatus = null,Object? isActive = null,Object? phone = freezed,Object? email = freezed,Object? address = freezed,}) {
  return _then(_PuskesmasModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,registrationStatus: null == registrationStatus ? _self.registrationStatus : registrationStatus // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NearestPuskesmasModel {

 PuskesmasModel get puskesmas;@JsonKey(name: 'distance_km') double get distanceKm; String get address;
/// Create a copy of NearestPuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearestPuskesmasModelCopyWith<NearestPuskesmasModel> get copyWith => _$NearestPuskesmasModelCopyWithImpl<NearestPuskesmasModel>(this as NearestPuskesmasModel, _$identity);

  /// Serializes this NearestPuskesmasModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearestPuskesmasModel&&(identical(other.puskesmas, puskesmas) || other.puskesmas == puskesmas)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puskesmas,distanceKm,address);

@override
String toString() {
  return 'NearestPuskesmasModel(puskesmas: $puskesmas, distanceKm: $distanceKm, address: $address)';
}


}

/// @nodoc
abstract mixin class $NearestPuskesmasModelCopyWith<$Res>  {
  factory $NearestPuskesmasModelCopyWith(NearestPuskesmasModel value, $Res Function(NearestPuskesmasModel) _then) = _$NearestPuskesmasModelCopyWithImpl;
@useResult
$Res call({
 PuskesmasModel puskesmas,@JsonKey(name: 'distance_km') double distanceKm, String address
});


$PuskesmasModelCopyWith<$Res> get puskesmas;

}
/// @nodoc
class _$NearestPuskesmasModelCopyWithImpl<$Res>
    implements $NearestPuskesmasModelCopyWith<$Res> {
  _$NearestPuskesmasModelCopyWithImpl(this._self, this._then);

  final NearestPuskesmasModel _self;
  final $Res Function(NearestPuskesmasModel) _then;

/// Create a copy of NearestPuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? puskesmas = null,Object? distanceKm = null,Object? address = null,}) {
  return _then(_self.copyWith(
puskesmas: null == puskesmas ? _self.puskesmas : puskesmas // ignore: cast_nullable_to_non_nullable
as PuskesmasModel,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of NearestPuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PuskesmasModelCopyWith<$Res> get puskesmas {
  
  return $PuskesmasModelCopyWith<$Res>(_self.puskesmas, (value) {
    return _then(_self.copyWith(puskesmas: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearestPuskesmasModel].
extension NearestPuskesmasModelPatterns on NearestPuskesmasModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearestPuskesmasModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearestPuskesmasModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearestPuskesmasModel value)  $default,){
final _that = this;
switch (_that) {
case _NearestPuskesmasModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearestPuskesmasModel value)?  $default,){
final _that = this;
switch (_that) {
case _NearestPuskesmasModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PuskesmasModel puskesmas, @JsonKey(name: 'distance_km')  double distanceKm,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearestPuskesmasModel() when $default != null:
return $default(_that.puskesmas,_that.distanceKm,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PuskesmasModel puskesmas, @JsonKey(name: 'distance_km')  double distanceKm,  String address)  $default,) {final _that = this;
switch (_that) {
case _NearestPuskesmasModel():
return $default(_that.puskesmas,_that.distanceKm,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PuskesmasModel puskesmas, @JsonKey(name: 'distance_km')  double distanceKm,  String address)?  $default,) {final _that = this;
switch (_that) {
case _NearestPuskesmasModel() when $default != null:
return $default(_that.puskesmas,_that.distanceKm,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearestPuskesmasModel implements NearestPuskesmasModel {
  const _NearestPuskesmasModel({required this.puskesmas, @JsonKey(name: 'distance_km') required this.distanceKm, required this.address});
  factory _NearestPuskesmasModel.fromJson(Map<String, dynamic> json) => _$NearestPuskesmasModelFromJson(json);

@override final  PuskesmasModel puskesmas;
@override@JsonKey(name: 'distance_km') final  double distanceKm;
@override final  String address;

/// Create a copy of NearestPuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearestPuskesmasModelCopyWith<_NearestPuskesmasModel> get copyWith => __$NearestPuskesmasModelCopyWithImpl<_NearestPuskesmasModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearestPuskesmasModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearestPuskesmasModel&&(identical(other.puskesmas, puskesmas) || other.puskesmas == puskesmas)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puskesmas,distanceKm,address);

@override
String toString() {
  return 'NearestPuskesmasModel(puskesmas: $puskesmas, distanceKm: $distanceKm, address: $address)';
}


}

/// @nodoc
abstract mixin class _$NearestPuskesmasModelCopyWith<$Res> implements $NearestPuskesmasModelCopyWith<$Res> {
  factory _$NearestPuskesmasModelCopyWith(_NearestPuskesmasModel value, $Res Function(_NearestPuskesmasModel) _then) = __$NearestPuskesmasModelCopyWithImpl;
@override @useResult
$Res call({
 PuskesmasModel puskesmas,@JsonKey(name: 'distance_km') double distanceKm, String address
});


@override $PuskesmasModelCopyWith<$Res> get puskesmas;

}
/// @nodoc
class __$NearestPuskesmasModelCopyWithImpl<$Res>
    implements _$NearestPuskesmasModelCopyWith<$Res> {
  __$NearestPuskesmasModelCopyWithImpl(this._self, this._then);

  final _NearestPuskesmasModel _self;
  final $Res Function(_NearestPuskesmasModel) _then;

/// Create a copy of NearestPuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? puskesmas = null,Object? distanceKm = null,Object? address = null,}) {
  return _then(_NearestPuskesmasModel(
puskesmas: null == puskesmas ? _self.puskesmas : puskesmas // ignore: cast_nullable_to_non_nullable
as PuskesmasModel,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of NearestPuskesmasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PuskesmasModelCopyWith<$Res> get puskesmas {
  
  return $PuskesmasModelCopyWith<$Res>(_self.puskesmas, (value) {
    return _then(_self.copyWith(puskesmas: value));
  });
}
}

// dart format on
