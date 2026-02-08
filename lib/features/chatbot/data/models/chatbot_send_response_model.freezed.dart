// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_send_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatbotSendResponseModel {

 String get response;@JsonKey(name: 'conversation_id') int get conversationId; ChatbotQuotaModel get quota;
/// Create a copy of ChatbotSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotSendResponseModelCopyWith<ChatbotSendResponseModel> get copyWith => _$ChatbotSendResponseModelCopyWithImpl<ChatbotSendResponseModel>(this as ChatbotSendResponseModel, _$identity);

  /// Serializes this ChatbotSendResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotSendResponseModel&&(identical(other.response, response) || other.response == response)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.quota, quota) || other.quota == quota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,conversationId,quota);

@override
String toString() {
  return 'ChatbotSendResponseModel(response: $response, conversationId: $conversationId, quota: $quota)';
}


}

/// @nodoc
abstract mixin class $ChatbotSendResponseModelCopyWith<$Res>  {
  factory $ChatbotSendResponseModelCopyWith(ChatbotSendResponseModel value, $Res Function(ChatbotSendResponseModel) _then) = _$ChatbotSendResponseModelCopyWithImpl;
@useResult
$Res call({
 String response,@JsonKey(name: 'conversation_id') int conversationId, ChatbotQuotaModel quota
});


$ChatbotQuotaModelCopyWith<$Res> get quota;

}
/// @nodoc
class _$ChatbotSendResponseModelCopyWithImpl<$Res>
    implements $ChatbotSendResponseModelCopyWith<$Res> {
  _$ChatbotSendResponseModelCopyWithImpl(this._self, this._then);

  final ChatbotSendResponseModel _self;
  final $Res Function(ChatbotSendResponseModel) _then;

/// Create a copy of ChatbotSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? response = null,Object? conversationId = null,Object? quota = null,}) {
  return _then(_self.copyWith(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as ChatbotQuotaModel,
  ));
}
/// Create a copy of ChatbotSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatbotQuotaModelCopyWith<$Res> get quota {
  
  return $ChatbotQuotaModelCopyWith<$Res>(_self.quota, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatbotSendResponseModel].
extension ChatbotSendResponseModelPatterns on ChatbotSendResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatbotSendResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatbotSendResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatbotSendResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatbotSendResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatbotSendResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatbotSendResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String response, @JsonKey(name: 'conversation_id')  int conversationId,  ChatbotQuotaModel quota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatbotSendResponseModel() when $default != null:
return $default(_that.response,_that.conversationId,_that.quota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String response, @JsonKey(name: 'conversation_id')  int conversationId,  ChatbotQuotaModel quota)  $default,) {final _that = this;
switch (_that) {
case _ChatbotSendResponseModel():
return $default(_that.response,_that.conversationId,_that.quota);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String response, @JsonKey(name: 'conversation_id')  int conversationId,  ChatbotQuotaModel quota)?  $default,) {final _that = this;
switch (_that) {
case _ChatbotSendResponseModel() when $default != null:
return $default(_that.response,_that.conversationId,_that.quota);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatbotSendResponseModel implements ChatbotSendResponseModel {
  const _ChatbotSendResponseModel({required this.response, @JsonKey(name: 'conversation_id') required this.conversationId, required this.quota});
  factory _ChatbotSendResponseModel.fromJson(Map<String, dynamic> json) => _$ChatbotSendResponseModelFromJson(json);

@override final  String response;
@override@JsonKey(name: 'conversation_id') final  int conversationId;
@override final  ChatbotQuotaModel quota;

/// Create a copy of ChatbotSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatbotSendResponseModelCopyWith<_ChatbotSendResponseModel> get copyWith => __$ChatbotSendResponseModelCopyWithImpl<_ChatbotSendResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatbotSendResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatbotSendResponseModel&&(identical(other.response, response) || other.response == response)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.quota, quota) || other.quota == quota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response,conversationId,quota);

@override
String toString() {
  return 'ChatbotSendResponseModel(response: $response, conversationId: $conversationId, quota: $quota)';
}


}

/// @nodoc
abstract mixin class _$ChatbotSendResponseModelCopyWith<$Res> implements $ChatbotSendResponseModelCopyWith<$Res> {
  factory _$ChatbotSendResponseModelCopyWith(_ChatbotSendResponseModel value, $Res Function(_ChatbotSendResponseModel) _then) = __$ChatbotSendResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String response,@JsonKey(name: 'conversation_id') int conversationId, ChatbotQuotaModel quota
});


@override $ChatbotQuotaModelCopyWith<$Res> get quota;

}
/// @nodoc
class __$ChatbotSendResponseModelCopyWithImpl<$Res>
    implements _$ChatbotSendResponseModelCopyWith<$Res> {
  __$ChatbotSendResponseModelCopyWithImpl(this._self, this._then);

  final _ChatbotSendResponseModel _self;
  final $Res Function(_ChatbotSendResponseModel) _then;

/// Create a copy of ChatbotSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = null,Object? conversationId = null,Object? quota = null,}) {
  return _then(_ChatbotSendResponseModel(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as ChatbotQuotaModel,
  ));
}

/// Create a copy of ChatbotSendResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatbotQuotaModelCopyWith<$Res> get quota {
  
  return $ChatbotQuotaModelCopyWith<$Res>(_self.quota, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}

// dart format on
