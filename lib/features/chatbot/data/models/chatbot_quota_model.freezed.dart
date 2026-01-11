// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_quota_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatbotQuotaModel _$ChatbotQuotaModelFromJson(Map<String, dynamic> json) {
  return _ChatbotQuotaModel.fromJson(json);
}

/// @nodoc
mixin _$ChatbotQuotaModel {
  @JsonKey(name: 'used_today')
  int get usedToday => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get remaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'resets_at')
  DateTime get resetsAt => throw _privateConstructorUsedError;

  /// Serializes this ChatbotQuotaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatbotQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatbotQuotaModelCopyWith<ChatbotQuotaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotQuotaModelCopyWith<$Res> {
  factory $ChatbotQuotaModelCopyWith(
    ChatbotQuotaModel value,
    $Res Function(ChatbotQuotaModel) then,
  ) = _$ChatbotQuotaModelCopyWithImpl<$Res, ChatbotQuotaModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'used_today') int usedToday,
    int limit,
    int remaining,
    @JsonKey(name: 'resets_at') DateTime resetsAt,
  });
}

/// @nodoc
class _$ChatbotQuotaModelCopyWithImpl<$Res, $Val extends ChatbotQuotaModel>
    implements $ChatbotQuotaModelCopyWith<$Res> {
  _$ChatbotQuotaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatbotQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usedToday = null,
    Object? limit = null,
    Object? remaining = null,
    Object? resetsAt = null,
  }) {
    return _then(
      _value.copyWith(
            usedToday: null == usedToday
                ? _value.usedToday
                : usedToday // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            remaining: null == remaining
                ? _value.remaining
                : remaining // ignore: cast_nullable_to_non_nullable
                      as int,
            resetsAt: null == resetsAt
                ? _value.resetsAt
                : resetsAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatbotQuotaModelImplCopyWith<$Res>
    implements $ChatbotQuotaModelCopyWith<$Res> {
  factory _$$ChatbotQuotaModelImplCopyWith(
    _$ChatbotQuotaModelImpl value,
    $Res Function(_$ChatbotQuotaModelImpl) then,
  ) = __$$ChatbotQuotaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'used_today') int usedToday,
    int limit,
    int remaining,
    @JsonKey(name: 'resets_at') DateTime resetsAt,
  });
}

/// @nodoc
class __$$ChatbotQuotaModelImplCopyWithImpl<$Res>
    extends _$ChatbotQuotaModelCopyWithImpl<$Res, _$ChatbotQuotaModelImpl>
    implements _$$ChatbotQuotaModelImplCopyWith<$Res> {
  __$$ChatbotQuotaModelImplCopyWithImpl(
    _$ChatbotQuotaModelImpl _value,
    $Res Function(_$ChatbotQuotaModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatbotQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usedToday = null,
    Object? limit = null,
    Object? remaining = null,
    Object? resetsAt = null,
  }) {
    return _then(
      _$ChatbotQuotaModelImpl(
        usedToday: null == usedToday
            ? _value.usedToday
            : usedToday // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        remaining: null == remaining
            ? _value.remaining
            : remaining // ignore: cast_nullable_to_non_nullable
                  as int,
        resetsAt: null == resetsAt
            ? _value.resetsAt
            : resetsAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotQuotaModelImpl implements _ChatbotQuotaModel {
  const _$ChatbotQuotaModelImpl({
    @JsonKey(name: 'used_today') required this.usedToday,
    required this.limit,
    required this.remaining,
    @JsonKey(name: 'resets_at') required this.resetsAt,
  });

  factory _$ChatbotQuotaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotQuotaModelImplFromJson(json);

  @override
  @JsonKey(name: 'used_today')
  final int usedToday;
  @override
  final int limit;
  @override
  final int remaining;
  @override
  @JsonKey(name: 'resets_at')
  final DateTime resetsAt;

  @override
  String toString() {
    return 'ChatbotQuotaModel(usedToday: $usedToday, limit: $limit, remaining: $remaining, resetsAt: $resetsAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotQuotaModelImpl &&
            (identical(other.usedToday, usedToday) ||
                other.usedToday == usedToday) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.resetsAt, resetsAt) ||
                other.resetsAt == resetsAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, usedToday, limit, remaining, resetsAt);

  /// Create a copy of ChatbotQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotQuotaModelImplCopyWith<_$ChatbotQuotaModelImpl> get copyWith =>
      __$$ChatbotQuotaModelImplCopyWithImpl<_$ChatbotQuotaModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotQuotaModelImplToJson(this);
  }
}

abstract class _ChatbotQuotaModel implements ChatbotQuotaModel {
  const factory _ChatbotQuotaModel({
    @JsonKey(name: 'used_today') required final int usedToday,
    required final int limit,
    required final int remaining,
    @JsonKey(name: 'resets_at') required final DateTime resetsAt,
  }) = _$ChatbotQuotaModelImpl;

  factory _ChatbotQuotaModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotQuotaModelImpl.fromJson;

  @override
  @JsonKey(name: 'used_today')
  int get usedToday;
  @override
  int get limit;
  @override
  int get remaining;
  @override
  @JsonKey(name: 'resets_at')
  DateTime get resetsAt;

  /// Create a copy of ChatbotQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatbotQuotaModelImplCopyWith<_$ChatbotQuotaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
