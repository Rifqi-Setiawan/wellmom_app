// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kerabat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KerabatModel {

 int get id;@JsonKey(name: 'kerabat_user_id') int get kerabatUserId;// user_id dari kerabat
@JsonKey(name: 'ibu_hamil_id') int get ibuHamilId;// foreign key ke ibu hamil
@JsonKey(name: 'relation_type') String get relationType;// 'Suami', 'Kakak', 'Ibu', etc.
@JsonKey(name: 'is_primary_contact') bool get isPrimaryContact;@JsonKey(name: 'can_view_records') bool get canViewRecords;@JsonKey(name: 'can_receive_notifications') bool get canReceiveNotifications;@JsonKey(name: 'invite_code') String? get inviteCode;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of KerabatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KerabatModelCopyWith<KerabatModel> get copyWith => _$KerabatModelCopyWithImpl<KerabatModel>(this as KerabatModel, _$identity);

  /// Serializes this KerabatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KerabatModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kerabatUserId, kerabatUserId) || other.kerabatUserId == kerabatUserId)&&(identical(other.ibuHamilId, ibuHamilId) || other.ibuHamilId == ibuHamilId)&&(identical(other.relationType, relationType) || other.relationType == relationType)&&(identical(other.isPrimaryContact, isPrimaryContact) || other.isPrimaryContact == isPrimaryContact)&&(identical(other.canViewRecords, canViewRecords) || other.canViewRecords == canViewRecords)&&(identical(other.canReceiveNotifications, canReceiveNotifications) || other.canReceiveNotifications == canReceiveNotifications)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kerabatUserId,ibuHamilId,relationType,isPrimaryContact,canViewRecords,canReceiveNotifications,inviteCode,createdAt,updatedAt);

@override
String toString() {
  return 'KerabatModel(id: $id, kerabatUserId: $kerabatUserId, ibuHamilId: $ibuHamilId, relationType: $relationType, isPrimaryContact: $isPrimaryContact, canViewRecords: $canViewRecords, canReceiveNotifications: $canReceiveNotifications, inviteCode: $inviteCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $KerabatModelCopyWith<$Res>  {
  factory $KerabatModelCopyWith(KerabatModel value, $Res Function(KerabatModel) _then) = _$KerabatModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'kerabat_user_id') int kerabatUserId,@JsonKey(name: 'ibu_hamil_id') int ibuHamilId,@JsonKey(name: 'relation_type') String relationType,@JsonKey(name: 'is_primary_contact') bool isPrimaryContact,@JsonKey(name: 'can_view_records') bool canViewRecords,@JsonKey(name: 'can_receive_notifications') bool canReceiveNotifications,@JsonKey(name: 'invite_code') String? inviteCode,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$KerabatModelCopyWithImpl<$Res>
    implements $KerabatModelCopyWith<$Res> {
  _$KerabatModelCopyWithImpl(this._self, this._then);

  final KerabatModel _self;
  final $Res Function(KerabatModel) _then;

/// Create a copy of KerabatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kerabatUserId = null,Object? ibuHamilId = null,Object? relationType = null,Object? isPrimaryContact = null,Object? canViewRecords = null,Object? canReceiveNotifications = null,Object? inviteCode = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kerabatUserId: null == kerabatUserId ? _self.kerabatUserId : kerabatUserId // ignore: cast_nullable_to_non_nullable
as int,ibuHamilId: null == ibuHamilId ? _self.ibuHamilId : ibuHamilId // ignore: cast_nullable_to_non_nullable
as int,relationType: null == relationType ? _self.relationType : relationType // ignore: cast_nullable_to_non_nullable
as String,isPrimaryContact: null == isPrimaryContact ? _self.isPrimaryContact : isPrimaryContact // ignore: cast_nullable_to_non_nullable
as bool,canViewRecords: null == canViewRecords ? _self.canViewRecords : canViewRecords // ignore: cast_nullable_to_non_nullable
as bool,canReceiveNotifications: null == canReceiveNotifications ? _self.canReceiveNotifications : canReceiveNotifications // ignore: cast_nullable_to_non_nullable
as bool,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [KerabatModel].
extension KerabatModelPatterns on KerabatModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KerabatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KerabatModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KerabatModel value)  $default,){
final _that = this;
switch (_that) {
case _KerabatModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KerabatModel value)?  $default,){
final _that = this;
switch (_that) {
case _KerabatModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'kerabat_user_id')  int kerabatUserId, @JsonKey(name: 'ibu_hamil_id')  int ibuHamilId, @JsonKey(name: 'relation_type')  String relationType, @JsonKey(name: 'is_primary_contact')  bool isPrimaryContact, @JsonKey(name: 'can_view_records')  bool canViewRecords, @JsonKey(name: 'can_receive_notifications')  bool canReceiveNotifications, @JsonKey(name: 'invite_code')  String? inviteCode, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KerabatModel() when $default != null:
return $default(_that.id,_that.kerabatUserId,_that.ibuHamilId,_that.relationType,_that.isPrimaryContact,_that.canViewRecords,_that.canReceiveNotifications,_that.inviteCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'kerabat_user_id')  int kerabatUserId, @JsonKey(name: 'ibu_hamil_id')  int ibuHamilId, @JsonKey(name: 'relation_type')  String relationType, @JsonKey(name: 'is_primary_contact')  bool isPrimaryContact, @JsonKey(name: 'can_view_records')  bool canViewRecords, @JsonKey(name: 'can_receive_notifications')  bool canReceiveNotifications, @JsonKey(name: 'invite_code')  String? inviteCode, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _KerabatModel():
return $default(_that.id,_that.kerabatUserId,_that.ibuHamilId,_that.relationType,_that.isPrimaryContact,_that.canViewRecords,_that.canReceiveNotifications,_that.inviteCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'kerabat_user_id')  int kerabatUserId, @JsonKey(name: 'ibu_hamil_id')  int ibuHamilId, @JsonKey(name: 'relation_type')  String relationType, @JsonKey(name: 'is_primary_contact')  bool isPrimaryContact, @JsonKey(name: 'can_view_records')  bool canViewRecords, @JsonKey(name: 'can_receive_notifications')  bool canReceiveNotifications, @JsonKey(name: 'invite_code')  String? inviteCode, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _KerabatModel() when $default != null:
return $default(_that.id,_that.kerabatUserId,_that.ibuHamilId,_that.relationType,_that.isPrimaryContact,_that.canViewRecords,_that.canReceiveNotifications,_that.inviteCode,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KerabatModel implements KerabatModel {
  const _KerabatModel({required this.id, @JsonKey(name: 'kerabat_user_id') required this.kerabatUserId, @JsonKey(name: 'ibu_hamil_id') required this.ibuHamilId, @JsonKey(name: 'relation_type') required this.relationType, @JsonKey(name: 'is_primary_contact') this.isPrimaryContact = false, @JsonKey(name: 'can_view_records') this.canViewRecords = true, @JsonKey(name: 'can_receive_notifications') this.canReceiveNotifications = true, @JsonKey(name: 'invite_code') this.inviteCode, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _KerabatModel.fromJson(Map<String, dynamic> json) => _$KerabatModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'kerabat_user_id') final  int kerabatUserId;
// user_id dari kerabat
@override@JsonKey(name: 'ibu_hamil_id') final  int ibuHamilId;
// foreign key ke ibu hamil
@override@JsonKey(name: 'relation_type') final  String relationType;
// 'Suami', 'Kakak', 'Ibu', etc.
@override@JsonKey(name: 'is_primary_contact') final  bool isPrimaryContact;
@override@JsonKey(name: 'can_view_records') final  bool canViewRecords;
@override@JsonKey(name: 'can_receive_notifications') final  bool canReceiveNotifications;
@override@JsonKey(name: 'invite_code') final  String? inviteCode;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of KerabatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KerabatModelCopyWith<_KerabatModel> get copyWith => __$KerabatModelCopyWithImpl<_KerabatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KerabatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KerabatModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kerabatUserId, kerabatUserId) || other.kerabatUserId == kerabatUserId)&&(identical(other.ibuHamilId, ibuHamilId) || other.ibuHamilId == ibuHamilId)&&(identical(other.relationType, relationType) || other.relationType == relationType)&&(identical(other.isPrimaryContact, isPrimaryContact) || other.isPrimaryContact == isPrimaryContact)&&(identical(other.canViewRecords, canViewRecords) || other.canViewRecords == canViewRecords)&&(identical(other.canReceiveNotifications, canReceiveNotifications) || other.canReceiveNotifications == canReceiveNotifications)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kerabatUserId,ibuHamilId,relationType,isPrimaryContact,canViewRecords,canReceiveNotifications,inviteCode,createdAt,updatedAt);

@override
String toString() {
  return 'KerabatModel(id: $id, kerabatUserId: $kerabatUserId, ibuHamilId: $ibuHamilId, relationType: $relationType, isPrimaryContact: $isPrimaryContact, canViewRecords: $canViewRecords, canReceiveNotifications: $canReceiveNotifications, inviteCode: $inviteCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$KerabatModelCopyWith<$Res> implements $KerabatModelCopyWith<$Res> {
  factory _$KerabatModelCopyWith(_KerabatModel value, $Res Function(_KerabatModel) _then) = __$KerabatModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'kerabat_user_id') int kerabatUserId,@JsonKey(name: 'ibu_hamil_id') int ibuHamilId,@JsonKey(name: 'relation_type') String relationType,@JsonKey(name: 'is_primary_contact') bool isPrimaryContact,@JsonKey(name: 'can_view_records') bool canViewRecords,@JsonKey(name: 'can_receive_notifications') bool canReceiveNotifications,@JsonKey(name: 'invite_code') String? inviteCode,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$KerabatModelCopyWithImpl<$Res>
    implements _$KerabatModelCopyWith<$Res> {
  __$KerabatModelCopyWithImpl(this._self, this._then);

  final _KerabatModel _self;
  final $Res Function(_KerabatModel) _then;

/// Create a copy of KerabatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kerabatUserId = null,Object? ibuHamilId = null,Object? relationType = null,Object? isPrimaryContact = null,Object? canViewRecords = null,Object? canReceiveNotifications = null,Object? inviteCode = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_KerabatModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kerabatUserId: null == kerabatUserId ? _self.kerabatUserId : kerabatUserId // ignore: cast_nullable_to_non_nullable
as int,ibuHamilId: null == ibuHamilId ? _self.ibuHamilId : ibuHamilId // ignore: cast_nullable_to_non_nullable
as int,relationType: null == relationType ? _self.relationType : relationType // ignore: cast_nullable_to_non_nullable
as String,isPrimaryContact: null == isPrimaryContact ? _self.isPrimaryContact : isPrimaryContact // ignore: cast_nullable_to_non_nullable
as bool,canViewRecords: null == canViewRecords ? _self.canViewRecords : canViewRecords // ignore: cast_nullable_to_non_nullable
as bool,canReceiveNotifications: null == canReceiveNotifications ? _self.canReceiveNotifications : canReceiveNotifications // ignore: cast_nullable_to_non_nullable
as bool,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
