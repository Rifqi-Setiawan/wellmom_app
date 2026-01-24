// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puskesmas_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PuskesmasDetailModel _$PuskesmasDetailModelFromJson(Map<String, dynamic> json) {
  return _PuskesmasDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PuskesmasDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'building_photo_url')
  String? get buildingPhotoUrl => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this PuskesmasDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PuskesmasDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PuskesmasDetailModelCopyWith<PuskesmasDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuskesmasDetailModelCopyWith<$Res> {
  factory $PuskesmasDetailModelCopyWith(
    PuskesmasDetailModel value,
    $Res Function(PuskesmasDetailModel) then,
  ) = _$PuskesmasDetailModelCopyWithImpl<$Res, PuskesmasDetailModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String? phone,
    String? address,
    @JsonKey(name: 'building_photo_url') String? buildingPhotoUrl,
    double? latitude,
    double? longitude,
  });
}

/// @nodoc
class _$PuskesmasDetailModelCopyWithImpl<
  $Res,
  $Val extends PuskesmasDetailModel
>
    implements $PuskesmasDetailModelCopyWith<$Res> {
  _$PuskesmasDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PuskesmasDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? buildingPhotoUrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
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
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            buildingPhotoUrl: freezed == buildingPhotoUrl
                ? _value.buildingPhotoUrl
                : buildingPhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PuskesmasDetailModelImplCopyWith<$Res>
    implements $PuskesmasDetailModelCopyWith<$Res> {
  factory _$$PuskesmasDetailModelImplCopyWith(
    _$PuskesmasDetailModelImpl value,
    $Res Function(_$PuskesmasDetailModelImpl) then,
  ) = __$$PuskesmasDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String? phone,
    String? address,
    @JsonKey(name: 'building_photo_url') String? buildingPhotoUrl,
    double? latitude,
    double? longitude,
  });
}

/// @nodoc
class __$$PuskesmasDetailModelImplCopyWithImpl<$Res>
    extends _$PuskesmasDetailModelCopyWithImpl<$Res, _$PuskesmasDetailModelImpl>
    implements _$$PuskesmasDetailModelImplCopyWith<$Res> {
  __$$PuskesmasDetailModelImplCopyWithImpl(
    _$PuskesmasDetailModelImpl _value,
    $Res Function(_$PuskesmasDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PuskesmasDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? buildingPhotoUrl = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(
      _$PuskesmasDetailModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        buildingPhotoUrl: freezed == buildingPhotoUrl
            ? _value.buildingPhotoUrl
            : buildingPhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PuskesmasDetailModelImpl implements _PuskesmasDetailModel {
  const _$PuskesmasDetailModelImpl({
    required this.id,
    required this.name,
    this.phone,
    this.address,
    @JsonKey(name: 'building_photo_url') this.buildingPhotoUrl,
    this.latitude,
    this.longitude,
  });

  factory _$PuskesmasDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PuskesmasDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  @JsonKey(name: 'building_photo_url')
  final String? buildingPhotoUrl;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'PuskesmasDetailModel(id: $id, name: $name, phone: $phone, address: $address, buildingPhotoUrl: $buildingPhotoUrl, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PuskesmasDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.buildingPhotoUrl, buildingPhotoUrl) ||
                other.buildingPhotoUrl == buildingPhotoUrl) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    address,
    buildingPhotoUrl,
    latitude,
    longitude,
  );

  /// Create a copy of PuskesmasDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PuskesmasDetailModelImplCopyWith<_$PuskesmasDetailModelImpl>
  get copyWith =>
      __$$PuskesmasDetailModelImplCopyWithImpl<_$PuskesmasDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PuskesmasDetailModelImplToJson(this);
  }
}

abstract class _PuskesmasDetailModel implements PuskesmasDetailModel {
  const factory _PuskesmasDetailModel({
    required final int id,
    required final String name,
    final String? phone,
    final String? address,
    @JsonKey(name: 'building_photo_url') final String? buildingPhotoUrl,
    final double? latitude,
    final double? longitude,
  }) = _$PuskesmasDetailModelImpl;

  factory _PuskesmasDetailModel.fromJson(Map<String, dynamic> json) =
      _$PuskesmasDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  @JsonKey(name: 'building_photo_url')
  String? get buildingPhotoUrl;
  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of PuskesmasDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PuskesmasDetailModelImplCopyWith<_$PuskesmasDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
