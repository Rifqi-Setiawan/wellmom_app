// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puskesmas_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PuskesmasDetailModel {

 int get id; String get name; String? get phone; String? get address;@JsonKey(name: 'building_photo_url') String? get buildingPhotoUrl; double? get latitude; double? get longitude;
/// Create a copy of PuskesmasDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PuskesmasDetailModelCopyWith<PuskesmasDetailModel> get copyWith => _$PuskesmasDetailModelCopyWithImpl<PuskesmasDetailModel>(this as PuskesmasDetailModel, _$identity);

  /// Serializes this PuskesmasDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PuskesmasDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.buildingPhotoUrl, buildingPhotoUrl) || other.buildingPhotoUrl == buildingPhotoUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,buildingPhotoUrl,latitude,longitude);

@override
String toString() {
  return 'PuskesmasDetailModel(id: $id, name: $name, phone: $phone, address: $address, buildingPhotoUrl: $buildingPhotoUrl, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $PuskesmasDetailModelCopyWith<$Res>  {
  factory $PuskesmasDetailModelCopyWith(PuskesmasDetailModel value, $Res Function(PuskesmasDetailModel) _then) = _$PuskesmasDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? phone, String? address,@JsonKey(name: 'building_photo_url') String? buildingPhotoUrl, double? latitude, double? longitude
});




}
/// @nodoc
class _$PuskesmasDetailModelCopyWithImpl<$Res>
    implements $PuskesmasDetailModelCopyWith<$Res> {
  _$PuskesmasDetailModelCopyWithImpl(this._self, this._then);

  final PuskesmasDetailModel _self;
  final $Res Function(PuskesmasDetailModel) _then;

/// Create a copy of PuskesmasDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? buildingPhotoUrl = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,buildingPhotoUrl: freezed == buildingPhotoUrl ? _self.buildingPhotoUrl : buildingPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PuskesmasDetailModel].
extension PuskesmasDetailModelPatterns on PuskesmasDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PuskesmasDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PuskesmasDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PuskesmasDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PuskesmasDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PuskesmasDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PuskesmasDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? address, @JsonKey(name: 'building_photo_url')  String? buildingPhotoUrl,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PuskesmasDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.buildingPhotoUrl,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? phone,  String? address, @JsonKey(name: 'building_photo_url')  String? buildingPhotoUrl,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _PuskesmasDetailModel():
return $default(_that.id,_that.name,_that.phone,_that.address,_that.buildingPhotoUrl,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? phone,  String? address, @JsonKey(name: 'building_photo_url')  String? buildingPhotoUrl,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _PuskesmasDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.buildingPhotoUrl,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PuskesmasDetailModel implements PuskesmasDetailModel {
  const _PuskesmasDetailModel({required this.id, required this.name, this.phone, this.address, @JsonKey(name: 'building_photo_url') this.buildingPhotoUrl, this.latitude, this.longitude});
  factory _PuskesmasDetailModel.fromJson(Map<String, dynamic> json) => _$PuskesmasDetailModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? phone;
@override final  String? address;
@override@JsonKey(name: 'building_photo_url') final  String? buildingPhotoUrl;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of PuskesmasDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PuskesmasDetailModelCopyWith<_PuskesmasDetailModel> get copyWith => __$PuskesmasDetailModelCopyWithImpl<_PuskesmasDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PuskesmasDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PuskesmasDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.buildingPhotoUrl, buildingPhotoUrl) || other.buildingPhotoUrl == buildingPhotoUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,buildingPhotoUrl,latitude,longitude);

@override
String toString() {
  return 'PuskesmasDetailModel(id: $id, name: $name, phone: $phone, address: $address, buildingPhotoUrl: $buildingPhotoUrl, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$PuskesmasDetailModelCopyWith<$Res> implements $PuskesmasDetailModelCopyWith<$Res> {
  factory _$PuskesmasDetailModelCopyWith(_PuskesmasDetailModel value, $Res Function(_PuskesmasDetailModel) _then) = __$PuskesmasDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? phone, String? address,@JsonKey(name: 'building_photo_url') String? buildingPhotoUrl, double? latitude, double? longitude
});




}
/// @nodoc
class __$PuskesmasDetailModelCopyWithImpl<$Res>
    implements _$PuskesmasDetailModelCopyWith<$Res> {
  __$PuskesmasDetailModelCopyWithImpl(this._self, this._then);

  final _PuskesmasDetailModel _self;
  final $Res Function(_PuskesmasDetailModel) _then;

/// Create a copy of PuskesmasDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? buildingPhotoUrl = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_PuskesmasDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,buildingPhotoUrl: freezed == buildingPhotoUrl ? _self.buildingPhotoUrl : buildingPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
