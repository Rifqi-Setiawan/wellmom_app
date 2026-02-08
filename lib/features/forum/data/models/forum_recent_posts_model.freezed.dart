// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_recent_posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumRecentPostsModel {

 List<ForumPostModel> get posts; int get total;@JsonKey(name: 'has_more') bool get hasMore;
/// Create a copy of ForumRecentPostsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumRecentPostsModelCopyWith<ForumRecentPostsModel> get copyWith => _$ForumRecentPostsModelCopyWithImpl<ForumRecentPostsModel>(this as ForumRecentPostsModel, _$identity);

  /// Serializes this ForumRecentPostsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumRecentPostsModel&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts),total,hasMore);

@override
String toString() {
  return 'ForumRecentPostsModel(posts: $posts, total: $total, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $ForumRecentPostsModelCopyWith<$Res>  {
  factory $ForumRecentPostsModelCopyWith(ForumRecentPostsModel value, $Res Function(ForumRecentPostsModel) _then) = _$ForumRecentPostsModelCopyWithImpl;
@useResult
$Res call({
 List<ForumPostModel> posts, int total,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class _$ForumRecentPostsModelCopyWithImpl<$Res>
    implements $ForumRecentPostsModelCopyWith<$Res> {
  _$ForumRecentPostsModelCopyWithImpl(this._self, this._then);

  final ForumRecentPostsModel _self;
  final $Res Function(ForumRecentPostsModel) _then;

/// Create a copy of ForumRecentPostsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? total = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<ForumPostModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumRecentPostsModel].
extension ForumRecentPostsModelPatterns on ForumRecentPostsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumRecentPostsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumRecentPostsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumRecentPostsModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumRecentPostsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumRecentPostsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumRecentPostsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForumPostModel> posts,  int total, @JsonKey(name: 'has_more')  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumRecentPostsModel() when $default != null:
return $default(_that.posts,_that.total,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForumPostModel> posts,  int total, @JsonKey(name: 'has_more')  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _ForumRecentPostsModel():
return $default(_that.posts,_that.total,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForumPostModel> posts,  int total, @JsonKey(name: 'has_more')  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _ForumRecentPostsModel() when $default != null:
return $default(_that.posts,_that.total,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumRecentPostsModel implements ForumRecentPostsModel {
  const _ForumRecentPostsModel({required final  List<ForumPostModel> posts, required this.total, @JsonKey(name: 'has_more') required this.hasMore}): _posts = posts;
  factory _ForumRecentPostsModel.fromJson(Map<String, dynamic> json) => _$ForumRecentPostsModelFromJson(json);

 final  List<ForumPostModel> _posts;
@override List<ForumPostModel> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override final  int total;
@override@JsonKey(name: 'has_more') final  bool hasMore;

/// Create a copy of ForumRecentPostsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumRecentPostsModelCopyWith<_ForumRecentPostsModel> get copyWith => __$ForumRecentPostsModelCopyWithImpl<_ForumRecentPostsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumRecentPostsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumRecentPostsModel&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),total,hasMore);

@override
String toString() {
  return 'ForumRecentPostsModel(posts: $posts, total: $total, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$ForumRecentPostsModelCopyWith<$Res> implements $ForumRecentPostsModelCopyWith<$Res> {
  factory _$ForumRecentPostsModelCopyWith(_ForumRecentPostsModel value, $Res Function(_ForumRecentPostsModel) _then) = __$ForumRecentPostsModelCopyWithImpl;
@override @useResult
$Res call({
 List<ForumPostModel> posts, int total,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class __$ForumRecentPostsModelCopyWithImpl<$Res>
    implements _$ForumRecentPostsModelCopyWith<$Res> {
  __$ForumRecentPostsModelCopyWithImpl(this._self, this._then);

  final _ForumRecentPostsModel _self;
  final $Res Function(_ForumRecentPostsModel) _then;

/// Create a copy of ForumRecentPostsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? total = null,Object? hasMore = null,}) {
  return _then(_ForumRecentPostsModel(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<ForumPostModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
