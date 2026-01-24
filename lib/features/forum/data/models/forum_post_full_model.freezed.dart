// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_post_full_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumPostFullModel _$ForumPostFullModelFromJson(Map<String, dynamic> json) {
  return _ForumPostFullModel.fromJson(json);
}

/// @nodoc
mixin _$ForumPostFullModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_user_id')
  int get authorUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  String get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_role')
  String get authorRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_photo_url')
  String? get authorPhotoUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_display_name')
  String get categoryDisplayName => throw _privateConstructorUsedError;
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

  /// Serializes this ForumPostFullModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumPostFullModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumPostFullModelCopyWith<ForumPostFullModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumPostFullModelCopyWith<$Res> {
  factory $ForumPostFullModelCopyWith(
    ForumPostFullModel value,
    $Res Function(ForumPostFullModel) then,
  ) = _$ForumPostFullModelCopyWithImpl<$Res, ForumPostFullModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'author_user_id') int authorUserId,
    @JsonKey(name: 'author_name') String authorName,
    @JsonKey(name: 'author_role') String authorRole,
    @JsonKey(name: 'author_photo_url') String? authorPhotoUrl,
    String title,
    String details,
    @JsonKey(name: 'category_id') int categoryId,
    @JsonKey(name: 'category_name') String categoryName,
    @JsonKey(name: 'category_display_name') String categoryDisplayName,
    @JsonKey(name: 'like_count') int likeCount,
    @JsonKey(name: 'reply_count') int replyCount,
    @JsonKey(name: 'is_liked') bool isLiked,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$ForumPostFullModelCopyWithImpl<$Res, $Val extends ForumPostFullModel>
    implements $ForumPostFullModelCopyWith<$Res> {
  _$ForumPostFullModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumPostFullModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorUserId = null,
    Object? authorName = null,
    Object? authorRole = null,
    Object? authorPhotoUrl = freezed,
    Object? title = null,
    Object? details = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryDisplayName = null,
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
            authorPhotoUrl: freezed == authorPhotoUrl
                ? _value.authorPhotoUrl
                : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            details: null == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int,
            categoryName: null == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryDisplayName: null == categoryDisplayName
                ? _value.categoryDisplayName
                : categoryDisplayName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ForumPostFullModelImplCopyWith<$Res>
    implements $ForumPostFullModelCopyWith<$Res> {
  factory _$$ForumPostFullModelImplCopyWith(
    _$ForumPostFullModelImpl value,
    $Res Function(_$ForumPostFullModelImpl) then,
  ) = __$$ForumPostFullModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'author_user_id') int authorUserId,
    @JsonKey(name: 'author_name') String authorName,
    @JsonKey(name: 'author_role') String authorRole,
    @JsonKey(name: 'author_photo_url') String? authorPhotoUrl,
    String title,
    String details,
    @JsonKey(name: 'category_id') int categoryId,
    @JsonKey(name: 'category_name') String categoryName,
    @JsonKey(name: 'category_display_name') String categoryDisplayName,
    @JsonKey(name: 'like_count') int likeCount,
    @JsonKey(name: 'reply_count') int replyCount,
    @JsonKey(name: 'is_liked') bool isLiked,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$ForumPostFullModelImplCopyWithImpl<$Res>
    extends _$ForumPostFullModelCopyWithImpl<$Res, _$ForumPostFullModelImpl>
    implements _$$ForumPostFullModelImplCopyWith<$Res> {
  __$$ForumPostFullModelImplCopyWithImpl(
    _$ForumPostFullModelImpl _value,
    $Res Function(_$ForumPostFullModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumPostFullModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorUserId = null,
    Object? authorName = null,
    Object? authorRole = null,
    Object? authorPhotoUrl = freezed,
    Object? title = null,
    Object? details = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? categoryDisplayName = null,
    Object? likeCount = null,
    Object? replyCount = null,
    Object? isLiked = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ForumPostFullModelImpl(
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
        authorPhotoUrl: freezed == authorPhotoUrl
            ? _value.authorPhotoUrl
            : authorPhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        details: null == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
        categoryName: null == categoryName
            ? _value.categoryName
            : categoryName // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryDisplayName: null == categoryDisplayName
            ? _value.categoryDisplayName
            : categoryDisplayName // ignore: cast_nullable_to_non_nullable
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
class _$ForumPostFullModelImpl implements _ForumPostFullModel {
  const _$ForumPostFullModelImpl({
    required this.id,
    @JsonKey(name: 'author_user_id') required this.authorUserId,
    @JsonKey(name: 'author_name') required this.authorName,
    @JsonKey(name: 'author_role') required this.authorRole,
    @JsonKey(name: 'author_photo_url') this.authorPhotoUrl,
    required this.title,
    required this.details,
    @JsonKey(name: 'category_id') required this.categoryId,
    @JsonKey(name: 'category_name') required this.categoryName,
    @JsonKey(name: 'category_display_name') required this.categoryDisplayName,
    @JsonKey(name: 'like_count') required this.likeCount,
    @JsonKey(name: 'reply_count') required this.replyCount,
    @JsonKey(name: 'is_liked') required this.isLiked,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$ForumPostFullModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumPostFullModelImplFromJson(json);

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
  @JsonKey(name: 'author_photo_url')
  final String? authorPhotoUrl;
  @override
  final String title;
  @override
  final String details;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'category_display_name')
  final String categoryDisplayName;
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
    return 'ForumPostFullModel(id: $id, authorUserId: $authorUserId, authorName: $authorName, authorRole: $authorRole, authorPhotoUrl: $authorPhotoUrl, title: $title, details: $details, categoryId: $categoryId, categoryName: $categoryName, categoryDisplayName: $categoryDisplayName, likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumPostFullModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorUserId, authorUserId) ||
                other.authorUserId == authorUserId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorRole, authorRole) ||
                other.authorRole == authorRole) &&
            (identical(other.authorPhotoUrl, authorPhotoUrl) ||
                other.authorPhotoUrl == authorPhotoUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryDisplayName, categoryDisplayName) ||
                other.categoryDisplayName == categoryDisplayName) &&
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
    authorPhotoUrl,
    title,
    details,
    categoryId,
    categoryName,
    categoryDisplayName,
    likeCount,
    replyCount,
    isLiked,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ForumPostFullModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumPostFullModelImplCopyWith<_$ForumPostFullModelImpl> get copyWith =>
      __$$ForumPostFullModelImplCopyWithImpl<_$ForumPostFullModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumPostFullModelImplToJson(this);
  }
}

abstract class _ForumPostFullModel implements ForumPostFullModel {
  const factory _ForumPostFullModel({
    required final int id,
    @JsonKey(name: 'author_user_id') required final int authorUserId,
    @JsonKey(name: 'author_name') required final String authorName,
    @JsonKey(name: 'author_role') required final String authorRole,
    @JsonKey(name: 'author_photo_url') final String? authorPhotoUrl,
    required final String title,
    required final String details,
    @JsonKey(name: 'category_id') required final int categoryId,
    @JsonKey(name: 'category_name') required final String categoryName,
    @JsonKey(name: 'category_display_name')
    required final String categoryDisplayName,
    @JsonKey(name: 'like_count') required final int likeCount,
    @JsonKey(name: 'reply_count') required final int replyCount,
    @JsonKey(name: 'is_liked') required final bool isLiked,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$ForumPostFullModelImpl;

  factory _ForumPostFullModel.fromJson(Map<String, dynamic> json) =
      _$ForumPostFullModelImpl.fromJson;

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
  @JsonKey(name: 'author_photo_url')
  String? get authorPhotoUrl;
  @override
  String get title;
  @override
  String get details;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'category_display_name')
  String get categoryDisplayName;
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

  /// Create a copy of ForumPostFullModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumPostFullModelImplCopyWith<_$ForumPostFullModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForumPostsResponseModel _$ForumPostsResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForumPostsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ForumPostsResponseModel {
  List<ForumPostFullModel> get posts => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_more')
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this ForumPostsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumPostsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumPostsResponseModelCopyWith<ForumPostsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumPostsResponseModelCopyWith<$Res> {
  factory $ForumPostsResponseModelCopyWith(
    ForumPostsResponseModel value,
    $Res Function(ForumPostsResponseModel) then,
  ) = _$ForumPostsResponseModelCopyWithImpl<$Res, ForumPostsResponseModel>;
  @useResult
  $Res call({
    List<ForumPostFullModel> posts,
    int total,
    @JsonKey(name: 'has_more') bool hasMore,
  });
}

/// @nodoc
class _$ForumPostsResponseModelCopyWithImpl<
  $Res,
  $Val extends ForumPostsResponseModel
>
    implements $ForumPostsResponseModelCopyWith<$Res> {
  _$ForumPostsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumPostsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? total = null,
    Object? hasMore = null,
  }) {
    return _then(
      _value.copyWith(
            posts: null == posts
                ? _value.posts
                : posts // ignore: cast_nullable_to_non_nullable
                      as List<ForumPostFullModel>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForumPostsResponseModelImplCopyWith<$Res>
    implements $ForumPostsResponseModelCopyWith<$Res> {
  factory _$$ForumPostsResponseModelImplCopyWith(
    _$ForumPostsResponseModelImpl value,
    $Res Function(_$ForumPostsResponseModelImpl) then,
  ) = __$$ForumPostsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ForumPostFullModel> posts,
    int total,
    @JsonKey(name: 'has_more') bool hasMore,
  });
}

/// @nodoc
class __$$ForumPostsResponseModelImplCopyWithImpl<$Res>
    extends
        _$ForumPostsResponseModelCopyWithImpl<
          $Res,
          _$ForumPostsResponseModelImpl
        >
    implements _$$ForumPostsResponseModelImplCopyWith<$Res> {
  __$$ForumPostsResponseModelImplCopyWithImpl(
    _$ForumPostsResponseModelImpl _value,
    $Res Function(_$ForumPostsResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumPostsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? total = null,
    Object? hasMore = null,
  }) {
    return _then(
      _$ForumPostsResponseModelImpl(
        posts: null == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<ForumPostFullModel>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumPostsResponseModelImpl implements _ForumPostsResponseModel {
  const _$ForumPostsResponseModelImpl({
    required final List<ForumPostFullModel> posts,
    required this.total,
    @JsonKey(name: 'has_more') required this.hasMore,
  }) : _posts = posts;

  factory _$ForumPostsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumPostsResponseModelImplFromJson(json);

  final List<ForumPostFullModel> _posts;
  @override
  List<ForumPostFullModel> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final int total;
  @override
  @JsonKey(name: 'has_more')
  final bool hasMore;

  @override
  String toString() {
    return 'ForumPostsResponseModel(posts: $posts, total: $total, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumPostsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_posts),
    total,
    hasMore,
  );

  /// Create a copy of ForumPostsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumPostsResponseModelImplCopyWith<_$ForumPostsResponseModelImpl>
  get copyWith =>
      __$$ForumPostsResponseModelImplCopyWithImpl<
        _$ForumPostsResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumPostsResponseModelImplToJson(this);
  }
}

abstract class _ForumPostsResponseModel implements ForumPostsResponseModel {
  const factory _ForumPostsResponseModel({
    required final List<ForumPostFullModel> posts,
    required final int total,
    @JsonKey(name: 'has_more') required final bool hasMore,
  }) = _$ForumPostsResponseModelImpl;

  factory _ForumPostsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ForumPostsResponseModelImpl.fromJson;

  @override
  List<ForumPostFullModel> get posts;
  @override
  int get total;
  @override
  @JsonKey(name: 'has_more')
  bool get hasMore;

  /// Create a copy of ForumPostsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumPostsResponseModelImplCopyWith<_$ForumPostsResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
