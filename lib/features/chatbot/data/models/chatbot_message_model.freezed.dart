// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatbotMessageModel _$ChatbotMessageModelFromJson(Map<String, dynamic> json) {
  return _ChatbotMessageModel.fromJson(json);
}

/// @nodoc
mixin _$ChatbotMessageModel {
  int get id => throw _privateConstructorUsedError;
  String get role =>
      throw _privateConstructorUsedError; // "user" or "assistant"
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChatbotMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatbotMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatbotMessageModelCopyWith<ChatbotMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotMessageModelCopyWith<$Res> {
  factory $ChatbotMessageModelCopyWith(
    ChatbotMessageModel value,
    $Res Function(ChatbotMessageModel) then,
  ) = _$ChatbotMessageModelCopyWithImpl<$Res, ChatbotMessageModel>;
  @useResult
  $Res call({
    int id,
    String role,
    String content,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$ChatbotMessageModelCopyWithImpl<$Res, $Val extends ChatbotMessageModel>
    implements $ChatbotMessageModelCopyWith<$Res> {
  _$ChatbotMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatbotMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatbotMessageModelImplCopyWith<$Res>
    implements $ChatbotMessageModelCopyWith<$Res> {
  factory _$$ChatbotMessageModelImplCopyWith(
    _$ChatbotMessageModelImpl value,
    $Res Function(_$ChatbotMessageModelImpl) then,
  ) = __$$ChatbotMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String role,
    String content,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$ChatbotMessageModelImplCopyWithImpl<$Res>
    extends _$ChatbotMessageModelCopyWithImpl<$Res, _$ChatbotMessageModelImpl>
    implements _$$ChatbotMessageModelImplCopyWith<$Res> {
  __$$ChatbotMessageModelImplCopyWithImpl(
    _$ChatbotMessageModelImpl _value,
    $Res Function(_$ChatbotMessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatbotMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ChatbotMessageModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotMessageModelImpl implements _ChatbotMessageModel {
  const _$ChatbotMessageModelImpl({
    required this.id,
    required this.role,
    required this.content,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$ChatbotMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotMessageModelImplFromJson(json);

  @override
  final int id;
  @override
  final String role;
  // "user" or "assistant"
  @override
  final String content;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChatbotMessageModel(id: $id, role: $role, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotMessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, role, content, createdAt);

  /// Create a copy of ChatbotMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotMessageModelImplCopyWith<_$ChatbotMessageModelImpl> get copyWith =>
      __$$ChatbotMessageModelImplCopyWithImpl<_$ChatbotMessageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotMessageModelImplToJson(this);
  }
}

abstract class _ChatbotMessageModel implements ChatbotMessageModel {
  const factory _ChatbotMessageModel({
    required final int id,
    required final String role,
    required final String content,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$ChatbotMessageModelImpl;

  factory _ChatbotMessageModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotMessageModelImpl.fromJson;

  @override
  int get id;
  @override
  String get role; // "user" or "assistant"
  @override
  String get content;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of ChatbotMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatbotMessageModelImplCopyWith<_$ChatbotMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
