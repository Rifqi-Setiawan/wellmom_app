// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_ibu_hamil_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterIbuHamilResponseModel {

@JsonKey(name: 'ibu_hamil') IbuHamilResponseData get ibuHamil; UserResponseData get user;@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'token_type') String get tokenType; String get message;
/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterIbuHamilResponseModelCopyWith<RegisterIbuHamilResponseModel> get copyWith => _$RegisterIbuHamilResponseModelCopyWithImpl<RegisterIbuHamilResponseModel>(this as RegisterIbuHamilResponseModel, _$identity);

  /// Serializes this RegisterIbuHamilResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterIbuHamilResponseModel&&(identical(other.ibuHamil, ibuHamil) || other.ibuHamil == ibuHamil)&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ibuHamil,user,accessToken,tokenType,message);

@override
String toString() {
  return 'RegisterIbuHamilResponseModel(ibuHamil: $ibuHamil, user: $user, accessToken: $accessToken, tokenType: $tokenType, message: $message)';
}


}

/// @nodoc
abstract mixin class $RegisterIbuHamilResponseModelCopyWith<$Res>  {
  factory $RegisterIbuHamilResponseModelCopyWith(RegisterIbuHamilResponseModel value, $Res Function(RegisterIbuHamilResponseModel) _then) = _$RegisterIbuHamilResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ibu_hamil') IbuHamilResponseData ibuHamil, UserResponseData user,@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'token_type') String tokenType, String message
});


$IbuHamilResponseDataCopyWith<$Res> get ibuHamil;$UserResponseDataCopyWith<$Res> get user;

}
/// @nodoc
class _$RegisterIbuHamilResponseModelCopyWithImpl<$Res>
    implements $RegisterIbuHamilResponseModelCopyWith<$Res> {
  _$RegisterIbuHamilResponseModelCopyWithImpl(this._self, this._then);

  final RegisterIbuHamilResponseModel _self;
  final $Res Function(RegisterIbuHamilResponseModel) _then;

/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ibuHamil = null,Object? user = null,Object? accessToken = null,Object? tokenType = null,Object? message = null,}) {
  return _then(_self.copyWith(
ibuHamil: null == ibuHamil ? _self.ibuHamil : ibuHamil // ignore: cast_nullable_to_non_nullable
as IbuHamilResponseData,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserResponseData,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IbuHamilResponseDataCopyWith<$Res> get ibuHamil {
  
  return $IbuHamilResponseDataCopyWith<$Res>(_self.ibuHamil, (value) {
    return _then(_self.copyWith(ibuHamil: value));
  });
}/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseDataCopyWith<$Res> get user {
  
  return $UserResponseDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterIbuHamilResponseModel].
extension RegisterIbuHamilResponseModelPatterns on RegisterIbuHamilResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterIbuHamilResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterIbuHamilResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterIbuHamilResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterIbuHamilResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterIbuHamilResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterIbuHamilResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ibu_hamil')  IbuHamilResponseData ibuHamil,  UserResponseData user, @JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterIbuHamilResponseModel() when $default != null:
return $default(_that.ibuHamil,_that.user,_that.accessToken,_that.tokenType,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ibu_hamil')  IbuHamilResponseData ibuHamil,  UserResponseData user, @JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType,  String message)  $default,) {final _that = this;
switch (_that) {
case _RegisterIbuHamilResponseModel():
return $default(_that.ibuHamil,_that.user,_that.accessToken,_that.tokenType,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ibu_hamil')  IbuHamilResponseData ibuHamil,  UserResponseData user, @JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'token_type')  String tokenType,  String message)?  $default,) {final _that = this;
switch (_that) {
case _RegisterIbuHamilResponseModel() when $default != null:
return $default(_that.ibuHamil,_that.user,_that.accessToken,_that.tokenType,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterIbuHamilResponseModel implements RegisterIbuHamilResponseModel {
  const _RegisterIbuHamilResponseModel({@JsonKey(name: 'ibu_hamil') required this.ibuHamil, required this.user, @JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'token_type') required this.tokenType, required this.message});
  factory _RegisterIbuHamilResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterIbuHamilResponseModelFromJson(json);

@override@JsonKey(name: 'ibu_hamil') final  IbuHamilResponseData ibuHamil;
@override final  UserResponseData user;
@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'token_type') final  String tokenType;
@override final  String message;

/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterIbuHamilResponseModelCopyWith<_RegisterIbuHamilResponseModel> get copyWith => __$RegisterIbuHamilResponseModelCopyWithImpl<_RegisterIbuHamilResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterIbuHamilResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterIbuHamilResponseModel&&(identical(other.ibuHamil, ibuHamil) || other.ibuHamil == ibuHamil)&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ibuHamil,user,accessToken,tokenType,message);

@override
String toString() {
  return 'RegisterIbuHamilResponseModel(ibuHamil: $ibuHamil, user: $user, accessToken: $accessToken, tokenType: $tokenType, message: $message)';
}


}

/// @nodoc
abstract mixin class _$RegisterIbuHamilResponseModelCopyWith<$Res> implements $RegisterIbuHamilResponseModelCopyWith<$Res> {
  factory _$RegisterIbuHamilResponseModelCopyWith(_RegisterIbuHamilResponseModel value, $Res Function(_RegisterIbuHamilResponseModel) _then) = __$RegisterIbuHamilResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ibu_hamil') IbuHamilResponseData ibuHamil, UserResponseData user,@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'token_type') String tokenType, String message
});


@override $IbuHamilResponseDataCopyWith<$Res> get ibuHamil;@override $UserResponseDataCopyWith<$Res> get user;

}
/// @nodoc
class __$RegisterIbuHamilResponseModelCopyWithImpl<$Res>
    implements _$RegisterIbuHamilResponseModelCopyWith<$Res> {
  __$RegisterIbuHamilResponseModelCopyWithImpl(this._self, this._then);

  final _RegisterIbuHamilResponseModel _self;
  final $Res Function(_RegisterIbuHamilResponseModel) _then;

/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ibuHamil = null,Object? user = null,Object? accessToken = null,Object? tokenType = null,Object? message = null,}) {
  return _then(_RegisterIbuHamilResponseModel(
ibuHamil: null == ibuHamil ? _self.ibuHamil : ibuHamil // ignore: cast_nullable_to_non_nullable
as IbuHamilResponseData,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserResponseData,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IbuHamilResponseDataCopyWith<$Res> get ibuHamil {
  
  return $IbuHamilResponseDataCopyWith<$Res>(_self.ibuHamil, (value) {
    return _then(_self.copyWith(ibuHamil: value));
  });
}/// Create a copy of RegisterIbuHamilResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseDataCopyWith<$Res> get user {
  
  return $UserResponseDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$IbuHamilResponseData {

 int get id;@JsonKey(name: 'nama_lengkap') String get namaLengkap; String get nik;
/// Create a copy of IbuHamilResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IbuHamilResponseDataCopyWith<IbuHamilResponseData> get copyWith => _$IbuHamilResponseDataCopyWithImpl<IbuHamilResponseData>(this as IbuHamilResponseData, _$identity);

  /// Serializes this IbuHamilResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IbuHamilResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namaLengkap,nik);

@override
String toString() {
  return 'IbuHamilResponseData(id: $id, namaLengkap: $namaLengkap, nik: $nik)';
}


}

/// @nodoc
abstract mixin class $IbuHamilResponseDataCopyWith<$Res>  {
  factory $IbuHamilResponseDataCopyWith(IbuHamilResponseData value, $Res Function(IbuHamilResponseData) _then) = _$IbuHamilResponseDataCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik
});




}
/// @nodoc
class _$IbuHamilResponseDataCopyWithImpl<$Res>
    implements $IbuHamilResponseDataCopyWith<$Res> {
  _$IbuHamilResponseDataCopyWithImpl(this._self, this._then);

  final IbuHamilResponseData _self;
  final $Res Function(IbuHamilResponseData) _then;

/// Create a copy of IbuHamilResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? namaLengkap = null,Object? nik = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IbuHamilResponseData].
extension IbuHamilResponseDataPatterns on IbuHamilResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IbuHamilResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IbuHamilResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IbuHamilResponseData value)  $default,){
final _that = this;
switch (_that) {
case _IbuHamilResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IbuHamilResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _IbuHamilResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IbuHamilResponseData() when $default != null:
return $default(_that.id,_that.namaLengkap,_that.nik);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik)  $default,) {final _that = this;
switch (_that) {
case _IbuHamilResponseData():
return $default(_that.id,_that.namaLengkap,_that.nik);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'nama_lengkap')  String namaLengkap,  String nik)?  $default,) {final _that = this;
switch (_that) {
case _IbuHamilResponseData() when $default != null:
return $default(_that.id,_that.namaLengkap,_that.nik);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IbuHamilResponseData implements IbuHamilResponseData {
  const _IbuHamilResponseData({required this.id, @JsonKey(name: 'nama_lengkap') required this.namaLengkap, required this.nik});
  factory _IbuHamilResponseData.fromJson(Map<String, dynamic> json) => _$IbuHamilResponseDataFromJson(json);

@override final  int id;
@override@JsonKey(name: 'nama_lengkap') final  String namaLengkap;
@override final  String nik;

/// Create a copy of IbuHamilResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IbuHamilResponseDataCopyWith<_IbuHamilResponseData> get copyWith => __$IbuHamilResponseDataCopyWithImpl<_IbuHamilResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IbuHamilResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IbuHamilResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.namaLengkap, namaLengkap) || other.namaLengkap == namaLengkap)&&(identical(other.nik, nik) || other.nik == nik));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,namaLengkap,nik);

@override
String toString() {
  return 'IbuHamilResponseData(id: $id, namaLengkap: $namaLengkap, nik: $nik)';
}


}

/// @nodoc
abstract mixin class _$IbuHamilResponseDataCopyWith<$Res> implements $IbuHamilResponseDataCopyWith<$Res> {
  factory _$IbuHamilResponseDataCopyWith(_IbuHamilResponseData value, $Res Function(_IbuHamilResponseData) _then) = __$IbuHamilResponseDataCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'nama_lengkap') String namaLengkap, String nik
});




}
/// @nodoc
class __$IbuHamilResponseDataCopyWithImpl<$Res>
    implements _$IbuHamilResponseDataCopyWith<$Res> {
  __$IbuHamilResponseDataCopyWithImpl(this._self, this._then);

  final _IbuHamilResponseData _self;
  final $Res Function(_IbuHamilResponseData) _then;

/// Create a copy of IbuHamilResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? namaLengkap = null,Object? nik = null,}) {
  return _then(_IbuHamilResponseData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,namaLengkap: null == namaLengkap ? _self.namaLengkap : namaLengkap // ignore: cast_nullable_to_non_nullable
as String,nik: null == nik ? _self.nik : nik // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserResponseData {

 int get id; String get phone;@JsonKey(name: 'full_name') String get fullName;
/// Create a copy of UserResponseData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResponseDataCopyWith<UserResponseData> get copyWith => _$UserResponseDataCopyWithImpl<UserResponseData>(this as UserResponseData, _$identity);

  /// Serializes this UserResponseData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,fullName);

@override
String toString() {
  return 'UserResponseData(id: $id, phone: $phone, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $UserResponseDataCopyWith<$Res>  {
  factory $UserResponseDataCopyWith(UserResponseData value, $Res Function(UserResponseData) _then) = _$UserResponseDataCopyWithImpl;
@useResult
$Res call({
 int id, String phone,@JsonKey(name: 'full_name') String fullName
});




}
/// @nodoc
class _$UserResponseDataCopyWithImpl<$Res>
    implements $UserResponseDataCopyWith<$Res> {
  _$UserResponseDataCopyWithImpl(this._self, this._then);

  final UserResponseData _self;
  final $Res Function(UserResponseData) _then;

/// Create a copy of UserResponseData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phone = null,Object? fullName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserResponseData].
extension UserResponseDataPatterns on UserResponseData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResponseData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResponseData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResponseData value)  $default,){
final _that = this;
switch (_that) {
case _UserResponseData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResponseData value)?  $default,){
final _that = this;
switch (_that) {
case _UserResponseData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String phone, @JsonKey(name: 'full_name')  String fullName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResponseData() when $default != null:
return $default(_that.id,_that.phone,_that.fullName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String phone, @JsonKey(name: 'full_name')  String fullName)  $default,) {final _that = this;
switch (_that) {
case _UserResponseData():
return $default(_that.id,_that.phone,_that.fullName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String phone, @JsonKey(name: 'full_name')  String fullName)?  $default,) {final _that = this;
switch (_that) {
case _UserResponseData() when $default != null:
return $default(_that.id,_that.phone,_that.fullName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResponseData implements UserResponseData {
  const _UserResponseData({required this.id, required this.phone, @JsonKey(name: 'full_name') required this.fullName});
  factory _UserResponseData.fromJson(Map<String, dynamic> json) => _$UserResponseDataFromJson(json);

@override final  int id;
@override final  String phone;
@override@JsonKey(name: 'full_name') final  String fullName;

/// Create a copy of UserResponseData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResponseDataCopyWith<_UserResponseData> get copyWith => __$UserResponseDataCopyWithImpl<_UserResponseData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResponseDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResponseData&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,fullName);

@override
String toString() {
  return 'UserResponseData(id: $id, phone: $phone, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class _$UserResponseDataCopyWith<$Res> implements $UserResponseDataCopyWith<$Res> {
  factory _$UserResponseDataCopyWith(_UserResponseData value, $Res Function(_UserResponseData) _then) = __$UserResponseDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String phone,@JsonKey(name: 'full_name') String fullName
});




}
/// @nodoc
class __$UserResponseDataCopyWithImpl<$Res>
    implements _$UserResponseDataCopyWith<$Res> {
  __$UserResponseDataCopyWithImpl(this._self, this._then);

  final _UserResponseData _self;
  final $Res Function(_UserResponseData) _then;

/// Create a copy of UserResponseData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phone = null,Object? fullName = null,}) {
  return _then(_UserResponseData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
