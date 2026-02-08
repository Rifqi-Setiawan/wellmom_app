// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_create_post_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumCreatePostRequestModel {

 String get title; String get details;@JsonKey(name: 'category_id') int get categoryId;
/// Create a copy of ForumCreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumCreatePostRequestModelCopyWith<ForumCreatePostRequestModel> get copyWith => _$ForumCreatePostRequestModelCopyWithImpl<ForumCreatePostRequestModel>(this as ForumCreatePostRequestModel, _$identity);

  /// Serializes this ForumCreatePostRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumCreatePostRequestModel&&(identical(other.title, title) || other.title == title)&&(identical(other.details, details) || other.details == details)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,details,categoryId);

@override
String toString() {
  return 'ForumCreatePostRequestModel(title: $title, details: $details, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ForumCreatePostRequestModelCopyWith<$Res>  {
  factory $ForumCreatePostRequestModelCopyWith(ForumCreatePostRequestModel value, $Res Function(ForumCreatePostRequestModel) _then) = _$ForumCreatePostRequestModelCopyWithImpl;
@useResult
$Res call({
 String title, String details,@JsonKey(name: 'category_id') int categoryId
});




}
/// @nodoc
class _$ForumCreatePostRequestModelCopyWithImpl<$Res>
    implements $ForumCreatePostRequestModelCopyWith<$Res> {
  _$ForumCreatePostRequestModelCopyWithImpl(this._self, this._then);

  final ForumCreatePostRequestModel _self;
  final $Res Function(ForumCreatePostRequestModel) _then;

/// Create a copy of ForumCreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? details = null,Object? categoryId = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumCreatePostRequestModel].
extension ForumCreatePostRequestModelPatterns on ForumCreatePostRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumCreatePostRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumCreatePostRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumCreatePostRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumCreatePostRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumCreatePostRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumCreatePostRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String details, @JsonKey(name: 'category_id')  int categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumCreatePostRequestModel() when $default != null:
return $default(_that.title,_that.details,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String details, @JsonKey(name: 'category_id')  int categoryId)  $default,) {final _that = this;
switch (_that) {
case _ForumCreatePostRequestModel():
return $default(_that.title,_that.details,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String details, @JsonKey(name: 'category_id')  int categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ForumCreatePostRequestModel() when $default != null:
return $default(_that.title,_that.details,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumCreatePostRequestModel implements ForumCreatePostRequestModel {
  const _ForumCreatePostRequestModel({required this.title, required this.details, @JsonKey(name: 'category_id') required this.categoryId});
  factory _ForumCreatePostRequestModel.fromJson(Map<String, dynamic> json) => _$ForumCreatePostRequestModelFromJson(json);

@override final  String title;
@override final  String details;
@override@JsonKey(name: 'category_id') final  int categoryId;

/// Create a copy of ForumCreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumCreatePostRequestModelCopyWith<_ForumCreatePostRequestModel> get copyWith => __$ForumCreatePostRequestModelCopyWithImpl<_ForumCreatePostRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumCreatePostRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumCreatePostRequestModel&&(identical(other.title, title) || other.title == title)&&(identical(other.details, details) || other.details == details)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,details,categoryId);

@override
String toString() {
  return 'ForumCreatePostRequestModel(title: $title, details: $details, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ForumCreatePostRequestModelCopyWith<$Res> implements $ForumCreatePostRequestModelCopyWith<$Res> {
  factory _$ForumCreatePostRequestModelCopyWith(_ForumCreatePostRequestModel value, $Res Function(_ForumCreatePostRequestModel) _then) = __$ForumCreatePostRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String details,@JsonKey(name: 'category_id') int categoryId
});




}
/// @nodoc
class __$ForumCreatePostRequestModelCopyWithImpl<$Res>
    implements _$ForumCreatePostRequestModelCopyWith<$Res> {
  __$ForumCreatePostRequestModelCopyWithImpl(this._self, this._then);

  final _ForumCreatePostRequestModel _self;
  final $Res Function(_ForumCreatePostRequestModel) _then;

/// Create a copy of ForumCreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? details = null,Object? categoryId = null,}) {
  return _then(_ForumCreatePostRequestModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
