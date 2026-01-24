// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_replies_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumRepliesResponseModel _$ForumRepliesResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForumRepliesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ForumRepliesResponseModel {
  List<ForumReplyModel> get replies => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this ForumRepliesResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumRepliesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumRepliesResponseModelCopyWith<ForumRepliesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumRepliesResponseModelCopyWith<$Res> {
  factory $ForumRepliesResponseModelCopyWith(
    ForumRepliesResponseModel value,
    $Res Function(ForumRepliesResponseModel) then,
  ) = _$ForumRepliesResponseModelCopyWithImpl<$Res, ForumRepliesResponseModel>;
  @useResult
  $Res call({List<ForumReplyModel> replies, int total});
}

/// @nodoc
class _$ForumRepliesResponseModelCopyWithImpl<
  $Res,
  $Val extends ForumRepliesResponseModel
>
    implements $ForumRepliesResponseModelCopyWith<$Res> {
  _$ForumRepliesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumRepliesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? replies = null, Object? total = null}) {
    return _then(
      _value.copyWith(
            replies: null == replies
                ? _value.replies
                : replies // ignore: cast_nullable_to_non_nullable
                      as List<ForumReplyModel>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForumRepliesResponseModelImplCopyWith<$Res>
    implements $ForumRepliesResponseModelCopyWith<$Res> {
  factory _$$ForumRepliesResponseModelImplCopyWith(
    _$ForumRepliesResponseModelImpl value,
    $Res Function(_$ForumRepliesResponseModelImpl) then,
  ) = __$$ForumRepliesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ForumReplyModel> replies, int total});
}

/// @nodoc
class __$$ForumRepliesResponseModelImplCopyWithImpl<$Res>
    extends
        _$ForumRepliesResponseModelCopyWithImpl<
          $Res,
          _$ForumRepliesResponseModelImpl
        >
    implements _$$ForumRepliesResponseModelImplCopyWith<$Res> {
  __$$ForumRepliesResponseModelImplCopyWithImpl(
    _$ForumRepliesResponseModelImpl _value,
    $Res Function(_$ForumRepliesResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumRepliesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? replies = null, Object? total = null}) {
    return _then(
      _$ForumRepliesResponseModelImpl(
        replies: null == replies
            ? _value._replies
            : replies // ignore: cast_nullable_to_non_nullable
                  as List<ForumReplyModel>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumRepliesResponseModelImpl implements _ForumRepliesResponseModel {
  const _$ForumRepliesResponseModelImpl({
    required final List<ForumReplyModel> replies,
    required this.total,
  }) : _replies = replies;

  factory _$ForumRepliesResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumRepliesResponseModelImplFromJson(json);

  final List<ForumReplyModel> _replies;
  @override
  List<ForumReplyModel> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  final int total;

  @override
  String toString() {
    return 'ForumRepliesResponseModel(replies: $replies, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumRepliesResponseModelImpl &&
            const DeepCollectionEquality().equals(other._replies, _replies) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_replies),
    total,
  );

  /// Create a copy of ForumRepliesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumRepliesResponseModelImplCopyWith<_$ForumRepliesResponseModelImpl>
  get copyWith =>
      __$$ForumRepliesResponseModelImplCopyWithImpl<
        _$ForumRepliesResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumRepliesResponseModelImplToJson(this);
  }
}

abstract class _ForumRepliesResponseModel implements ForumRepliesResponseModel {
  const factory _ForumRepliesResponseModel({
    required final List<ForumReplyModel> replies,
    required final int total,
  }) = _$ForumRepliesResponseModelImpl;

  factory _ForumRepliesResponseModel.fromJson(Map<String, dynamic> json) =
      _$ForumRepliesResponseModelImpl.fromJson;

  @override
  List<ForumReplyModel> get replies;
  @override
  int get total;

  /// Create a copy of ForumRepliesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumRepliesResponseModelImplCopyWith<_$ForumRepliesResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
