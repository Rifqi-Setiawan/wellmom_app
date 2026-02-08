// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatbotConversationModel {

 int get id; String get title;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'message_count') int get messageCount;
/// Create a copy of ChatbotConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotConversationModelCopyWith<ChatbotConversationModel> get copyWith => _$ChatbotConversationModelCopyWithImpl<ChatbotConversationModel>(this as ChatbotConversationModel, _$identity);

  /// Serializes this ChatbotConversationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.messageCount, messageCount) || other.messageCount == messageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,messageCount);

@override
String toString() {
  return 'ChatbotConversationModel(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, messageCount: $messageCount)';
}


}

/// @nodoc
abstract mixin class $ChatbotConversationModelCopyWith<$Res>  {
  factory $ChatbotConversationModelCopyWith(ChatbotConversationModel value, $Res Function(ChatbotConversationModel) _then) = _$ChatbotConversationModelCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'message_count') int messageCount
});




}
/// @nodoc
class _$ChatbotConversationModelCopyWithImpl<$Res>
    implements $ChatbotConversationModelCopyWith<$Res> {
  _$ChatbotConversationModelCopyWithImpl(this._self, this._then);

  final ChatbotConversationModel _self;
  final $Res Function(ChatbotConversationModel) _then;

/// Create a copy of ChatbotConversationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? messageCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,messageCount: null == messageCount ? _self.messageCount : messageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatbotConversationModel].
extension ChatbotConversationModelPatterns on ChatbotConversationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatbotConversationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatbotConversationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatbotConversationModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatbotConversationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatbotConversationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatbotConversationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'message_count')  int messageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatbotConversationModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.messageCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'message_count')  int messageCount)  $default,) {final _that = this;
switch (_that) {
case _ChatbotConversationModel():
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.messageCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'message_count')  int messageCount)?  $default,) {final _that = this;
switch (_that) {
case _ChatbotConversationModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.messageCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatbotConversationModel implements ChatbotConversationModel {
  const _ChatbotConversationModel({required this.id, required this.title, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'message_count') required this.messageCount});
  factory _ChatbotConversationModel.fromJson(Map<String, dynamic> json) => _$ChatbotConversationModelFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'message_count') final  int messageCount;

/// Create a copy of ChatbotConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatbotConversationModelCopyWith<_ChatbotConversationModel> get copyWith => __$ChatbotConversationModelCopyWithImpl<_ChatbotConversationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatbotConversationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatbotConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.messageCount, messageCount) || other.messageCount == messageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,messageCount);

@override
String toString() {
  return 'ChatbotConversationModel(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, messageCount: $messageCount)';
}


}

/// @nodoc
abstract mixin class _$ChatbotConversationModelCopyWith<$Res> implements $ChatbotConversationModelCopyWith<$Res> {
  factory _$ChatbotConversationModelCopyWith(_ChatbotConversationModel value, $Res Function(_ChatbotConversationModel) _then) = __$ChatbotConversationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'message_count') int messageCount
});




}
/// @nodoc
class __$ChatbotConversationModelCopyWithImpl<$Res>
    implements _$ChatbotConversationModelCopyWith<$Res> {
  __$ChatbotConversationModelCopyWithImpl(this._self, this._then);

  final _ChatbotConversationModel _self;
  final $Res Function(_ChatbotConversationModel) _then;

/// Create a copy of ChatbotConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? messageCount = null,}) {
  return _then(_ChatbotConversationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,messageCount: null == messageCount ? _self.messageCount : messageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
