// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatbotHistoryModel _$ChatbotHistoryModelFromJson(Map<String, dynamic> json) {
  return _ChatbotHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$ChatbotHistoryModel {
  ChatbotConversationModel get conversation =>
      throw _privateConstructorUsedError;
  List<ChatbotMessageModel> get messages => throw _privateConstructorUsedError;

  /// Serializes this ChatbotHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatbotHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatbotHistoryModelCopyWith<ChatbotHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatbotHistoryModelCopyWith<$Res> {
  factory $ChatbotHistoryModelCopyWith(
    ChatbotHistoryModel value,
    $Res Function(ChatbotHistoryModel) then,
  ) = _$ChatbotHistoryModelCopyWithImpl<$Res, ChatbotHistoryModel>;
  @useResult
  $Res call({
    ChatbotConversationModel conversation,
    List<ChatbotMessageModel> messages,
  });

  $ChatbotConversationModelCopyWith<$Res> get conversation;
}

/// @nodoc
class _$ChatbotHistoryModelCopyWithImpl<$Res, $Val extends ChatbotHistoryModel>
    implements $ChatbotHistoryModelCopyWith<$Res> {
  _$ChatbotHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatbotHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? conversation = null, Object? messages = null}) {
    return _then(
      _value.copyWith(
            conversation: null == conversation
                ? _value.conversation
                : conversation // ignore: cast_nullable_to_non_nullable
                      as ChatbotConversationModel,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<ChatbotMessageModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatbotHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatbotConversationModelCopyWith<$Res> get conversation {
    return $ChatbotConversationModelCopyWith<$Res>(_value.conversation, (
      value,
    ) {
      return _then(_value.copyWith(conversation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatbotHistoryModelImplCopyWith<$Res>
    implements $ChatbotHistoryModelCopyWith<$Res> {
  factory _$$ChatbotHistoryModelImplCopyWith(
    _$ChatbotHistoryModelImpl value,
    $Res Function(_$ChatbotHistoryModelImpl) then,
  ) = __$$ChatbotHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ChatbotConversationModel conversation,
    List<ChatbotMessageModel> messages,
  });

  @override
  $ChatbotConversationModelCopyWith<$Res> get conversation;
}

/// @nodoc
class __$$ChatbotHistoryModelImplCopyWithImpl<$Res>
    extends _$ChatbotHistoryModelCopyWithImpl<$Res, _$ChatbotHistoryModelImpl>
    implements _$$ChatbotHistoryModelImplCopyWith<$Res> {
  __$$ChatbotHistoryModelImplCopyWithImpl(
    _$ChatbotHistoryModelImpl _value,
    $Res Function(_$ChatbotHistoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatbotHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? conversation = null, Object? messages = null}) {
    return _then(
      _$ChatbotHistoryModelImpl(
        conversation: null == conversation
            ? _value.conversation
            : conversation // ignore: cast_nullable_to_non_nullable
                  as ChatbotConversationModel,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ChatbotMessageModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatbotHistoryModelImpl implements _ChatbotHistoryModel {
  const _$ChatbotHistoryModelImpl({
    required this.conversation,
    required final List<ChatbotMessageModel> messages,
  }) : _messages = messages;

  factory _$ChatbotHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatbotHistoryModelImplFromJson(json);

  @override
  final ChatbotConversationModel conversation;
  final List<ChatbotMessageModel> _messages;
  @override
  List<ChatbotMessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatbotHistoryModel(conversation: $conversation, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatbotHistoryModelImpl &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    conversation,
    const DeepCollectionEquality().hash(_messages),
  );

  /// Create a copy of ChatbotHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatbotHistoryModelImplCopyWith<_$ChatbotHistoryModelImpl> get copyWith =>
      __$$ChatbotHistoryModelImplCopyWithImpl<_$ChatbotHistoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatbotHistoryModelImplToJson(this);
  }
}

abstract class _ChatbotHistoryModel implements ChatbotHistoryModel {
  const factory _ChatbotHistoryModel({
    required final ChatbotConversationModel conversation,
    required final List<ChatbotMessageModel> messages,
  }) = _$ChatbotHistoryModelImpl;

  factory _ChatbotHistoryModel.fromJson(Map<String, dynamic> json) =
      _$ChatbotHistoryModelImpl.fromJson;

  @override
  ChatbotConversationModel get conversation;
  @override
  List<ChatbotMessageModel> get messages;

  /// Create a copy of ChatbotHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatbotHistoryModelImplCopyWith<_$ChatbotHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
