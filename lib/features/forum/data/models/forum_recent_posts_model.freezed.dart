// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_recent_posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumRecentPostsModel _$ForumRecentPostsModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForumRecentPostsModel.fromJson(json);
}

/// @nodoc
mixin _$ForumRecentPostsModel {
  List<ForumPostModel> get posts => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_more')
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this ForumRecentPostsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumRecentPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumRecentPostsModelCopyWith<ForumRecentPostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumRecentPostsModelCopyWith<$Res> {
  factory $ForumRecentPostsModelCopyWith(
    ForumRecentPostsModel value,
    $Res Function(ForumRecentPostsModel) then,
  ) = _$ForumRecentPostsModelCopyWithImpl<$Res, ForumRecentPostsModel>;
  @useResult
  $Res call({
    List<ForumPostModel> posts,
    int total,
    @JsonKey(name: 'has_more') bool hasMore,
  });
}

/// @nodoc
class _$ForumRecentPostsModelCopyWithImpl<
  $Res,
  $Val extends ForumRecentPostsModel
>
    implements $ForumRecentPostsModelCopyWith<$Res> {
  _$ForumRecentPostsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumRecentPostsModel
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
                      as List<ForumPostModel>,
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
abstract class _$$ForumRecentPostsModelImplCopyWith<$Res>
    implements $ForumRecentPostsModelCopyWith<$Res> {
  factory _$$ForumRecentPostsModelImplCopyWith(
    _$ForumRecentPostsModelImpl value,
    $Res Function(_$ForumRecentPostsModelImpl) then,
  ) = __$$ForumRecentPostsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ForumPostModel> posts,
    int total,
    @JsonKey(name: 'has_more') bool hasMore,
  });
}

/// @nodoc
class __$$ForumRecentPostsModelImplCopyWithImpl<$Res>
    extends
        _$ForumRecentPostsModelCopyWithImpl<$Res, _$ForumRecentPostsModelImpl>
    implements _$$ForumRecentPostsModelImplCopyWith<$Res> {
  __$$ForumRecentPostsModelImplCopyWithImpl(
    _$ForumRecentPostsModelImpl _value,
    $Res Function(_$ForumRecentPostsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumRecentPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? total = null,
    Object? hasMore = null,
  }) {
    return _then(
      _$ForumRecentPostsModelImpl(
        posts: null == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<ForumPostModel>,
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
class _$ForumRecentPostsModelImpl implements _ForumRecentPostsModel {
  const _$ForumRecentPostsModelImpl({
    required final List<ForumPostModel> posts,
    required this.total,
    @JsonKey(name: 'has_more') required this.hasMore,
  }) : _posts = posts;

  factory _$ForumRecentPostsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumRecentPostsModelImplFromJson(json);

  final List<ForumPostModel> _posts;
  @override
  List<ForumPostModel> get posts {
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
    return 'ForumRecentPostsModel(posts: $posts, total: $total, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumRecentPostsModelImpl &&
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

  /// Create a copy of ForumRecentPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumRecentPostsModelImplCopyWith<_$ForumRecentPostsModelImpl>
  get copyWith =>
      __$$ForumRecentPostsModelImplCopyWithImpl<_$ForumRecentPostsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumRecentPostsModelImplToJson(this);
  }
}

abstract class _ForumRecentPostsModel implements ForumRecentPostsModel {
  const factory _ForumRecentPostsModel({
    required final List<ForumPostModel> posts,
    required final int total,
    @JsonKey(name: 'has_more') required final bool hasMore,
  }) = _$ForumRecentPostsModelImpl;

  factory _ForumRecentPostsModel.fromJson(Map<String, dynamic> json) =
      _$ForumRecentPostsModelImpl.fromJson;

  @override
  List<ForumPostModel> get posts;
  @override
  int get total;
  @override
  @JsonKey(name: 'has_more')
  bool get hasMore;

  /// Create a copy of ForumRecentPostsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumRecentPostsModelImplCopyWith<_$ForumRecentPostsModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
