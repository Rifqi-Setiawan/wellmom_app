// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatbotMessageModel {

 int get id; String get role;// "user" or "assistant"
 String get content;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of ChatbotMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotMessageModelCopyWith<ChatbotMessageModel> get copyWith => _$ChatbotMessageModelCopyWithImpl<ChatbotMessageModel>(this as ChatbotMessageModel, _$identity);

  /// Serializes this ChatbotMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,content,createdAt);

@override
String toString() {
  return 'ChatbotMessageModel(id: $id, role: $role, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatbotMessageModelCopyWith<$Res>  {
  factory $ChatbotMessageModelCopyWith(ChatbotMessageModel value, $Res Function(ChatbotMessageModel) _then) = _$ChatbotMessageModelCopyWithImpl;
@useResult
$Res call({
 int id, String role, String content,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$ChatbotMessageModelCopyWithImpl<$Res>
    implements $ChatbotMessageModelCopyWith<$Res> {
  _$ChatbotMessageModelCopyWithImpl(this._self, this._then);

  final ChatbotMessageModel _self;
  final $Res Function(ChatbotMessageModel) _then;

/// Create a copy of ChatbotMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatbotMessageModel].
extension ChatbotMessageModelPatterns on ChatbotMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatbotMessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatbotMessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatbotMessageModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatbotMessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatbotMessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatbotMessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String role,  String content, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatbotMessageModel() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String role,  String content, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatbotMessageModel():
return $default(_that.id,_that.role,_that.content,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String role,  String content, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatbotMessageModel() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatbotMessageModel implements ChatbotMessageModel {
  const _ChatbotMessageModel({required this.id, required this.role, required this.content, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ChatbotMessageModel.fromJson(Map<String, dynamic> json) => _$ChatbotMessageModelFromJson(json);

@override final  int id;
@override final  String role;
// "user" or "assistant"
@override final  String content;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of ChatbotMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatbotMessageModelCopyWith<_ChatbotMessageModel> get copyWith => __$ChatbotMessageModelCopyWithImpl<_ChatbotMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatbotMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatbotMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,content,createdAt);

@override
String toString() {
  return 'ChatbotMessageModel(id: $id, role: $role, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatbotMessageModelCopyWith<$Res> implements $ChatbotMessageModelCopyWith<$Res> {
  factory _$ChatbotMessageModelCopyWith(_ChatbotMessageModel value, $Res Function(_ChatbotMessageModel) _then) = __$ChatbotMessageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String role, String content,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$ChatbotMessageModelCopyWithImpl<$Res>
    implements _$ChatbotMessageModelCopyWith<$Res> {
  __$ChatbotMessageModelCopyWithImpl(this._self, this._then);

  final _ChatbotMessageModel _self;
  final $Res Function(_ChatbotMessageModel) _then;

/// Create a copy of ChatbotMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_ChatbotMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
