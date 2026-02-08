// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_post_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumPostDetailModel {

 int get id;@JsonKey(name: 'author_user_id') int get authorUserId;@JsonKey(name: 'author_name') String get authorName;@JsonKey(name: 'author_role') String get authorRole; String get title; String get details;@JsonKey(name: 'like_count') int get likeCount;@JsonKey(name: 'reply_count') int get replyCount;@JsonKey(name: 'is_liked') bool get isLiked;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; List<ForumReplyModel> get replies;
/// Create a copy of ForumPostDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumPostDetailModelCopyWith<ForumPostDetailModel> get copyWith => _$ForumPostDetailModelCopyWithImpl<ForumPostDetailModel>(this as ForumPostDetailModel, _$identity);

  /// Serializes this ForumPostDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumPostDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.title, title) || other.title == title)&&(identical(other.details, details) || other.details == details)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.replies, replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorUserId,authorName,authorRole,title,details,likeCount,replyCount,isLiked,createdAt,updatedAt,const DeepCollectionEquality().hash(replies));

@override
String toString() {
  return 'ForumPostDetailModel(id: $id, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, title: $title, details: $details, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt, replies: $replies)';
}


}

/// @nodoc
abstract mixin class $ForumPostDetailModelCopyWith<$Res>  {
  factory $ForumPostDetailModelCopyWith(ForumPostDetailModel value, $Res Function(ForumPostDetailModel) _then) = _$ForumPostDetailModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'author_user_id') int authorUserId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_role') String authorRole, String title, String details,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'reply_count') int replyCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, List<ForumReplyModel> replies
});




}
/// @nodoc
class _$ForumPostDetailModelCopyWithImpl<$Res>
    implements $ForumPostDetailModelCopyWith<$Res> {
  _$ForumPostDetailModelCopyWithImpl(this._self, this._then);

  final ForumPostDetailModel _self;
  final $Res Function(ForumPostDetailModel) _then;

/// Create a copy of ForumPostDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorUserId = null,Object? authorName = null,Object? authorRole = null,Object? title = null,Object? details = null,Object? likeCount = null,Object? replyCount = null,Object? isLiked = null,Object? createdAt = null,Object? updatedAt = null,Object? replies = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authorUserId: null == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<ForumReplyModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumPostDetailModel].
extension ForumPostDetailModelPatterns on ForumPostDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumPostDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumPostDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumPostDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumPostDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumPostDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumPostDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole,  String title,  String details, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<ForumReplyModel> replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumPostDetailModel() when $default != null:
return $default(_that.id,_that.authorUserId,_that.authorName,_that.authorRole,_that.title,_that.details,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.updatedAt,_that.replies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole,  String title,  String details, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<ForumReplyModel> replies)  $default,) {final _that = this;
switch (_that) {
case _ForumPostDetailModel():
return $default(_that.id,_that.authorUserId,_that.authorName,_that.authorRole,_that.title,_that.details,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.updatedAt,_that.replies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole,  String title,  String details, @JsonKey(name: 'like_count')  int likeCount, @JsonKey(name: 'reply_count')  int replyCount, @JsonKey(name: 'is_liked')  bool isLiked, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<ForumReplyModel> replies)?  $default,) {final _that = this;
switch (_that) {
case _ForumPostDetailModel() when $default != null:
return $default(_that.id,_that.authorUserId,_that.authorName,_that.authorRole,_that.title,_that.details,_that.likeCount,_that.replyCount,_that.isLiked,_that.createdAt,_that.updatedAt,_that.replies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumPostDetailModel implements ForumPostDetailModel {
  const _ForumPostDetailModel({required this.id, @JsonKey(name: 'author_user_id') required this.authorUserId, @JsonKey(name: 'author_name') required this.authorName, @JsonKey(name: 'author_role') required this.authorRole, required this.title, required this.details, @JsonKey(name: 'like_count') required this.likeCount, @JsonKey(name: 'reply_count') required this.replyCount, @JsonKey(name: 'is_liked') required this.isLiked, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required final  List<ForumReplyModel> replies}): _replies = replies;
  factory _ForumPostDetailModel.fromJson(Map<String, dynamic> json) => _$ForumPostDetailModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'author_user_id') final  int authorUserId;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey(name: 'author_role') final  String authorRole;
@override final  String title;
@override final  String details;
@override@JsonKey(name: 'like_count') final  int likeCount;
@override@JsonKey(name: 'reply_count') final  int replyCount;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
 final  List<ForumReplyModel> _replies;
@override List<ForumReplyModel> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}


/// Create a copy of ForumPostDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumPostDetailModelCopyWith<_ForumPostDetailModel> get copyWith => __$ForumPostDetailModelCopyWithImpl<_ForumPostDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumPostDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumPostDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.title, title) || other.title == title)&&(identical(other.details, details) || other.details == details)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._replies, _replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,authorUserId,authorName,authorRole,title,details,likeCount,replyCount,isLiked,createdAt,updatedAt,const DeepCollectionEquality().hash(_replies));

@override
String toString() {
  return 'ForumPostDetailModel(id: $id, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, title: $title, details: $details, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$ForumPostDetailModelCopyWith<$Res> implements $ForumPostDetailModelCopyWith<$Res> {
  factory _$ForumPostDetailModelCopyWith(_ForumPostDetailModel value, $Res Function(_ForumPostDetailModel) _then) = __$ForumPostDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'author_user_id') int authorUserId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_role') String authorRole, String title, String details,@JsonKey(name: 'like_count') int likeCount,@JsonKey(name: 'reply_count') int replyCount,@JsonKey(name: 'is_liked') bool isLiked,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, List<ForumReplyModel> replies
});




}
/// @nodoc
class __$ForumPostDetailModelCopyWithImpl<$Res>
    implements _$ForumPostDetailModelCopyWith<$Res> {
  __$ForumPostDetailModelCopyWithImpl(this._self, this._then);

  final _ForumPostDetailModel _self;
  final $Res Function(_ForumPostDetailModel) _then;

/// Create a copy of ForumPostDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorUserId = null,Object? authorName = null,Object? authorRole = null,Object? title = null,Object? details = null,Object? likeCount = null,Object? replyCount = null,Object? isLiked = null,Object? createdAt = null,Object? updatedAt = null,Object? replies = null,}) {
  return _then(_ForumPostDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authorUserId: null == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,replyCount: null == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<ForumReplyModel>,
  ));
}


}

// dart format on
