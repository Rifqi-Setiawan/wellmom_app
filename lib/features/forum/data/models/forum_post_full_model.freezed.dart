// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_post_full_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumPostFullModel {

 int get id;@JsonKey(name: 'author_user_id') int get authorUserId;@JsonKey(name: 'author_name') String get authorName;@JsonKey(name: 'author_role') String get authorRole;@JsonKey(name: 'author_photo_url') String? get authorPhotoUrl; String get title; String get details;@JsonKey(name: 'category_id') int get categoryId;@JsonKey(name: 'category_name') String get categoryName;@JsonKey(name: 'category_display_name') String get categoryDisplayName;@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'reply_count') int get replyCount;@JsonKey(name: 'is_liked') bool get isLiked;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ForumPostFullModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumPostFullModelCopyWith<ForumPostFullModel> get copyWith => _$ForumPostFullModelCopyWithImpl<ForumPostFullModel>(this as ForumPostFullModel, _$identity);

  /// Serializes this ForumPostFullModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumPostFullModel&&(identical(other.id, id) || other.id == id)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.authorPhotoUrl, authorPhotoUrl) || other.authorPhotoUrl == authorPhotoUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.details, details) || other.details == details)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryDisplayName, categoryDisplayName) || other.categoryDisplayName == categoryDisplayName)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorUserId,authorName,authorRole,authorPhotoUrl,title,details,categoryId,categoryName,categoryDisplayName,likeCount,replyCount,isLiked,createdAt,updatedAt);

@override
String toString() {
  return 'ForumPostFullModel(id: $id, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, authorPhotoUrl: $authorPhotoUrl, title: $title, details: $details, categoryId: $categoryId, categoryName: $categoryName, categoryDisplayName: $categoryDisplayName, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ForumPostFullModelCopyWith<$Res>  {
  factory $ForumPostFullModelCopyWith(ForumPostFullModel value, $Res Function(ForumPostFullModel) _then) = _$ForumPostFullModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'author_user_id') int authorUserId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_role') String authorRole,@JsonKey(name: 'author_photo_url') String? authorPhotoUrl, String title, String details,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'category_display_name') String categoryDisplayName,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'reply_count') int replyCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ForumPostFullModelCopyWithImpl<$Res>
    implements $ForumPostFullModelCopyWith<$Res> {
  _$ForumPostFullModelCopyWithImpl(this._self, this._then);

  final ForumPostFullModel _self;
  final $Res Function(ForumPostFullModel) _then;

/// Create a copy of ForumPostFullModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorUserId = null,Object? authorName = null,Object? authorRole = null,Object? authorPhotoUrl = freezed,Object? title = null,Object? details = null,Object? categoryId = null,Object? categoryName = null,Object? categoryDisplayName = null,Object? likeCount = null,Object? replyCount = null,Object? isLiked = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authorUserId: null == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,authorPhotoUrl: freezed == authorPhotoUrl ? _self.authorPhotoUrl : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,categoryDisplayName: null == categoryDisplayName ? _self.categoryDisplayName : categoryDisplayName // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumPostFullModel].
extension ForumPostFullModelPatterns on ForumPostFullModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumPostFullModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumPostFullModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumPostFullModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumPostFullModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumPostFullModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumPostFullModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String title,  String details, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'category_display_name')  String categoryDisplayName, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumPostFullModel() when $default != null:
return $default(_that.id,_that.authorUserId,_that.authorName,_that.authorRole,_that.authorPhotoUrl,_that.title,_that.details,_that.categoryId,_that.categoryName,_that.categoryDisplayName,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String title,  String details, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'category_display_name')  String categoryDisplayName, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ForumPostFullModel():
return $default(_that.id,_that.authorUserId,_that.authorName,_that.authorRole,_that.authorPhotoUrl,_that.title,_that.details,_that.categoryId,_that.categoryName,_that.categoryDisplayName,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole, @JsonKey(name: 'author_photo_url')  String? authorPhotoUrl,  String title,  String details, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'category_name')  String categoryName, @JsonKey(name: 'category_display_name')  String categoryDisplayName, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ForumPostFullModel() when $default != null:
return $default(_that.id,_that.authorUserId,_that.authorName,_that.authorRole,_that.authorPhotoUrl,_that.title,_that.details,_that.categoryId,_that.categoryName,_that.categoryDisplayName,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumPostFullModel implements ForumPostFullModel {
  const _ForumPostFullModel({required this.id, @JsonKey(name: 'author_user_id') required this.authorUserId, @JsonKey(name: 'author_name') required this.authorName, @JsonKey(name: 'author_role') required this.authorRole, @JsonKey(name: 'author_photo_url') this.authorPhotoUrl, required this.title, required this.details, @JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'category_name') required this.categoryName, @JsonKey(name: 'category_display_name') required this.categoryDisplayName, @JsonKey(name: 'like_count') required this.likeCount, @JsonKey(name: 'reply_count') required this.replyCount, @JsonKey(name: 'is_liked') required this.isLiked, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ForumPostFullModel.fromJson(Map<String, dynamic> json) => _$ForumPostFullModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'author_user_id') final  int authorUserId;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey(name: 'author_role') final  String authorRole;
@override@JsonKey(name: 'author_photo_url') final  String? authorPhotoUrl;
@override final  String title;
@override final  String details;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override@JsonKey(name: 'category_name') final  String categoryName;
@override@JsonKey(name: 'category_display_name') final  String categoryDisplayName;
@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'reply_count') final  int replyCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ForumPostFullModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumPostFullModelCopyWith<_ForumPostFullModel> get copyWith => __$ForumPostFullModelCopyWithImpl<_ForumPostFullModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumPostFullModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumPostFullModel&&(identical(other.id, id) || other.id == id)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.authorPhotoUrl, authorPhotoUrl) || other.authorPhotoUrl == authorPhotoUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.details, details) || other.details == details)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryDisplayName, categoryDisplayName) || other.categoryDisplayName == categoryDisplayName)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorUserId,authorName,authorRole,authorPhotoUrl,title,details,categoryId,categoryName,categoryDisplayName,likeCount,replyCount,isLiked,createdAt,updatedAt);

@override
String toString() {
  return 'ForumPostFullModel(id: $id, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, authorPhotoUrl: $authorPhotoUrl, title: $title, details: $details, categoryId: $categoryId, categoryName: $categoryName, categoryDisplayName: $categoryDisplayName, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ForumPostFullModelCopyWith<$Res> implements $ForumPostFullModelCopyWith<$Res> {
  factory _$ForumPostFullModelCopyWith(_ForumPostFullModel value, $Res Function(_ForumPostFullModel) _then) = __$ForumPostFullModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'author_user_id') int authorUserId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_role') String authorRole,@JsonKey(name: 'author_photo_url') String? authorPhotoUrl, String title, String details,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'category_name') String categoryName,@JsonKey(name: 'category_display_name') String categoryDisplayName,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'reply_count') int replyCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ForumPostFullModelCopyWithImpl<$Res>
    implements _$ForumPostFullModelCopyWith<$Res> {
  __$ForumPostFullModelCopyWithImpl(this._self, this._then);

  final _ForumPostFullModel _self;
  final $Res Function(_ForumPostFullModel) _then;

/// Create a copy of ForumPostFullModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorUserId = null,Object? authorName = null,Object? authorRole = null,Object? authorPhotoUrl = freezed,Object? title = null,Object? details = null,Object? categoryId = null,Object? categoryName = null,Object? categoryDisplayName = null,Object? likeCount = null,Object? replyCount = null,Object? isLiked = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ForumPostFullModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authorUserId: null == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,authorPhotoUrl: freezed == authorPhotoUrl ? _self.authorPhotoUrl : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,categoryDisplayName: null == categoryDisplayName ? _self.categoryDisplayName : categoryDisplayName // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ForumPostsResponseModel {

 List<ForumPostFullModel> get posts; int get total;@JsonKey(name: 'has_more') bool get hasMore;
/// Create a copy of ForumPostsResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumPostsResponseModelCopyWith<ForumPostsResponseModel> get copyWith => _$ForumPostsResponseModelCopyWithImpl<ForumPostsResponseModel>(this as ForumPostsResponseModel, _$identity);

  /// Serializes this ForumPostsResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumPostsResponseModel&&const DeepCollectionEquality().equals(other.posts, posts)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts),total,hasMore);

@override
String toString() {
  return 'ForumPostsResponseModel(posts: $posts, total: $total, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $ForumPostsResponseModelCopyWith<$Res>  {
  factory $ForumPostsResponseModelCopyWith(ForumPostsResponseModel value, $Res Function(ForumPostsResponseModel) _then) = _$ForumPostsResponseModelCopyWithImpl;
@useResult
$Res call({
 List<ForumPostFullModel> posts, int total,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class _$ForumPostsResponseModelCopyWithImpl<$Res>
    implements $ForumPostsResponseModelCopyWith<$Res> {
  _$ForumPostsResponseModelCopyWithImpl(this._self, this._then);

  final ForumPostsResponseModel _self;
  final $Res Function(ForumPostsResponseModel) _then;

/// Create a copy of ForumPostsResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? total = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<ForumPostFullModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumPostsResponseModel].
extension ForumPostsResponseModelPatterns on ForumPostsResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumPostsResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumPostsResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumPostsResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumPostsResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumPostsResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumPostsResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForumPostFullModel> posts,  int total, @JsonKey(name: 'has_more')  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumPostsResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForumPostFullModel> posts,  int total, @JsonKey(name: 'has_more')  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _ForumPostsResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForumPostFullModel> posts,  int total, @JsonKey(name: 'has_more')  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _ForumPostsResponseModel() when $default != null:
return $default(_that.posts,_that.total,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumPostsResponseModel implements ForumPostsResponseModel {
  const _ForumPostsResponseModel({required final  List<ForumPostFullModel> posts, required this.total, @JsonKey(name: 'has_more') required this.hasMore}): _posts = posts;
  factory _ForumPostsResponseModel.fromJson(Map<String, dynamic> json) => _$ForumPostsResponseModelFromJson(json);

 final  List<ForumPostFullModel> _posts;
@override List<ForumPostFullModel> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

@override final  int total;
@override@JsonKey(name: 'has_more') final  bool hasMore;

/// Create a copy of ForumPostsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumPostsResponseModelCopyWith<_ForumPostsResponseModel> get copyWith => __$ForumPostsResponseModelCopyWithImpl<_ForumPostsResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumPostsResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumPostsResponseModel&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),total,hasMore);

@override
String toString() {
  return 'ForumPostsResponseModel(posts: $posts, total: $total, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$ForumPostsResponseModelCopyWith<$Res> implements $ForumPostsResponseModelCopyWith<$Res> {
  factory _$ForumPostsResponseModelCopyWith(_ForumPostsResponseModel value, $Res Function(_ForumPostsResponseModel) _then) = __$ForumPostsResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<ForumPostFullModel> posts, int total,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class __$ForumPostsResponseModelCopyWithImpl<$Res>
    implements _$ForumPostsResponseModelCopyWith<$Res> {
  __$ForumPostsResponseModelCopyWithImpl(this._self, this._then);

  final _ForumPostsResponseModel _self;
  final $Res Function(_ForumPostsResponseModel) _then;

/// Create a copy of ForumPostsResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? total = null,Object? hasMore = null,}) {
  return _then(_ForumPostsResponseModel(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<ForumPostFullModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
