// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_replies_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumRepliesResponseModel {

 List<ForumReplyModel> get replies; int get total;
/// Create a copy of ForumRepliesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumRepliesResponseModelCopyWith<ForumRepliesResponseModel> get copyWith => _$ForumRepliesResponseModelCopyWithImpl<ForumRepliesResponseModel>(this as ForumRepliesResponseModel, _$identity);

  /// Serializes this ForumRepliesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumRepliesResponseModel&&const DeepCollectionEquality().equals(other.replies, replies)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(replies),total);

@override
String toString() {
  return 'ForumRepliesResponseModel(replies: $replies, total: $total)';
}


}

/// @nodoc
abstract mixin class $ForumRepliesResponseModelCopyWith<$Res>  {
  factory $ForumRepliesResponseModelCopyWith(ForumRepliesResponseModel value, $Res Function(ForumRepliesResponseModel) _then) = _$ForumRepliesResponseModelCopyWithImpl;
@useResult
$Res call({
 List<ForumReplyModel> replies, int total
});




}
/// @nodoc
class _$ForumRepliesResponseModelCopyWithImpl<$Res>
    implements $ForumRepliesResponseModelCopyWith<$Res> {
  _$ForumRepliesResponseModelCopyWithImpl(this._self, this._then);

  final ForumRepliesResponseModel _self;
  final $Res Function(ForumRepliesResponseModel) _then;

/// Create a copy of ForumRepliesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? replies = null,Object? total = null,}) {
  return _then(_self.copyWith(
replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<ForumReplyModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumRepliesResponseModel].
extension ForumRepliesResponseModelPatterns on ForumRepliesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumRepliesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumRepliesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumRepliesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumRepliesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumRepliesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumRepliesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForumReplyModel> replies,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumRepliesResponseModel() when $default != null:
return $default(_that.replies,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForumReplyModel> replies,  int total)  $default,) {final _that = this;
switch (_that) {
case _ForumRepliesResponseModel():
return $default(_that.replies,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForumReplyModel> replies,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ForumRepliesResponseModel() when $default != null:
return $default(_that.replies,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumRepliesResponseModel implements ForumRepliesResponseModel {
  const _ForumRepliesResponseModel({required final  List<ForumReplyModel> replies, required this.total}): _replies = replies;
  factory _ForumRepliesResponseModel.fromJson(Map<String, dynamic> json) => _$ForumRepliesResponseModelFromJson(json);

 final  List<ForumReplyModel> _replies;
@override List<ForumReplyModel> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}

@override final  int total;

/// Create a copy of ForumRepliesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumRepliesResponseModelCopyWith<_ForumRepliesResponseModel> get copyWith => __$ForumRepliesResponseModelCopyWithImpl<_ForumRepliesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumRepliesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumRepliesResponseModel&&const DeepCollectionEquality().equals(other._replies, _replies)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_replies),total);

@override
String toString() {
  return 'ForumRepliesResponseModel(replies: $replies, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ForumRepliesResponseModelCopyWith<$Res> implements $ForumRepliesResponseModelCopyWith<$Res> {
  factory _$ForumRepliesResponseModelCopyWith(_ForumRepliesResponseModel value, $Res Function(_ForumRepliesResponseModel) _then) = __$ForumRepliesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<ForumReplyModel> replies, int total
});




}
/// @nodoc
class __$ForumRepliesResponseModelCopyWithImpl<$Res>
    implements _$ForumRepliesResponseModelCopyWith<$Res> {
  __$ForumRepliesResponseModelCopyWithImpl(this._self, this._then);

  final _ForumRepliesResponseModel _self;
  final $Res Function(_ForumRepliesResponseModel) _then;

/// Create a copy of ForumRepliesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? replies = null,Object? total = null,}) {
  return _then(_ForumRepliesResponseModel(
replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<ForumReplyModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
