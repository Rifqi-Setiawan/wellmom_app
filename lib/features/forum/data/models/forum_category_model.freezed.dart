// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForumCategoryModel _$ForumCategoryModelFromJson(Map<String, dynamic> json) {
  return _ForumCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$ForumCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get icon =>
      throw _privateConstructorUsedError; // nullable karena API bisa mengembalikan null
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ForumCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumCategoryModelCopyWith<ForumCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumCategoryModelCopyWith<$Res> {
  factory $ForumCategoryModelCopyWith(
    ForumCategoryModel value,
    $Res Function(ForumCategoryModel) then,
  ) = _$ForumCategoryModelCopyWithImpl<$Res, ForumCategoryModel>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'display_name') String displayName,
    String description,
    String? icon,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$ForumCategoryModelCopyWithImpl<$Res, $Val extends ForumCategoryModel>
    implements $ForumCategoryModelCopyWith<$Res> {
  _$ForumCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? description = null,
    Object? icon = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForumCategoryModelImplCopyWith<$Res>
    implements $ForumCategoryModelCopyWith<$Res> {
  factory _$$ForumCategoryModelImplCopyWith(
    _$ForumCategoryModelImpl value,
    $Res Function(_$ForumCategoryModelImpl) then,
  ) = __$$ForumCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'display_name') String displayName,
    String description,
    String? icon,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$ForumCategoryModelImplCopyWithImpl<$Res>
    extends _$ForumCategoryModelCopyWithImpl<$Res, _$ForumCategoryModelImpl>
    implements _$$ForumCategoryModelImplCopyWith<$Res> {
  __$$ForumCategoryModelImplCopyWithImpl(
    _$ForumCategoryModelImpl _value,
    $Res Function(_$ForumCategoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? description = null,
    Object? icon = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ForumCategoryModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumCategoryModelImpl implements _ForumCategoryModel {
  const _$ForumCategoryModelImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'display_name') required this.displayName,
    required this.description,
    this.icon,
    @JsonKey(name: 'is_active') required this.isActive,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$ForumCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumCategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  final String description;
  @override
  final String? icon;
  // nullable karena API bisa mengembalikan null
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ForumCategoryModel(id: $id, name: $name, displayName: $displayName, description: $description, icon: $icon, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    displayName,
    description,
    icon,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ForumCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumCategoryModelImplCopyWith<_$ForumCategoryModelImpl> get copyWith =>
      __$$ForumCategoryModelImplCopyWithImpl<_$ForumCategoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumCategoryModelImplToJson(this);
  }
}

abstract class _ForumCategoryModel implements ForumCategoryModel {
  const factory _ForumCategoryModel({
    required final int id,
    required final String name,
    @JsonKey(name: 'display_name') required final String displayName,
    required final String description,
    final String? icon,
    @JsonKey(name: 'is_active') required final bool isActive,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$ForumCategoryModelImpl;

  factory _ForumCategoryModel.fromJson(Map<String, dynamic> json) =
      _$ForumCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  String get description;
  @override
  String? get icon; // nullable karena API bisa mengembalikan null
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ForumCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumCategoryModelImplCopyWith<_$ForumCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForumCategoriesResponseModel _$ForumCategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ForumCategoriesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ForumCategoriesResponseModel {
  List<ForumCategoryModel> get categories => throw _privateConstructorUsedError;

  /// Serializes this ForumCategoriesResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForumCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForumCategoriesResponseModelCopyWith<ForumCategoriesResponseModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumCategoriesResponseModelCopyWith<$Res> {
  factory $ForumCategoriesResponseModelCopyWith(
    ForumCategoriesResponseModel value,
    $Res Function(ForumCategoriesResponseModel) then,
  ) =
      _$ForumCategoriesResponseModelCopyWithImpl<
        $Res,
        ForumCategoriesResponseModel
      >;
  @useResult
  $Res call({List<ForumCategoryModel> categories});
}

/// @nodoc
class _$ForumCategoriesResponseModelCopyWithImpl<
  $Res,
  $Val extends ForumCategoriesResponseModel
>
    implements $ForumCategoriesResponseModelCopyWith<$Res> {
  _$ForumCategoriesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForumCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null}) {
    return _then(
      _value.copyWith(
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<ForumCategoryModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForumCategoriesResponseModelImplCopyWith<$Res>
    implements $ForumCategoriesResponseModelCopyWith<$Res> {
  factory _$$ForumCategoriesResponseModelImplCopyWith(
    _$ForumCategoriesResponseModelImpl value,
    $Res Function(_$ForumCategoriesResponseModelImpl) then,
  ) = __$$ForumCategoriesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ForumCategoryModel> categories});
}

/// @nodoc
class __$$ForumCategoriesResponseModelImplCopyWithImpl<$Res>
    extends
        _$ForumCategoriesResponseModelCopyWithImpl<
          $Res,
          _$ForumCategoriesResponseModelImpl
        >
    implements _$$ForumCategoriesResponseModelImplCopyWith<$Res> {
  __$$ForumCategoriesResponseModelImplCopyWithImpl(
    _$ForumCategoriesResponseModelImpl _value,
    $Res Function(_$ForumCategoriesResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForumCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null}) {
    return _then(
      _$ForumCategoriesResponseModelImpl(
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<ForumCategoryModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumCategoriesResponseModelImpl
    implements _ForumCategoriesResponseModel {
  const _$ForumCategoriesResponseModelImpl({
    required final List<ForumCategoryModel> categories,
  }) : _categories = categories;

  factory _$ForumCategoriesResponseModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ForumCategoriesResponseModelImplFromJson(json);

  final List<ForumCategoryModel> _categories;
  @override
  List<ForumCategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'ForumCategoriesResponseModel(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumCategoriesResponseModelImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
  );

  /// Create a copy of ForumCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumCategoriesResponseModelImplCopyWith<
    _$ForumCategoriesResponseModelImpl
  >
  get copyWith =>
      __$$ForumCategoriesResponseModelImplCopyWithImpl<
        _$ForumCategoriesResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumCategoriesResponseModelImplToJson(this);
  }
}

abstract class _ForumCategoriesResponseModel
    implements ForumCategoriesResponseModel {
  const factory _ForumCategoriesResponseModel({
    required final List<ForumCategoryModel> categories,
  }) = _$ForumCategoriesResponseModelImpl;

  factory _ForumCategoriesResponseModel.fromJson(Map<String, dynamic> json) =
      _$ForumCategoriesResponseModelImpl.fromJson;

  @override
  List<ForumCategoryModel> get categories;

  /// Create a copy of ForumCategoriesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForumCategoriesResponseModelImplCopyWith<
    _$ForumCategoriesResponseModelImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
