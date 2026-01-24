// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_create_post_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumCreatePostRequestModel _$ForumCreatePostRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForumCreatePostRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ForumCreatePostRequestModel {
  String get title => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;

  /// Serializes this ForumCreatePostRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumCreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumCreatePostRequestModelCopyWith<ForumCreatePostRequestModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumCreatePostRequestModelCopyWith<$Res> {
  factory $ForumCreatePostRequestModelCopyWith(
    ForumCreatePostRequestModel value,
    $Res Function(ForumCreatePostRequestModel) then,
  ) =
      _$ForumCreatePostRequestModelCopyWithImpl<
        $Res,
        ForumCreatePostRequestModel
      >;
  @useResult
  $Res call({
    String title,
    String details,
    @JsonKey(name: 'category_id') int categoryId,
  });
}

/// @nodoc
class _$ForumCreatePostRequestModelCopyWithImpl<
  $Res,
  $Val extends ForumCreatePostRequestModel
>
    implements $ForumCreatePostRequestModelCopyWith<$Res> {
  _$ForumCreatePostRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumCreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? details = null,
    Object? categoryId = null,
  }) {
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForumCreatePostRequestModelImplCopyWith<$Res>
    implements $ForumCreatePostRequestModelCopyWith<$Res> {
  factory _$$ForumCreatePostRequestModelImplCopyWith(
    _$ForumCreatePostRequestModelImpl value,
    $Res Function(_$ForumCreatePostRequestModelImpl) then,
  ) = __$$ForumCreatePostRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String details,
    @JsonKey(name: 'category_id') int categoryId,
  });
}

/// @nodoc
class __$$ForumCreatePostRequestModelImplCopyWithImpl<$Res>
    extends
        _$ForumCreatePostRequestModelCopyWithImpl<
          $Res,
          _$ForumCreatePostRequestModelImpl
        >
    implements _$$ForumCreatePostRequestModelImplCopyWith<$Res> {
  __$$ForumCreatePostRequestModelImplCopyWithImpl(
    _$ForumCreatePostRequestModelImpl _value,
    $Res Function(_$ForumCreatePostRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumCreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? details = null,
    Object? categoryId = null,
  }) {
    return _then(
      _$ForumCreatePostRequestModelImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumCreatePostRequestModelImpl
    implements _ForumCreatePostRequestModel {
  const _$ForumCreatePostRequestModelImpl({
    required this.title,
    required this.details,
    @JsonKey(name: 'category_id') required this.categoryId,
  });

  factory _$ForumCreatePostRequestModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ForumCreatePostRequestModelImplFromJson(json);

  @override
  final String title;
  @override
  final String details;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;

  @override
  String toString() {
    return 'ForumCreatePostRequestModel(title: $title, details: $details, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumCreatePostRequestModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, details, categoryId);

  /// Create a copy of ForumCreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumCreatePostRequestModelImplCopyWith<_$ForumCreatePostRequestModelImpl>
  get copyWith =>
      __$$ForumCreatePostRequestModelImplCopyWithImpl<
        _$ForumCreatePostRequestModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumCreatePostRequestModelImplToJson(this);
  }
}

abstract class _ForumCreatePostRequestModel
    implements ForumCreatePostRequestModel {
  const factory _ForumCreatePostRequestModel({
    required final String title,
    required final String details,
    @JsonKey(name: 'category_id') required final int categoryId,
  }) = _$ForumCreatePostRequestModelImpl;

  factory _ForumCreatePostRequestModel.fromJson(Map<String, dynamic> json) =
      _$ForumCreatePostRequestModelImpl.fromJson;

  @override
  String get title;
  @override
  String get details;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;

  /// Create a copy of ForumCreatePostRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumCreatePostRequestModelImplCopyWith<_$ForumCreatePostRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
