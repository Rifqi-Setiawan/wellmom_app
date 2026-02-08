// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumReplyModel {

 int get id;@JsonKey(name: 'post_id') int get postId;@JsonKey(name: 'author_user_id') int get authorUserId;@JsonKey(name: 'author_name') String get authorName;@JsonKey(name: 'author_role') String get authorRole;@JsonKey(name: 'reply_text') String get replyText;@JsonKey(name: 'parent_reply_id') int? get parentReplyId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumReplyModelCopyWith<ForumReplyModel> get copyWith => _$ForumReplyModelCopyWithImpl<ForumReplyModel>(this as ForumReplyModel, _$identity);

  /// Serializes this ForumReplyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.replyText, replyText) || other.replyText == replyText)&&(identical(other.parentReplyId, parentReplyId) || other.parentReplyId == parentReplyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,postId,authorUserId,authorName,authorRole,replyText,parentReplyId,createdAt,updatedAt);

@override
String toString() {
  return 'ForumReplyModel(id: $id, postId: $postId, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, replyText: $replyText, parentReplyId: $parentReplyId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ForumReplyModelCopyWith<$Res>  {
  factory $ForumReplyModelCopyWith(ForumReplyModel value, $Res Function(ForumReplyModel) _then) = _$ForumReplyModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'post_id') int postId,@JsonKey(name: 'author_user_id') int authorUserId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_role') String authorRole,@JsonKey(name: 'reply_text') String replyText,@JsonKey(name: 'parent_reply_id') int? parentReplyId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ForumReplyModelCopyWithImpl<$Res>
    implements $ForumReplyModelCopyWith<$Res> {
  _$ForumReplyModelCopyWithImpl(this._self, this._then);

  final ForumReplyModel _self;
  final $Res Function(ForumReplyModel) _then;

/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? postId = null,Object? authorUserId = null,Object? authorName = null,Object? authorRole = null,Object? replyText = null,Object? parentReplyId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,authorUserId: null == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,replyText: null == replyText ? _self.replyText : replyText // ignore: cast_nullable_to_non_nullable
as String,parentReplyId: freezed == parentReplyId ? _self.parentReplyId : parentReplyId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumReplyModel].
extension ForumReplyModelPatterns on ForumReplyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumReplyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumReplyModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumReplyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumReplyModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'post_id')  int postId, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole, @JsonKey(name: 'reply_text')  String replyText, @JsonKey(name: 'parent_reply_id')  int? parentReplyId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
return $default(_that.id,_that.postId,_that.authorUserId,_that.authorName,_that.authorRole,_that.replyText,_that.parentReplyId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'post_id')  int postId, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole, @JsonKey(name: 'reply_text')  String replyText, @JsonKey(name: 'parent_reply_id')  int? parentReplyId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ForumReplyModel():
return $default(_that.id,_that.postId,_that.authorUserId,_that.authorName,_that.authorRole,_that.replyText,_that.parentReplyId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'post_id')  int postId, @JsonKey(name: 'author_user_id')  int authorUserId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'author_role')  String authorRole, @JsonKey(name: 'reply_text')  String replyText, @JsonKey(name: 'parent_reply_id')  int? parentReplyId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
return $default(_that.id,_that.postId,_that.authorUserId,_that.authorName,_that.authorRole,_that.replyText,_that.parentReplyId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumReplyModel implements ForumReplyModel {
  const _ForumReplyModel({required this.id, @JsonKey(name: 'post_id') required this.postId, @JsonKey(name: 'author_user_id') required this.authorUserId, @JsonKey(name: 'author_name') required this.authorName, @JsonKey(name: 'author_role') required this.authorRole, @JsonKey(name: 'reply_text') required this.replyText, @JsonKey(name: 'parent_reply_id') this.parentReplyId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ForumReplyModel.fromJson(Map<String, dynamic> json) => _$ForumReplyModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'post_id') final  int postId;
@override@JsonKey(name: 'author_user_id') final  int authorUserId;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey(name: 'author_role') final  String authorRole;
@override@JsonKey(name: 'reply_text') final  String replyText;
@override@JsonKey(name: 'parent_reply_id') final  int? parentReplyId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumReplyModelCopyWith<_ForumReplyModel> get copyWith => __$ForumReplyModelCopyWithImpl<_ForumReplyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumReplyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorRole, authorRole) || other.authorRole == authorRole)&&(identical(other.replyText, replyText) || other.replyText == replyText)&&(identical(other.parentReplyId, parentReplyId) || other.parentReplyId == parentReplyId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,postId,authorUserId,authorName,authorRole,replyText,parentReplyId,createdAt,updatedAt);

@override
String toString() {
  return 'ForumReplyModel(id: $id, postId: $postId, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, replyText: $replyText, parentReplyId: $parentReplyId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ForumReplyModelCopyWith<$Res> implements $ForumReplyModelCopyWith<$Res> {
  factory _$ForumReplyModelCopyWith(_ForumReplyModel value, $Res Function(_ForumReplyModel) _then) = __$ForumReplyModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'post_id') int postId,@JsonKey(name: 'author_user_id') int authorUserId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'author_role') String authorRole,@JsonKey(name: 'reply_text') String replyText,@JsonKey(name: 'parent_reply_id') int? parentReplyId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ForumReplyModelCopyWithImpl<$Res>
    implements _$ForumReplyModelCopyWith<$Res> {
  __$ForumReplyModelCopyWithImpl(this._self, this._then);

  final _ForumReplyModel _self;
  final $Res Function(_ForumReplyModel) _then;

/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? postId = null,Object? authorUserId = null,Object? authorName = null,Object? authorRole = null,Object? replyText = null,Object? parentReplyId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ForumReplyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,authorUserId: null == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorRole: null == authorRole ? _self.authorRole : authorRole // ignore: cast_nullable_to_non_nullable
as String,replyText: null == replyText ? _self.replyText : replyText // ignore: cast_nullable_to_non_nullable
as String,parentReplyId: freezed == parentReplyId ? _self.parentReplyId : parentReplyId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
