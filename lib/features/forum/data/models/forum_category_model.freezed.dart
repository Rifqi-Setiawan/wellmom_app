// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumCategoryModel {

 int get id; String get name;@JsonKey(name: 'display_name') String get displayName; String get description; String? get icon;// nullable karena API bisa mengembalikan null
@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ForumCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumCategoryModelCopyWith<ForumCategoryModel> get copyWith => _$ForumCategoryModelCopyWithImpl<ForumCategoryModel>(this as ForumCategoryModel, _$identity);

  /// Serializes this ForumCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,displayName,description,icon,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ForumCategoryModel(id: $id, name: $name, displayName: $displayName, description: $description, icon: $icon, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ForumCategoryModelCopyWith<$Res>  {
  factory $ForumCategoryModelCopyWith(ForumCategoryModel value, $Res Function(ForumCategoryModel) _then) = _$ForumCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'display_name') String displayName, String description, String? icon,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ForumCategoryModelCopyWithImpl<$Res>
    implements $ForumCategoryModelCopyWith<$Res> {
  _$ForumCategoryModelCopyWithImpl(this._self, this._then);

  final ForumCategoryModel _self;
  final $Res Function(ForumCategoryModel) _then;

/// Create a copy of ForumCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? displayName = null,Object? description = null,Object? icon = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumCategoryModel].
extension ForumCategoryModelPatterns on ForumCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'display_name')  String displayName,  String description,  String? icon, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.description,_that.icon,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'display_name')  String displayName,  String description,  String? icon, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ForumCategoryModel():
return $default(_that.id,_that.name,_that.displayName,_that.description,_that.icon,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'display_name')  String displayName,  String description,  String? icon, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ForumCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.description,_that.icon,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumCategoryModel implements ForumCategoryModel {
  const _ForumCategoryModel({required this.id, required this.name, @JsonKey(name: 'display_name') required this.displayName, required this.description, this.icon, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ForumCategoryModel.fromJson(Map<String, dynamic> json) => _$ForumCategoryModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'display_name') final  String displayName;
@override final  String description;
@override final  String? icon;
// nullable karena API bisa mengembalikan null
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ForumCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumCategoryModelCopyWith<_ForumCategoryModel> get copyWith => __$ForumCategoryModelCopyWithImpl<_ForumCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,displayName,description,icon,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ForumCategoryModel(id: $id, name: $name, displayName: $displayName, description: $description, icon: $icon, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ForumCategoryModelCopyWith<$Res> implements $ForumCategoryModelCopyWith<$Res> {
  factory _$ForumCategoryModelCopyWith(_ForumCategoryModel value, $Res Function(_ForumCategoryModel) _then) = __$ForumCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'display_name') String displayName, String description, String? icon,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ForumCategoryModelCopyWithImpl<$Res>
    implements _$ForumCategoryModelCopyWith<$Res> {
  __$ForumCategoryModelCopyWithImpl(this._self, this._then);

  final _ForumCategoryModel _self;
  final $Res Function(_ForumCategoryModel) _then;

/// Create a copy of ForumCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? displayName = null,Object? description = null,Object? icon = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ForumCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ForumCategoriesResponseModel {

 List<ForumCategoryModel> get categories;
/// Create a copy of ForumCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumCategoriesResponseModelCopyWith<ForumCategoriesResponseModel> get copyWith => _$ForumCategoriesResponseModelCopyWithImpl<ForumCategoriesResponseModel>(this as ForumCategoriesResponseModel, _$identity);

  /// Serializes this ForumCategoriesResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumCategoriesResponseModel&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ForumCategoriesResponseModel(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ForumCategoriesResponseModelCopyWith<$Res>  {
  factory $ForumCategoriesResponseModelCopyWith(ForumCategoriesResponseModel value, $Res Function(ForumCategoriesResponseModel) _then) = _$ForumCategoriesResponseModelCopyWithImpl;
@useResult
$Res call({
 List<ForumCategoryModel> categories
});




}
/// @nodoc
class _$ForumCategoriesResponseModelCopyWithImpl<$Res>
    implements $ForumCategoriesResponseModelCopyWith<$Res> {
  _$ForumCategoriesResponseModelCopyWithImpl(this._self, this._then);

  final ForumCategoriesResponseModel _self;
  final $Res Function(ForumCategoriesResponseModel) _then;

/// Create a copy of ForumCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ForumCategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ForumCategoriesResponseModel].
extension ForumCategoriesResponseModelPatterns on ForumCategoriesResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumCategoriesResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumCategoriesResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumCategoriesResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumCategoriesResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumCategoriesResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumCategoriesResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForumCategoryModel> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumCategoriesResponseModel() when $default != null:
return $default(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForumCategoryModel> categories)  $default,) {final _that = this;
switch (_that) {
case _ForumCategoriesResponseModel():
return $default(_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForumCategoryModel> categories)?  $default,) {final _that = this;
switch (_that) {
case _ForumCategoriesResponseModel() when $default != null:
return $default(_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumCategoriesResponseModel implements ForumCategoriesResponseModel {
  const _ForumCategoriesResponseModel({required final  List<ForumCategoryModel> categories}): _categories = categories;
  factory _ForumCategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$ForumCategoriesResponseModelFromJson(json);

 final  List<ForumCategoryModel> _categories;
@override List<ForumCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ForumCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumCategoriesResponseModelCopyWith<_ForumCategoriesResponseModel> get copyWith => __$ForumCategoriesResponseModelCopyWithImpl<_ForumCategoriesResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumCategoriesResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumCategoriesResponseModel&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ForumCategoriesResponseModel(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ForumCategoriesResponseModelCopyWith<$Res> implements $ForumCategoriesResponseModelCopyWith<$Res> {
  factory _$ForumCategoriesResponseModelCopyWith(_ForumCategoriesResponseModel value, $Res Function(_ForumCategoriesResponseModel) _then) = __$ForumCategoriesResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<ForumCategoryModel> categories
});




}
/// @nodoc
class __$ForumCategoriesResponseModelCopyWithImpl<$Res>
    implements _$ForumCategoriesResponseModelCopyWith<$Res> {
  __$ForumCategoriesResponseModelCopyWithImpl(this._self, this._then);

  final _ForumCategoriesResponseModel _self;
  final $Res Function(_ForumCategoriesResponseModel) _then;

/// Create a copy of ForumCategoriesResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_ForumCategoriesResponseModel(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ForumCategoryModel>,
  ));
}


}

// dart format on
