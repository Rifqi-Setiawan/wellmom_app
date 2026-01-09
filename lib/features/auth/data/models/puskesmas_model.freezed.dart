// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puskesmas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PuskesmasModel _$PuskesmasModelFromJson(Map<String, dynamic> json) {
  return _PuskesmasModel.fromJson(json);
}

/// @nodoc
mixin _$PuskesmasModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_status')
  String get registrationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this PuskesmasModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PuskesmasModelCopyWith<PuskesmasModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuskesmasModelCopyWith<$Res> {
  factory $PuskesmasModelCopyWith(
    PuskesmasModel value,
    $Res Function(PuskesmasModel) then,
  ) = _$PuskesmasModelCopyWithImpl<$Res, PuskesmasModel>;
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'registration_status') String registrationStatus,
    @JsonKey(name: 'is_active') bool isActive,
    String? phone,
    String? email,
    String? address,
  });
}

/// @nodoc
class _$PuskesmasModelCopyWithImpl<$Res, $Val extends PuskesmasModel>
    implements $PuskesmasModelCopyWith<$Res> {
  _$PuskesmasModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? registrationStatus = null,
    Object? isActive = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
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
            registrationStatus: null == registrationStatus
                ? _value.registrationStatus
                : registrationStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PuskesmasModelImplCopyWith<$Res>
    implements $PuskesmasModelCopyWith<$Res> {
  factory _$$PuskesmasModelImplCopyWith(
    _$PuskesmasModelImpl value,
    $Res Function(_$PuskesmasModelImpl) then,
  ) = __$$PuskesmasModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    @JsonKey(name: 'registration_status') String registrationStatus,
    @JsonKey(name: 'is_active') bool isActive,
    String? phone,
    String? email,
    String? address,
  });
}

/// @nodoc
class __$$PuskesmasModelImplCopyWithImpl<$Res>
    extends _$PuskesmasModelCopyWithImpl<$Res, _$PuskesmasModelImpl>
    implements _$$PuskesmasModelImplCopyWith<$Res> {
  __$$PuskesmasModelImplCopyWithImpl(
    _$PuskesmasModelImpl _value,
    $Res Function(_$PuskesmasModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? registrationStatus = null,
    Object? isActive = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
  }) {
    return _then(
      _$PuskesmasModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        registrationStatus: null == registrationStatus
            ? _value.registrationStatus
            : registrationStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PuskesmasModelImpl implements _PuskesmasModel {
  const _$PuskesmasModelImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'registration_status') required this.registrationStatus,
    @JsonKey(name: 'is_active') this.isActive = true,
    this.phone,
    this.email,
    this.address,
  });

  factory _$PuskesmasModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PuskesmasModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'registration_status')
  final String registrationStatus;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;

  @override
  String toString() {
    return 'PuskesmasModel(id: $id, name: $name, registrationStatus: $registrationStatus, isActive: $isActive, phone: $phone, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PuskesmasModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationStatus, registrationStatus) ||
                other.registrationStatus == registrationStatus) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    registrationStatus,
    isActive,
    phone,
    email,
    address,
  );

  /// Create a copy of PuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PuskesmasModelImplCopyWith<_$PuskesmasModelImpl> get copyWith =>
      __$$PuskesmasModelImplCopyWithImpl<_$PuskesmasModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PuskesmasModelImplToJson(this);
  }
}

abstract class _PuskesmasModel implements PuskesmasModel {
  const factory _PuskesmasModel({
    required final int id,
    required final String name,
    @JsonKey(name: 'registration_status')
    required final String registrationStatus,
    @JsonKey(name: 'is_active') final bool isActive,
    final String? phone,
    final String? email,
    final String? address,
  }) = _$PuskesmasModelImpl;

  factory _PuskesmasModel.fromJson(Map<String, dynamic> json) =
      _$PuskesmasModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'registration_status')
  String get registrationStatus;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;

  /// Create a copy of PuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PuskesmasModelImplCopyWith<_$PuskesmasModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearestPuskesmasModel _$NearestPuskesmasModelFromJson(
  Map<String, dynamic> json,
) {
  return _NearestPuskesmasModel.fromJson(json);
}

/// @nodoc
mixin _$NearestPuskesmasModel {
  PuskesmasModel get puskesmas => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_km')
  double get distanceKm => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this NearestPuskesmasModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearestPuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearestPuskesmasModelCopyWith<NearestPuskesmasModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearestPuskesmasModelCopyWith<$Res> {
  factory $NearestPuskesmasModelCopyWith(
    NearestPuskesmasModel value,
    $Res Function(NearestPuskesmasModel) then,
  ) = _$NearestPuskesmasModelCopyWithImpl<$Res, NearestPuskesmasModel>;
  @useResult
  $Res call({
    PuskesmasModel puskesmas,
    @JsonKey(name: 'distance_km') double distanceKm,
    String address,
  });

  $PuskesmasModelCopyWith<$Res> get puskesmas;
}

/// @nodoc
class _$NearestPuskesmasModelCopyWithImpl<
  $Res,
  $Val extends NearestPuskesmasModel
>
    implements $NearestPuskesmasModelCopyWith<$Res> {
  _$NearestPuskesmasModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearestPuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puskesmas = null,
    Object? distanceKm = null,
    Object? address = null,
  }) {
    return _then(
      _value.copyWith(
            puskesmas: null == puskesmas
                ? _value.puskesmas
                : puskesmas // ignore: cast_nullable_to_non_nullable
                      as PuskesmasModel,
            distanceKm: null == distanceKm
                ? _value.distanceKm
                : distanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of NearestPuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PuskesmasModelCopyWith<$Res> get puskesmas {
    return $PuskesmasModelCopyWith<$Res>(_value.puskesmas, (value) {
      return _then(_value.copyWith(puskesmas: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NearestPuskesmasModelImplCopyWith<$Res>
    implements $NearestPuskesmasModelCopyWith<$Res> {
  factory _$$NearestPuskesmasModelImplCopyWith(
    _$NearestPuskesmasModelImpl value,
    $Res Function(_$NearestPuskesmasModelImpl) then,
  ) = __$$NearestPuskesmasModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PuskesmasModel puskesmas,
    @JsonKey(name: 'distance_km') double distanceKm,
    String address,
  });

  @override
  $PuskesmasModelCopyWith<$Res> get puskesmas;
}

/// @nodoc
class __$$NearestPuskesmasModelImplCopyWithImpl<$Res>
    extends
        _$NearestPuskesmasModelCopyWithImpl<$Res, _$NearestPuskesmasModelImpl>
    implements _$$NearestPuskesmasModelImplCopyWith<$Res> {
  __$$NearestPuskesmasModelImplCopyWithImpl(
    _$NearestPuskesmasModelImpl _value,
    $Res Function(_$NearestPuskesmasModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NearestPuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puskesmas = null,
    Object? distanceKm = null,
    Object? address = null,
  }) {
    return _then(
      _$NearestPuskesmasModelImpl(
        puskesmas: null == puskesmas
            ? _value.puskesmas
            : puskesmas // ignore: cast_nullable_to_non_nullable
                  as PuskesmasModel,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NearestPuskesmasModelImpl implements _NearestPuskesmasModel {
  const _$NearestPuskesmasModelImpl({
    required this.puskesmas,
    @JsonKey(name: 'distance_km') required this.distanceKm,
    required this.address,
  });

  factory _$NearestPuskesmasModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearestPuskesmasModelImplFromJson(json);

  @override
  final PuskesmasModel puskesmas;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  final String address;

  @override
  String toString() {
    return 'NearestPuskesmasModel(puskesmas: $puskesmas, distanceKm: $distanceKm, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearestPuskesmasModelImpl &&
            (identical(other.puskesmas, puskesmas) ||
                other.puskesmas == puskesmas) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, puskesmas, distanceKm, address);

  /// Create a copy of NearestPuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearestPuskesmasModelImplCopyWith<_$NearestPuskesmasModelImpl>
  get copyWith =>
      __$$NearestPuskesmasModelImplCopyWithImpl<_$NearestPuskesmasModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NearestPuskesmasModelImplToJson(this);
  }
}

abstract class _NearestPuskesmasModel implements NearestPuskesmasModel {
  const factory _NearestPuskesmasModel({
    required final PuskesmasModel puskesmas,
    @JsonKey(name: 'distance_km') required final double distanceKm,
    required final String address,
  }) = _$NearestPuskesmasModelImpl;

  factory _NearestPuskesmasModel.fromJson(Map<String, dynamic> json) =
      _$NearestPuskesmasModelImpl.fromJson;

  @override
  PuskesmasModel get puskesmas;
  @override
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @override
  String get address;

  /// Create a copy of NearestPuskesmasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearestPuskesmasModelImplCopyWith<_$NearestPuskesmasModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
