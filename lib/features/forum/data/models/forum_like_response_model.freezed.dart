// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_like_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumLikeResponseModel {

@JsonKey(name: 'post_id') int get postId;@JsonKey(name: 'is_liked') bool get isLiked;@JsonKey(name: 'like_count') int get likeCount; String get message;
/// Create a copy of ForumLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumLikeResponseModelCopyWith<ForumLikeResponseModel> get copyWith => _$ForumLikeResponseModelCopyWithImpl<ForumLikeResponseModel>(this as ForumLikeResponseModel, _$identity);

  /// Serializes this ForumLikeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumLikeResponseModel&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,isLiked,likeCount,message);

@override
String toString() {
  return 'ForumLikeResponseModel(postId: $postId, isLiked: $isLiked, likeCount: $likeCount, message: $message)';
}


}

/// @nodoc
abstract mixin class $ForumLikeResponseModelCopyWith<$Res>  {
  factory $ForumLikeResponseModelCopyWith(ForumLikeResponseModel value, $Res Function(ForumLikeResponseModel) _then) = _$ForumLikeResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'post_id') int postId,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'like_count') int likeCount, String message
});




}
/// @nodoc
class _$ForumLikeResponseModelCopyWithImpl<$Res>
    implements $ForumLikeResponseModelCopyWith<$Res> {
  _$ForumLikeResponseModelCopyWithImpl(this._self, this._then);

  final ForumLikeResponseModel _self;
  final $Res Function(ForumLikeResponseModel) _then;

/// Create a copy of ForumLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,Object? isLiked = null,Object? likeCount = null,Object? message = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumLikeResponseModel].
extension ForumLikeResponseModelPatterns on ForumLikeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumLikeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumLikeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumLikeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumLikeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumLikeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumLikeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'post_id')  int postId, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'like_count')  int likeCount,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumLikeResponseModel() when $default != null:
return $default(_that.postId,_that.isLiked,_that.likeCount,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'post_id')  int postId, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'like_count')  int likeCount,  String message)  $default,) {final _that = this;
switch (_that) {
case _ForumLikeResponseModel():
return $default(_that.postId,_that.isLiked,_that.likeCount,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'post_id')  int postId, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'like_count')  int likeCount,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ForumLikeResponseModel() when $default != null:
return $default(_that.postId,_that.isLiked,_that.likeCount,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumLikeResponseModel implements ForumLikeResponseModel {
  const _ForumLikeResponseModel({@JsonKey(name: 'post_id') required this.postId, @JsonKey(name: 'is_liked') required this.isLiked, @JsonKey(name: 'like_count') required this.likeCount, required this.message});
  factory _ForumLikeResponseModel.fromJson(Map<String, dynamic> json) => _$ForumLikeResponseModelFromJson(json);

@override@JsonKey(name: 'post_id') final  int postId;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey(name: 'like_count') final  int likeCount;
@override final  String message;

/// Create a copy of ForumLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumLikeResponseModelCopyWith<_ForumLikeResponseModel> get copyWith => __$ForumLikeResponseModelCopyWithImpl<_ForumLikeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumLikeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumLikeResponseModel&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,isLiked,likeCount,message);

@override
String toString() {
  return 'ForumLikeResponseModel(postId: $postId, isLiked: $isLiked, likeCount: $likeCount, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ForumLikeResponseModelCopyWith<$Res> implements $ForumLikeResponseModelCopyWith<$Res> {
  factory _$ForumLikeResponseModelCopyWith(_ForumLikeResponseModel value, $Res Function(_ForumLikeResponseModel) _then) = __$ForumLikeResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'post_id') int postId,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'like_count') int likeCount, String message
});




}
/// @nodoc
class __$ForumLikeResponseModelCopyWithImpl<$Res>
    implements _$ForumLikeResponseModelCopyWith<$Res> {
  __$ForumLikeResponseModelCopyWithImpl(this._self, this._then);

  final _ForumLikeResponseModel _self;
  final $Res Function(_ForumLikeResponseModel) _then;

/// Create a copy of ForumLikeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? isLiked = null,Object? likeCount = null,Object? message = null,}) {
  return _then(_ForumLikeResponseModel(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
