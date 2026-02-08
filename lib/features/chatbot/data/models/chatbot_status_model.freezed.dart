// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatbot_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatbotStatusModel {

@JsonKey(name: 'is_available') bool get isAvailable;@JsonKey(name: 'model_name') String? get modelName;@JsonKey(name: 'api_key_configured') bool get apiKeyConfigured; String? get error;
/// Create a copy of ChatbotStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatbotStatusModelCopyWith<ChatbotStatusModel> get copyWith => _$ChatbotStatusModelCopyWithImpl<ChatbotStatusModel>(this as ChatbotStatusModel, _$identity);

  /// Serializes this ChatbotStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatbotStatusModel&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.apiKeyConfigured, apiKeyConfigured) || other.apiKeyConfigured == apiKeyConfigured)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAvailable,modelName,apiKeyConfigured,error);

@override
String toString() {
  return 'ChatbotStatusModel(isAvailable: $isAvailable, modelName: $modelName, apiKeyConfigured: $apiKeyConfigured, error: $error)';
}


}

/// @nodoc
abstract mixin class $ChatbotStatusModelCopyWith<$Res>  {
  factory $ChatbotStatusModelCopyWith(ChatbotStatusModel value, $Res Function(ChatbotStatusModel) _then) = _$ChatbotStatusModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'model_name') String? modelName,@JsonKey(name: 'api_key_configured') bool apiKeyConfigured, String? error
});




}
/// @nodoc
class _$ChatbotStatusModelCopyWithImpl<$Res>
    implements $ChatbotStatusModelCopyWith<$Res> {
  _$ChatbotStatusModelCopyWithImpl(this._self, this._then);

  final ChatbotStatusModel _self;
  final $Res Function(ChatbotStatusModel) _then;

/// Create a copy of ChatbotStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAvailable = null,Object? modelName = freezed,Object? apiKeyConfigured = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,modelName: freezed == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String?,apiKeyConfigured: null == apiKeyConfigured ? _self.apiKeyConfigured : apiKeyConfigured // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatbotStatusModel].
extension ChatbotStatusModelPatterns on ChatbotStatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatbotStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatbotStatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatbotStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatbotStatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatbotStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatbotStatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'model_name')  String? modelName, @JsonKey(name: 'api_key_configured')  bool apiKeyConfigured,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatbotStatusModel() when $default != null:
return $default(_that.isAvailable,_that.modelName,_that.apiKeyConfigured,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'model_name')  String? modelName, @JsonKey(name: 'api_key_configured')  bool apiKeyConfigured,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ChatbotStatusModel():
return $default(_that.isAvailable,_that.modelName,_that.apiKeyConfigured,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_available')  bool isAvailable, @JsonKey(name: 'model_name')  String? modelName, @JsonKey(name: 'api_key_configured')  bool apiKeyConfigured,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ChatbotStatusModel() when $default != null:
return $default(_that.isAvailable,_that.modelName,_that.apiKeyConfigured,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatbotStatusModel implements ChatbotStatusModel {
  const _ChatbotStatusModel({@JsonKey(name: 'is_available') required this.isAvailable, @JsonKey(name: 'model_name') this.modelName, @JsonKey(name: 'api_key_configured') required this.apiKeyConfigured, this.error});
  factory _ChatbotStatusModel.fromJson(Map<String, dynamic> json) => _$ChatbotStatusModelFromJson(json);

@override@JsonKey(name: 'is_available') final  bool isAvailable;
@override@JsonKey(name: 'model_name') final  String? modelName;
@override@JsonKey(name: 'api_key_configured') final  bool apiKeyConfigured;
@override final  String? error;

/// Create a copy of ChatbotStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatbotStatusModelCopyWith<_ChatbotStatusModel> get copyWith => __$ChatbotStatusModelCopyWithImpl<_ChatbotStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatbotStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatbotStatusModel&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.apiKeyConfigured, apiKeyConfigured) || other.apiKeyConfigured == apiKeyConfigured)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAvailable,modelName,apiKeyConfigured,error);

@override
String toString() {
  return 'ChatbotStatusModel(isAvailable: $isAvailable, modelName: $modelName, apiKeyConfigured: $apiKeyConfigured, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ChatbotStatusModelCopyWith<$Res> implements $ChatbotStatusModelCopyWith<$Res> {
  factory _$ChatbotStatusModelCopyWith(_ChatbotStatusModel value, $Res Function(_ChatbotStatusModel) _then) = __$ChatbotStatusModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_available') bool isAvailable,@JsonKey(name: 'model_name') String? modelName,@JsonKey(name: 'api_key_configured') bool apiKeyConfigured, String? error
});




}
/// @nodoc
class __$ChatbotStatusModelCopyWithImpl<$Res>
    implements _$ChatbotStatusModelCopyWith<$Res> {
  __$ChatbotStatusModelCopyWithImpl(this._self, this._then);

  final _ChatbotStatusModel _self;
  final $Res Function(_ChatbotStatusModel) _then;

/// Create a copy of ChatbotStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAvailable = null,Object? modelName = freezed,Object? apiKeyConfigured = null,Object? error = freezed,}) {
  return _then(_ChatbotStatusModel(
isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,modelName: freezed == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String?,apiKeyConfigured: null == apiKeyConfigured ? _self.apiKeyConfigured : apiKeyConfigured // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
