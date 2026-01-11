// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatbotConversationModel _$ChatbotConversationModelFromJson(
  Map<String, dynamic> json,
) {
  return _ChatbotConversationModel.fromJson(json);
}

/// @nodoc
mixin _$ChatbotConversationModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_count')
  int get messageCount => throw _privateConstructorUsedError;

  /// Serializes this ChatbotConversationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatbotConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatbotConversationModelCopyWith<ChatbotConversationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotConversationModelCopyWith<$Res> {
  factory $ChatbotConversationModelCopyWith(
    ChatbotConversationModel value,
    $Res Function(ChatbotConversationModel) then,
  ) = _$ChatbotConversationModelCopyWithImpl<$Res, ChatbotConversationModel>;
  @useResult
  $Res call({
    int id,
    String title,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'message_count') int messageCount,
  });
}

/// @nodoc
class _$ChatbotConversationModelCopyWithImpl<
  $Res,
  $Val extends ChatbotConversationModel
>
    implements $ChatbotConversationModelCopyWith<$Res> {
  _$ChatbotConversationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatbotConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? messageCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            messageCount: null == messageCount
                ? _value.messageCount
                : messageCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatbotConversationModelImplCopyWith<$Res>
    implements $ChatbotConversationModelCopyWith<$Res> {
  factory _$$ChatbotConversationModelImplCopyWith(
    _$ChatbotConversationModelImpl value,
    $Res Function(_$ChatbotConversationModelImpl) then,
  ) = __$$ChatbotConversationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'message_count') int messageCount,
  });
}

/// @nodoc
class __$$ChatbotConversationModelImplCopyWithImpl<$Res>
    extends
        _$ChatbotConversationModelCopyWithImpl<
          $Res,
          _$ChatbotConversationModelImpl
        >
    implements _$$ChatbotConversationModelImplCopyWith<$Res> {
  __$$ChatbotConversationModelImplCopyWithImpl(
    _$ChatbotConversationModelImpl _value,
    $Res Function(_$ChatbotConversationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatbotConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? messageCount = null,
  }) {
    return _then(
      _$ChatbotConversationModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        messageCount: null == messageCount
            ? _value.messageCount
            : messageCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotConversationModelImpl implements _ChatbotConversationModel {
  const _$ChatbotConversationModelImpl({
    required this.id,
    required this.title,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'message_count') required this.messageCount,
  });

  factory _$ChatbotConversationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotConversationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'message_count')
  final int messageCount;

  @override
  String toString() {
    return 'ChatbotConversationModel(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, messageCount: $messageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotConversationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, createdAt, updatedAt, messageCount);

  /// Create a copy of ChatbotConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotConversationModelImplCopyWith<_$ChatbotConversationModelImpl>
  get copyWith =>
      __$$ChatbotConversationModelImplCopyWithImpl<
        _$ChatbotConversationModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotConversationModelImplToJson(this);
  }
}

abstract class _ChatbotConversationModel implements ChatbotConversationModel {
  const factory _ChatbotConversationModel({
    required final int id,
    required final String title,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'message_count') required final int messageCount,
  }) = _$ChatbotConversationModelImpl;

  factory _ChatbotConversationModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotConversationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'message_count')
  int get messageCount;

  /// Create a copy of ChatbotConversationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatbotConversationModelImplCopyWith<_$ChatbotConversationModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
