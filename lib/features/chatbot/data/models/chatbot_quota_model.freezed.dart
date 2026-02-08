// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_quota_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatbotQuotaModel {

@JsonKey(name: 'used_today') int get usedToday; int get limit; int get remaining;@JsonKey(name: 'resets_at') DateTime get resetsAt;
/// Create a copy of ChatbotQuotaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotQuotaModelCopyWith<ChatbotQuotaModel> get copyWith => _$ChatbotQuotaModelCopyWithImpl<ChatbotQuotaModel>(this as ChatbotQuotaModel, _$identity);

  /// Serializes this ChatbotQuotaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotQuotaModel&&(identical(other.usedToday, usedToday) || other.usedToday == usedToday)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usedToday,limit,remaining,resetsAt);

@override
String toString() {
  return 'ChatbotQuotaModel(usedToday: $usedToday, limit: $limit, remaining: $remaining, resetsAt: $resetsAt)';
}


}

/// @nodoc
abstract mixin class $ChatbotQuotaModelCopyWith<$Res>  {
  factory $ChatbotQuotaModelCopyWith(ChatbotQuotaModel value, $Res Function(ChatbotQuotaModel) _then) = _$ChatbotQuotaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'used_today') int usedToday, int limit, int remaining,@JsonKey(name: 'resets_at') DateTime resetsAt
});




}
/// @nodoc
class _$ChatbotQuotaModelCopyWithImpl<$Res>
    implements $ChatbotQuotaModelCopyWith<$Res> {
  _$ChatbotQuotaModelCopyWithImpl(this._self, this._then);

  final ChatbotQuotaModel _self;
  final $Res Function(ChatbotQuotaModel) _then;

/// Create a copy of ChatbotQuotaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usedToday = null,Object? limit = null,Object? remaining = null,Object? resetsAt = null,}) {
  return _then(_self.copyWith(
usedToday: null == usedToday ? _self.usedToday : usedToday // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,resetsAt: null == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatbotQuotaModel].
extension ChatbotQuotaModelPatterns on ChatbotQuotaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatbotQuotaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatbotQuotaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatbotQuotaModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatbotQuotaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatbotQuotaModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatbotQuotaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'used_today')  int usedToday,  int limit,  int remaining, @JsonKey(name: 'resets_at')  DateTime resetsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatbotQuotaModel() when $default != null:
return $default(_that.usedToday,_that.limit,_that.remaining,_that.resetsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'used_today')  int usedToday,  int limit,  int remaining, @JsonKey(name: 'resets_at')  DateTime resetsAt)  $default,) {final _that = this;
switch (_that) {
case _ChatbotQuotaModel():
return $default(_that.usedToday,_that.limit,_that.remaining,_that.resetsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'used_today')  int usedToday,  int limit,  int remaining, @JsonKey(name: 'resets_at')  DateTime resetsAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatbotQuotaModel() when $default != null:
return $default(_that.usedToday,_that.limit,_that.remaining,_that.resetsAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatbotQuotaModel implements ChatbotQuotaModel {
  const _ChatbotQuotaModel({@JsonKey(name: 'used_today') required this.usedToday, required this.limit, required this.remaining, @JsonKey(name: 'resets_at') required this.resetsAt});
  factory _ChatbotQuotaModel.fromJson(Map<String, dynamic> json) => _$ChatbotQuotaModelFromJson(json);

@override@JsonKey(name: 'used_today') final  int usedToday;
@override final  int limit;
@override final  int remaining;
@override@JsonKey(name: 'resets_at') final  DateTime resetsAt;

/// Create a copy of ChatbotQuotaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatbotQuotaModelCopyWith<_ChatbotQuotaModel> get copyWith => __$ChatbotQuotaModelCopyWithImpl<_ChatbotQuotaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatbotQuotaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatbotQuotaModel&&(identical(other.usedToday, usedToday) || other.usedToday == usedToday)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.resetsAt, resetsAt) || other.resetsAt == resetsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usedToday,limit,remaining,resetsAt);

@override
String toString() {
  return 'ChatbotQuotaModel(usedToday: $usedToday, limit: $limit, remaining: $remaining, resetsAt: $resetsAt)';
}


}

/// @nodoc
abstract mixin class _$ChatbotQuotaModelCopyWith<$Res> implements $ChatbotQuotaModelCopyWith<$Res> {
  factory _$ChatbotQuotaModelCopyWith(_ChatbotQuotaModel value, $Res Function(_ChatbotQuotaModel) _then) = __$ChatbotQuotaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'used_today') int usedToday, int limit, int remaining,@JsonKey(name: 'resets_at') DateTime resetsAt
});




}
/// @nodoc
class __$ChatbotQuotaModelCopyWithImpl<$Res>
    implements _$ChatbotQuotaModelCopyWith<$Res> {
  __$ChatbotQuotaModelCopyWithImpl(this._self, this._then);

  final _ChatbotQuotaModel _self;
  final $Res Function(_ChatbotQuotaModel) _then;

/// Create a copy of ChatbotQuotaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usedToday = null,Object? limit = null,Object? remaining = null,Object? resetsAt = null,}) {
  return _then(_ChatbotQuotaModel(
usedToday: null == usedToday ? _self.usedToday : usedToday // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,resetsAt: null == resetsAt ? _self.resetsAt : resetsAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
