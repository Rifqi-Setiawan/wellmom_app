// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_like_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumLikeResponseModel _$ForumLikeResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForumLikeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ForumLikeResponseModel {
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ForumLikeResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumLikeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumLikeResponseModelCopyWith<ForumLikeResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumLikeResponseModelCopyWith<$Res> {
  factory $ForumLikeResponseModelCopyWith(
    ForumLikeResponseModel value,
    $Res Function(ForumLikeResponseModel) then,
  ) = _$ForumLikeResponseModelCopyWithImpl<$Res, ForumLikeResponseModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'post_id') int postId,
    @JsonKey(name: 'is_liked') bool isLiked,
    @JsonKey(name: 'like_count') int likeCount,
    String message,
  });
}

/// @nodoc
class _$ForumLikeResponseModelCopyWithImpl<
  $Res,
  $Val extends ForumLikeResponseModel
>
    implements $ForumLikeResponseModelCopyWith<$Res> {
  _$ForumLikeResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumLikeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? isLiked = null,
    Object? likeCount = null,
    Object? message = null,
  }) {
    return _then(
      _value.copyWith(
            postId: null == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as int,
            isLiked: null == isLiked
                ? _value.isLiked
                : isLiked // ignore: cast_nullable_to_non_nullable
                      as bool,
            likeCount: null == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForumLikeResponseModelImplCopyWith<$Res>
    implements $ForumLikeResponseModelCopyWith<$Res> {
  factory _$$ForumLikeResponseModelImplCopyWith(
    _$ForumLikeResponseModelImpl value,
    $Res Function(_$ForumLikeResponseModelImpl) then,
  ) = __$$ForumLikeResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'post_id') int postId,
    @JsonKey(name: 'is_liked') bool isLiked,
    @JsonKey(name: 'like_count') int likeCount,
    String message,
  });
}

/// @nodoc
class __$$ForumLikeResponseModelImplCopyWithImpl<$Res>
    extends
        _$ForumLikeResponseModelCopyWithImpl<$Res, _$ForumLikeResponseModelImpl>
    implements _$$ForumLikeResponseModelImplCopyWith<$Res> {
  __$$ForumLikeResponseModelImplCopyWithImpl(
    _$ForumLikeResponseModelImpl _value,
    $Res Function(_$ForumLikeResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumLikeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? isLiked = null,
    Object? likeCount = null,
    Object? message = null,
  }) {
    return _then(
      _$ForumLikeResponseModelImpl(
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as int,
        isLiked: null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
        likeCount: null == likeCount
            ? _value.likeCount
            : likeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumLikeResponseModelImpl implements _ForumLikeResponseModel {
  const _$ForumLikeResponseModelImpl({
    @JsonKey(name: 'post_id') required this.postId,
    @JsonKey(name: 'is_liked') required this.isLiked,
    @JsonKey(name: 'like_count') required this.likeCount,
    required this.message,
  });

  factory _$ForumLikeResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumLikeResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  final String message;

  @override
  String toString() {
    return 'ForumLikeResponseModel(postId: $postId, isLiked: $isLiked, likeCount: $likeCount, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumLikeResponseModelImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, postId, isLiked, likeCount, message);

  /// Create a copy of ForumLikeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumLikeResponseModelImplCopyWith<_$ForumLikeResponseModelImpl>
  get copyWith =>
      __$$ForumLikeResponseModelImplCopyWithImpl<_$ForumLikeResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumLikeResponseModelImplToJson(this);
  }
}

abstract class _ForumLikeResponseModel implements ForumLikeResponseModel {
  const factory _ForumLikeResponseModel({
    @JsonKey(name: 'post_id') required final int postId,
    @JsonKey(name: 'is_liked') required final bool isLiked,
    @JsonKey(name: 'like_count') required final int likeCount,
    required final String message,
  }) = _$ForumLikeResponseModelImpl;

  factory _ForumLikeResponseModel.fromJson(Map<String, dynamic> json) =
      _$ForumLikeResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;
  @override
  String get message;

  /// Create a copy of ForumLikeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumLikeResponseModelImplCopyWith<_$ForumLikeResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
