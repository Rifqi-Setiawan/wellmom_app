// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumReplyModel _$ForumReplyModelFromJson(Map<String, dynamic> json) {
  return _ForumReplyModel.fromJson(json);
}

/// @nodoc
mixin _$ForumReplyModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_user_id')
  int get authorUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  String get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_role')
  String get authorRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'reply_text')
  String get replyText => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_reply_id')
  int? get parentReplyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ForumReplyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumReplyModelCopyWith<ForumReplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumReplyModelCopyWith<$Res> {
  factory $ForumReplyModelCopyWith(
    ForumReplyModel value,
    $Res Function(ForumReplyModel) then,
  ) = _$ForumReplyModelCopyWithImpl<$Res, ForumReplyModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'post_id') int postId,
    @JsonKey(name: 'author_user_id') int authorUserId,
    @JsonKey(name: 'author_name') String authorName,
    @JsonKey(name: 'author_role') String authorRole,
    @JsonKey(name: 'reply_text') String replyText,
    @JsonKey(name: 'parent_reply_id') int? parentReplyId,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$ForumReplyModelCopyWithImpl<$Res, $Val extends ForumReplyModel>
    implements $ForumReplyModelCopyWith<$Res> {
  _$ForumReplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorUserId = null,
    Object? authorName = null,
    Object? authorRole = null,
    Object? replyText = null,
    Object? parentReplyId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as int,
            authorUserId: null == authorUserId
                ? _value.authorUserId
                : authorUserId // ignore: cast_nullable_to_non_nullable
                      as int,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            authorRole: null == authorRole
                ? _value.authorRole
                : authorRole // ignore: cast_nullable_to_non_nullable
                      as String,
            replyText: null == replyText
                ? _value.replyText
                : replyText // ignore: cast_nullable_to_non_nullable
                      as String,
            parentReplyId: freezed == parentReplyId
                ? _value.parentReplyId
                : parentReplyId // ignore: cast_nullable_to_non_nullable
                      as int?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForumReplyModelImplCopyWith<$Res>
    implements $ForumReplyModelCopyWith<$Res> {
  factory _$$ForumReplyModelImplCopyWith(
    _$ForumReplyModelImpl value,
    $Res Function(_$ForumReplyModelImpl) then,
  ) = __$$ForumReplyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'post_id') int postId,
    @JsonKey(name: 'author_user_id') int authorUserId,
    @JsonKey(name: 'author_name') String authorName,
    @JsonKey(name: 'author_role') String authorRole,
    @JsonKey(name: 'reply_text') String replyText,
    @JsonKey(name: 'parent_reply_id') int? parentReplyId,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$ForumReplyModelImplCopyWithImpl<$Res>
    extends _$ForumReplyModelCopyWithImpl<$Res, _$ForumReplyModelImpl>
    implements _$$ForumReplyModelImplCopyWith<$Res> {
  __$$ForumReplyModelImplCopyWithImpl(
    _$ForumReplyModelImpl _value,
    $Res Function(_$ForumReplyModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorUserId = null,
    Object? authorName = null,
    Object? authorRole = null,
    Object? replyText = null,
    Object? parentReplyId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ForumReplyModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as int,
        authorUserId: null == authorUserId
            ? _value.authorUserId
            : authorUserId // ignore: cast_nullable_to_non_nullable
                  as int,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        authorRole: null == authorRole
            ? _value.authorRole
            : authorRole // ignore: cast_nullable_to_non_nullable
                  as String,
        replyText: null == replyText
            ? _value.replyText
            : replyText // ignore: cast_nullable_to_non_nullable
                  as String,
        parentReplyId: freezed == parentReplyId
            ? _value.parentReplyId
            : parentReplyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumReplyModelImpl implements _ForumReplyModel {
  const _$ForumReplyModelImpl({
    required this.id,
    @JsonKey(name: 'post_id') required this.postId,
    @JsonKey(name: 'author_user_id') required this.authorUserId,
    @JsonKey(name: 'author_name') required this.authorName,
    @JsonKey(name: 'author_role') required this.authorRole,
    @JsonKey(name: 'reply_text') required this.replyText,
    @JsonKey(name: 'parent_reply_id') this.parentReplyId,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$ForumReplyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumReplyModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  @JsonKey(name: 'author_user_id')
  final int authorUserId;
  @override
  @JsonKey(name: 'author_name')
  final String authorName;
  @override
  @JsonKey(name: 'author_role')
  final String authorRole;
  @override
  @JsonKey(name: 'reply_text')
  final String replyText;
  @override
  @JsonKey(name: 'parent_reply_id')
  final int? parentReplyId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ForumReplyModel(id: $id, postId: $postId, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, replyText: $replyText, parentReplyId: $parentReplyId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumReplyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authorUserId, authorUserId) ||
                other.authorUserId == authorUserId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorRole, authorRole) ||
                other.authorRole == authorRole) &&
            (identical(other.replyText, replyText) ||
                other.replyText == replyText) &&
            (identical(other.parentReplyId, parentReplyId) ||
                other.parentReplyId == parentReplyId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    postId,
    authorUserId,
    authorName,
    authorRole,
    replyText,
    parentReplyId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ForumReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumReplyModelImplCopyWith<_$ForumReplyModelImpl> get copyWith =>
      __$$ForumReplyModelImplCopyWithImpl<_$ForumReplyModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumReplyModelImplToJson(this);
  }
}

abstract class _ForumReplyModel implements ForumReplyModel {
  const factory _ForumReplyModel({
    required final int id,
    @JsonKey(name: 'post_id') required final int postId,
    @JsonKey(name: 'author_user_id') required final int authorUserId,
    @JsonKey(name: 'author_name') required final String authorName,
    @JsonKey(name: 'author_role') required final String authorRole,
    @JsonKey(name: 'reply_text') required final String replyText,
    @JsonKey(name: 'parent_reply_id') final int? parentReplyId,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$ForumReplyModelImpl;

  factory _ForumReplyModel.fromJson(Map<String, dynamic> json) =
      _$ForumReplyModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  @JsonKey(name: 'author_user_id')
  int get authorUserId;
  @override
  @JsonKey(name: 'author_name')
  String get authorName;
  @override
  @JsonKey(name: 'author_role')
  String get authorRole;
  @override
  @JsonKey(name: 'reply_text')
  String get replyText;
  @override
  @JsonKey(name: 'parent_reply_id')
  int? get parentReplyId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ForumReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumReplyModelImplCopyWith<_$ForumReplyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
