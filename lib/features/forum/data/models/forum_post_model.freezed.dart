// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumPostModel _$ForumPostModelFromJson(Map<String, dynamic> json) {
  return _ForumPostModel.fromJson(json);
}

/// @nodoc
mixin _$ForumPostModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_user_id')
  int get authorUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  String get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_role')
  String get authorRole => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'reply_count')
  int get replyCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ForumPostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumPostModelCopyWith<ForumPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumPostModelCopyWith<$Res> {
  factory $ForumPostModelCopyWith(
    ForumPostModel value,
    $Res Function(ForumPostModel) then,
  ) = _$ForumPostModelCopyWithImpl<$Res, ForumPostModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'author_user_id') int authorUserId,
    @JsonKey(name: 'author_name') String authorName,
    @JsonKey(name: 'author_role') String authorRole,
    String title,
    String details,
    @JsonKey(name: 'like_count') int likeCount,
    @JsonKey(name: 'reply_count') int replyCount,
    @JsonKey(name: 'is_liked') bool isLiked,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$ForumPostModelCopyWithImpl<$Res, $Val extends ForumPostModel>
    implements $ForumPostModelCopyWith<$Res> {
  _$ForumPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorUserId = null,
    Object? authorName = null,
    Object? authorRole = null,
    Object? title = null,
    Object? details = null,
    Object? likeCount = null,
    Object? replyCount = null,
    Object? isLiked = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
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
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            details: null == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as String,
            likeCount: null == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            replyCount: null == replyCount
                ? _value.replyCount
                : replyCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isLiked: null == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$ForumPostModelImplCopyWith<$Res>
    implements $ForumPostModelCopyWith<$Res> {
  factory _$$ForumPostModelImplCopyWith(
    _$ForumPostModelImpl value,
    $Res Function(_$ForumPostModelImpl) then,
  ) = __$$ForumPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'author_user_id') int authorUserId,
    @JsonKey(name: 'author_name') String authorName,
    @JsonKey(name: 'author_role') String authorRole,
    String title,
    String details,
    @JsonKey(name: 'like_count') int likeCount,
    @JsonKey(name: 'reply_count') int replyCount,
    @JsonKey(name: 'is_liked') bool isLiked,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$ForumPostModelImplCopyWithImpl<$Res>
    extends _$ForumPostModelCopyWithImpl<$Res, _$ForumPostModelImpl>
    implements _$$ForumPostModelImplCopyWith<$Res> {
  __$$ForumPostModelImplCopyWithImpl(
    _$ForumPostModelImpl _value,
    $Res Function(_$ForumPostModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorUserId = null,
    Object? authorName = null,
    Object? authorRole = null,
    Object? title = null,
    Object? details = null,
    Object? likeCount = null,
    Object? replyCount = null,
    Object? isLiked = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ForumPostModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
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
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        details: null == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String,
        likeCount: null == likeCount
            ? _value.likeCount
            : likeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        replyCount: null == replyCount
            ? _value.replyCount
            : replyCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isLiked: null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$ForumPostModelImpl implements _ForumPostModel {
  const _$ForumPostModelImpl({
    required this.id,
    @JsonKey(name: 'author_user_id') required this.authorUserId,
    @JsonKey(name: 'author_name') required this.authorName,
    @JsonKey(name: 'author_role') required this.authorRole,
    required this.title,
    required this.details,
    @JsonKey(name: 'like_count') required this.likeCount,
    @JsonKey(name: 'reply_count') required this.replyCount,
    @JsonKey(name: 'is_liked') required this.isLiked,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$ForumPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumPostModelImplFromJson(json);

  @override
  final int id;
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
  final String title;
  @override
  final String details;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  @JsonKey(name: 'reply_count')
  final int replyCount;
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ForumPostModel(id: $id, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, title: $title, details: $details, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumPostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorUserId, authorUserId) ||
                other.authorUserId == authorUserId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorRole, authorRole) ||
                other.authorRole == authorRole) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
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
    authorUserId,
    authorName,
    authorRole,
    title,
    details,
    likeCount,
    replyCount,
    isLiked,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ForumPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumPostModelImplCopyWith<_$ForumPostModelImpl> get copyWith =>
      __$$ForumPostModelImplCopyWithImpl<_$ForumPostModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumPostModelImplToJson(this);
  }
}

abstract class _ForumPostModel implements ForumPostModel {
  const factory _ForumPostModel({
    required final int id,
    @JsonKey(name: 'author_user_id') required final int authorUserId,
    @JsonKey(name: 'author_name') required final String authorName,
    @JsonKey(name: 'author_role') required final String authorRole,
    required final String title,
    required final String details,
    @JsonKey(name: 'like_count') required final int likeCount,
    @JsonKey(name: 'reply_count') required final int replyCount,
    @JsonKey(name: 'is_liked') required final bool isLiked,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$ForumPostModelImpl;

  factory _ForumPostModel.fromJson(Map<String, dynamic> json) =
      _$ForumPostModelImpl.fromJson;

  @override
  int get id;
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
  String get title;
  @override
  String get details;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;
  @override
  @JsonKey(name: 'reply_count')
  int get replyCount;
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ForumPostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumPostModelImplCopyWith<_$ForumPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
