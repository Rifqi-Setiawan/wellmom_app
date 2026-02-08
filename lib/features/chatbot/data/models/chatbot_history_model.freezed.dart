// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatbotHistoryModel {

 ChatbotConversationModel get conversation; List<ChatbotMessageModel> get messages;
/// Create a copy of ChatbotHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotHistoryModelCopyWith<ChatbotHistoryModel> get copyWith => _$ChatbotHistoryModelCopyWithImpl<ChatbotHistoryModel>(this as ChatbotHistoryModel, _$identity);

  /// Serializes this ChatbotHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotHistoryModel&&(identical(other.conversation, conversation) || other.conversation == conversation)&&const DeepCollectionEquality().equals(other.messages, messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversation,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'ChatbotHistoryModel(conversation: $conversation, messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ChatbotHistoryModelCopyWith<$Res>  {
  factory $ChatbotHistoryModelCopyWith(ChatbotHistoryModel value, $Res Function(ChatbotHistoryModel) _then) = _$ChatbotHistoryModelCopyWithImpl;
@useResult
$Res call({
 ChatbotConversationModel conversation, List<ChatbotMessageModel> messages
});


$ChatbotConversationModelCopyWith<$Res> get conversation;

}
/// @nodoc
class _$ChatbotHistoryModelCopyWithImpl<$Res>
    implements $ChatbotHistoryModelCopyWith<$Res> {
  _$ChatbotHistoryModelCopyWithImpl(this._self, this._then);

  final ChatbotHistoryModel _self;
  final $Res Function(ChatbotHistoryModel) _then;

/// Create a copy of ChatbotHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversation = null,Object? messages = null,}) {
  return _then(_self.copyWith(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ChatbotConversationModel,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatbotMessageModel>,
  ));
}
/// Create a copy of ChatbotHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatbotConversationModelCopyWith<$Res> get conversation {
  
  return $ChatbotConversationModelCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatbotHistoryModel].
extension ChatbotHistoryModelPatterns on ChatbotHistoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatbotHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatbotHistoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatbotHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatbotHistoryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatbotHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatbotHistoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatbotConversationModel conversation,  List<ChatbotMessageModel> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatbotHistoryModel() when $default != null:
return $default(_that.conversation,_that.messages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatbotConversationModel conversation,  List<ChatbotMessageModel> messages)  $default,) {final _that = this;
switch (_that) {
case _ChatbotHistoryModel():
return $default(_that.conversation,_that.messages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatbotConversationModel conversation,  List<ChatbotMessageModel> messages)?  $default,) {final _that = this;
switch (_that) {
case _ChatbotHistoryModel() when $default != null:
return $default(_that.conversation,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatbotHistoryModel implements ChatbotHistoryModel {
  const _ChatbotHistoryModel({required this.conversation, required final  List<ChatbotMessageModel> messages}): _messages = messages;
  factory _ChatbotHistoryModel.fromJson(Map<String, dynamic> json) => _$ChatbotHistoryModelFromJson(json);

@override final  ChatbotConversationModel conversation;
 final  List<ChatbotMessageModel> _messages;
@override List<ChatbotMessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ChatbotHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatbotHistoryModelCopyWith<_ChatbotHistoryModel> get copyWith => __$ChatbotHistoryModelCopyWithImpl<_ChatbotHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatbotHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatbotHistoryModel&&(identical(other.conversation, conversation) || other.conversation == conversation)&&const DeepCollectionEquality().equals(other._messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversation,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'ChatbotHistoryModel(conversation: $conversation, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$ChatbotHistoryModelCopyWith<$Res> implements $ChatbotHistoryModelCopyWith<$Res> {
  factory _$ChatbotHistoryModelCopyWith(_ChatbotHistoryModel value, $Res Function(_ChatbotHistoryModel) _then) = __$ChatbotHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 ChatbotConversationModel conversation, List<ChatbotMessageModel> messages
});


@override $ChatbotConversationModelCopyWith<$Res> get conversation;

}
/// @nodoc
class __$ChatbotHistoryModelCopyWithImpl<$Res>
    implements _$ChatbotHistoryModelCopyWith<$Res> {
  __$ChatbotHistoryModelCopyWithImpl(this._self, this._then);

  final _ChatbotHistoryModel _self;
  final $Res Function(_ChatbotHistoryModel) _then;

/// Create a copy of ChatbotHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversation = null,Object? messages = null,}) {
  return _then(_ChatbotHistoryModel(
conversation: null == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as ChatbotConversationModel,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatbotMessageModel>,
  ));
}

/// Create a copy of ChatbotHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatbotConversationModelCopyWith<$Res> get conversation {
  
  return $ChatbotConversationModelCopyWith<$Res>(_self.conversation, (value) {
    return _then(_self.copyWith(conversation: value));
  });
}
}

// dart format on
