// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatbotStatusModel _$ChatbotStatusModelFromJson(Map<String, dynamic> json) {
  return _ChatbotStatusModel.fromJson(json);
}

/// @nodoc
mixin _$ChatbotStatusModel {
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_name')
  String? get modelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_key_configured')
  bool get apiKeyConfigured => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ChatbotStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatbotStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatbotStatusModelCopyWith<ChatbotStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotStatusModelCopyWith<$Res> {
  factory $ChatbotStatusModelCopyWith(
    ChatbotStatusModel value,
    $Res Function(ChatbotStatusModel) then,
  ) = _$ChatbotStatusModelCopyWithImpl<$Res, ChatbotStatusModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'model_name') String? modelName,
    @JsonKey(name: 'api_key_configured') bool apiKeyConfigured,
    String? error,
  });
}

/// @nodoc
class _$ChatbotStatusModelCopyWithImpl<$Res, $Val extends ChatbotStatusModel>
    implements $ChatbotStatusModelCopyWith<$Res> {
  _$ChatbotStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatbotStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? modelName = freezed,
    Object? apiKeyConfigured = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            modelName: freezed == modelName
                ? _value.modelName
                : modelName // ignore: cast_nullable_to_non_nullable
                      as String?,
            apiKeyConfigured: null == apiKeyConfigured
                ? _value.apiKeyConfigured
                : apiKeyConfigured // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatbotStatusModelImplCopyWith<$Res>
    implements $ChatbotStatusModelCopyWith<$Res> {
  factory _$$ChatbotStatusModelImplCopyWith(
    _$ChatbotStatusModelImpl value,
    $Res Function(_$ChatbotStatusModelImpl) then,
  ) = __$$ChatbotStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'model_name') String? modelName,
    @JsonKey(name: 'api_key_configured') bool apiKeyConfigured,
    String? error,
  });
}

/// @nodoc
class __$$ChatbotStatusModelImplCopyWithImpl<$Res>
    extends _$ChatbotStatusModelCopyWithImpl<$Res, _$ChatbotStatusModelImpl>
    implements _$$ChatbotStatusModelImplCopyWith<$Res> {
  __$$ChatbotStatusModelImplCopyWithImpl(
    _$ChatbotStatusModelImpl _value,
    $Res Function(_$ChatbotStatusModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatbotStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
    Object? modelName = freezed,
    Object? apiKeyConfigured = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ChatbotStatusModelImpl(
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        modelName: freezed == modelName
            ? _value.modelName
            : modelName // ignore: cast_nullable_to_non_nullable
                  as String?,
        apiKeyConfigured: null == apiKeyConfigured
            ? _value.apiKeyConfigured
            : apiKeyConfigured // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotStatusModelImpl implements _ChatbotStatusModel {
  const _$ChatbotStatusModelImpl({
    @JsonKey(name: 'is_available') required this.isAvailable,
    @JsonKey(name: 'model_name') this.modelName,
    @JsonKey(name: 'api_key_configured') required this.apiKeyConfigured,
    this.error,
  });

  factory _$ChatbotStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotStatusModelImplFromJson(json);

  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'model_name')
  final String? modelName;
  @override
  @JsonKey(name: 'api_key_configured')
  final bool apiKeyConfigured;
  @override
  final String? error;

  @override
  String toString() {
    return 'ChatbotStatusModel(isAvailable: $isAvailable, modelName: $modelName, apiKeyConfigured: $apiKeyConfigured, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotStatusModelImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.modelName, modelName) ||
                other.modelName == modelName) &&
            (identical(other.apiKeyConfigured, apiKeyConfigured) ||
                other.apiKeyConfigured == apiKeyConfigured) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isAvailable, modelName, apiKeyConfigured, error);

  /// Create a copy of ChatbotStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotStatusModelImplCopyWith<_$ChatbotStatusModelImpl> get copyWith =>
      __$$ChatbotStatusModelImplCopyWithImpl<_$ChatbotStatusModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotStatusModelImplToJson(this);
  }
}

abstract class _ChatbotStatusModel implements ChatbotStatusModel {
  const factory _ChatbotStatusModel({
    @JsonKey(name: 'is_available') required final bool isAvailable,
    @JsonKey(name: 'model_name') final String? modelName,
    @JsonKey(name: 'api_key_configured') required final bool apiKeyConfigured,
    final String? error,
  }) = _$ChatbotStatusModelImpl;

  factory _ChatbotStatusModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotStatusModelImpl.fromJson;

  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'model_name')
  String? get modelName;
  @override
  @JsonKey(name: 'api_key_configured')
  bool get apiKeyConfigured;
  @override
  String? get error;

  /// Create a copy of ChatbotStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatbotStatusModelImplCopyWith<_$ChatbotStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
