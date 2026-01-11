// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_ibu_hamil_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterIbuHamilResponseModel _$RegisterIbuHamilResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _RegisterIbuHamilResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterIbuHamilResponseModel {
  @JsonKey(name: 'ibu_hamil')
  IbuHamilResponseData get ibuHamil => throw _privateConstructorUsedError;
  UserResponseData get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this RegisterIbuHamilResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterIbuHamilResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterIbuHamilResponseModelCopyWith<RegisterIbuHamilResponseModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterIbuHamilResponseModelCopyWith<$Res> {
  factory $RegisterIbuHamilResponseModelCopyWith(
    RegisterIbuHamilResponseModel value,
    $Res Function(RegisterIbuHamilResponseModel) then,
  ) =
      _$RegisterIbuHamilResponseModelCopyWithImpl<
        $Res,
        RegisterIbuHamilResponseModel
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'ibu_hamil') IbuHamilResponseData ibuHamil,
    UserResponseData user,
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'token_type') String tokenType,
    String message,
  });

  $IbuHamilResponseDataCopyWith<$Res> get ibuHamil;
  $UserResponseDataCopyWith<$Res> get user;
}

/// @nodoc
class _$RegisterIbuHamilResponseModelCopyWithImpl<
  $Res,
  $Val extends RegisterIbuHamilResponseModel
>
    implements $RegisterIbuHamilResponseModelCopyWith<$Res> {
  _$RegisterIbuHamilResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterIbuHamilResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ibuHamil = null,
    Object? user = null,
    Object? accessToken = null,
    Object? tokenType = null,
    Object? message = null,
  }) {
    return _then(
      _value.copyWith(
            ibuHamil: null == ibuHamil
                ? _value.ibuHamil
                : ibuHamil // ignore: cast_nullable_to_non_nullable
                      as IbuHamilResponseData,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserResponseData,
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenType: null == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of RegisterIbuHamilResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IbuHamilResponseDataCopyWith<$Res> get ibuHamil {
    return $IbuHamilResponseDataCopyWith<$Res>(_value.ibuHamil, (value) {
      return _then(_value.copyWith(ibuHamil: value) as $Val);
    });
  }

  /// Create a copy of RegisterIbuHamilResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserResponseDataCopyWith<$Res> get user {
    return $UserResponseDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterIbuHamilResponseModelImplCopyWith<$Res>
    implements $RegisterIbuHamilResponseModelCopyWith<$Res> {
  factory _$$RegisterIbuHamilResponseModelImplCopyWith(
    _$RegisterIbuHamilResponseModelImpl value,
    $Res Function(_$RegisterIbuHamilResponseModelImpl) then,
  ) = __$$RegisterIbuHamilResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ibu_hamil') IbuHamilResponseData ibuHamil,
    UserResponseData user,
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'token_type') String tokenType,
    String message,
  });

  @override
  $IbuHamilResponseDataCopyWith<$Res> get ibuHamil;
  @override
  $UserResponseDataCopyWith<$Res> get user;
}

/// @nodoc
class __$$RegisterIbuHamilResponseModelImplCopyWithImpl<$Res>
    extends
        _$RegisterIbuHamilResponseModelCopyWithImpl<
          $Res,
          _$RegisterIbuHamilResponseModelImpl
        >
    implements _$$RegisterIbuHamilResponseModelImplCopyWith<$Res> {
  __$$RegisterIbuHamilResponseModelImplCopyWithImpl(
    _$RegisterIbuHamilResponseModelImpl _value,
    $Res Function(_$RegisterIbuHamilResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterIbuHamilResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ibuHamil = null,
    Object? user = null,
    Object? accessToken = null,
    Object? tokenType = null,
    Object? message = null,
  }) {
    return _then(
      _$RegisterIbuHamilResponseModelImpl(
        ibuHamil: null == ibuHamil
            ? _value.ibuHamil
            : ibuHamil // ignore: cast_nullable_to_non_nullable
                  as IbuHamilResponseData,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponseData,
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenType: null == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterIbuHamilResponseModelImpl
    implements _RegisterIbuHamilResponseModel {
  const _$RegisterIbuHamilResponseModelImpl({
    @JsonKey(name: 'ibu_hamil') required this.ibuHamil,
    required this.user,
    @JsonKey(name: 'access_token') required this.accessToken,
    @JsonKey(name: 'token_type') required this.tokenType,
    required this.message,
  });

  factory _$RegisterIbuHamilResponseModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RegisterIbuHamilResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'ibu_hamil')
  final IbuHamilResponseData ibuHamil;
  @override
  final UserResponseData user;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  final String message;

  @override
  String toString() {
    return 'RegisterIbuHamilResponseModel(ibuHamil: $ibuHamil, user: $user, accessToken: $accessToken, tokenType: $tokenType, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterIbuHamilResponseModelImpl &&
            (identical(other.ibuHamil, ibuHamil) ||
                other.ibuHamil == ibuHamil) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ibuHamil, user, accessToken, tokenType, message);

  /// Create a copy of RegisterIbuHamilResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterIbuHamilResponseModelImplCopyWith<
    _$RegisterIbuHamilResponseModelImpl
  >
  get copyWith =>
      __$$RegisterIbuHamilResponseModelImplCopyWithImpl<
        _$RegisterIbuHamilResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterIbuHamilResponseModelImplToJson(this);
  }
}

abstract class _RegisterIbuHamilResponseModel
    implements RegisterIbuHamilResponseModel {
  const factory _RegisterIbuHamilResponseModel({
    @JsonKey(name: 'ibu_hamil') required final IbuHamilResponseData ibuHamil,
    required final UserResponseData user,
    @JsonKey(name: 'access_token') required final String accessToken,
    @JsonKey(name: 'token_type') required final String tokenType,
    required final String message,
  }) = _$RegisterIbuHamilResponseModelImpl;

  factory _RegisterIbuHamilResponseModel.fromJson(Map<String, dynamic> json) =
      _$RegisterIbuHamilResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'ibu_hamil')
  IbuHamilResponseData get ibuHamil;
  @override
  UserResponseData get user;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  String get message;

  /// Create a copy of RegisterIbuHamilResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterIbuHamilResponseModelImplCopyWith<
    _$RegisterIbuHamilResponseModelImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

IbuHamilResponseData _$IbuHamilResponseDataFromJson(Map<String, dynamic> json) {
  return _IbuHamilResponseData.fromJson(json);
}

/// @nodoc
mixin _$IbuHamilResponseData {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap => throw _privateConstructorUsedError;
  String get nik => throw _privateConstructorUsedError;

  /// Serializes this IbuHamilResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IbuHamilResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IbuHamilResponseDataCopyWith<IbuHamilResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IbuHamilResponseDataCopyWith<$Res> {
  factory $IbuHamilResponseDataCopyWith(
    IbuHamilResponseData value,
    $Res Function(IbuHamilResponseData) then,
  ) = _$IbuHamilResponseDataCopyWithImpl<$Res, IbuHamilResponseData>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String nik,
  });
}

/// @nodoc
class _$IbuHamilResponseDataCopyWithImpl<
  $Res,
  $Val extends IbuHamilResponseData
>
    implements $IbuHamilResponseDataCopyWith<$Res> {
  _$IbuHamilResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IbuHamilResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaLengkap = null,
    Object? nik = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            namaLengkap: null == namaLengkap
                ? _value.namaLengkap
                : namaLengkap // ignore: cast_nullable_to_non_nullable
                      as String,
            nik: null == nik
                ? _value.nik
                : nik // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IbuHamilResponseDataImplCopyWith<$Res>
    implements $IbuHamilResponseDataCopyWith<$Res> {
  factory _$$IbuHamilResponseDataImplCopyWith(
    _$IbuHamilResponseDataImpl value,
    $Res Function(_$IbuHamilResponseDataImpl) then,
  ) = __$$IbuHamilResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String nik,
  });
}

/// @nodoc
class __$$IbuHamilResponseDataImplCopyWithImpl<$Res>
    extends _$IbuHamilResponseDataCopyWithImpl<$Res, _$IbuHamilResponseDataImpl>
    implements _$$IbuHamilResponseDataImplCopyWith<$Res> {
  __$$IbuHamilResponseDataImplCopyWithImpl(
    _$IbuHamilResponseDataImpl _value,
    $Res Function(_$IbuHamilResponseDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IbuHamilResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaLengkap = null,
    Object? nik = null,
  }) {
    return _then(
      _$IbuHamilResponseDataImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        namaLengkap: null == namaLengkap
            ? _value.namaLengkap
            : namaLengkap // ignore: cast_nullable_to_non_nullable
                  as String,
        nik: null == nik
            ? _value.nik
            : nik // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IbuHamilResponseDataImpl implements _IbuHamilResponseData {
  const _$IbuHamilResponseDataImpl({
    required this.id,
    @JsonKey(name: 'nama_lengkap') required this.namaLengkap,
    required this.nik,
  });

  factory _$IbuHamilResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IbuHamilResponseDataImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nama_lengkap')
  final String namaLengkap;
  @override
  final String nik;

  @override
  String toString() {
    return 'IbuHamilResponseData(id: $id, namaLengkap: $namaLengkap, nik: $nik)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IbuHamilResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaLengkap, namaLengkap) ||
                other.namaLengkap == namaLengkap) &&
            (identical(other.nik, nik) || other.nik == nik));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaLengkap, nik);

  /// Create a copy of IbuHamilResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IbuHamilResponseDataImplCopyWith<_$IbuHamilResponseDataImpl>
  get copyWith =>
      __$$IbuHamilResponseDataImplCopyWithImpl<_$IbuHamilResponseDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IbuHamilResponseDataImplToJson(this);
  }
}

abstract class _IbuHamilResponseData implements IbuHamilResponseData {
  const factory _IbuHamilResponseData({
    required final int id,
    @JsonKey(name: 'nama_lengkap') required final String namaLengkap,
    required final String nik,
  }) = _$IbuHamilResponseDataImpl;

  factory _IbuHamilResponseData.fromJson(Map<String, dynamic> json) =
      _$IbuHamilResponseDataImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap;
  @override
  String get nik;

  /// Create a copy of IbuHamilResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IbuHamilResponseDataImplCopyWith<_$IbuHamilResponseDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserResponseData _$UserResponseDataFromJson(Map<String, dynamic> json) {
  return _UserResponseData.fromJson(json);
}

/// @nodoc
mixin _$UserResponseData {
  int get id => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;

  /// Serializes this UserResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResponseDataCopyWith<UserResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseDataCopyWith<$Res> {
  factory $UserResponseDataCopyWith(
    UserResponseData value,
    $Res Function(UserResponseData) then,
  ) = _$UserResponseDataCopyWithImpl<$Res, UserResponseData>;
  @useResult
  $Res call({
    int id,
    String phone,
    @JsonKey(name: 'full_name') String fullName,
  });
}

/// @nodoc
class _$UserResponseDataCopyWithImpl<$Res, $Val extends UserResponseData>
    implements $UserResponseDataCopyWith<$Res> {
  _$UserResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? fullName = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserResponseDataImplCopyWith<$Res>
    implements $UserResponseDataCopyWith<$Res> {
  factory _$$UserResponseDataImplCopyWith(
    _$UserResponseDataImpl value,
    $Res Function(_$UserResponseDataImpl) then,
  ) = __$$UserResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String phone,
    @JsonKey(name: 'full_name') String fullName,
  });
}

/// @nodoc
class __$$UserResponseDataImplCopyWithImpl<$Res>
    extends _$UserResponseDataCopyWithImpl<$Res, _$UserResponseDataImpl>
    implements _$$UserResponseDataImplCopyWith<$Res> {
  __$$UserResponseDataImplCopyWithImpl(
    _$UserResponseDataImpl _value,
    $Res Function(_$UserResponseDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phone = null,
    Object? fullName = null,
  }) {
    return _then(
      _$UserResponseDataImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseDataImpl implements _UserResponseData {
  const _$UserResponseDataImpl({
    required this.id,
    required this.phone,
    @JsonKey(name: 'full_name') required this.fullName,
  });

  factory _$UserResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseDataImplFromJson(json);

  @override
  final int id;
  @override
  final String phone;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;

  @override
  String toString() {
    return 'UserResponseData(id: $id, phone: $phone, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, phone, fullName);

  /// Create a copy of UserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      __$$UserResponseDataImplCopyWithImpl<_$UserResponseDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseDataImplToJson(this);
  }
}

abstract class _UserResponseData implements UserResponseData {
  const factory _UserResponseData({
    required final int id,
    required final String phone,
    @JsonKey(name: 'full_name') required final String fullName,
  }) = _$UserResponseDataImpl;

  factory _UserResponseData.fromJson(Map<String, dynamic> json) =
      _$UserResponseDataImpl.fromJson;

  @override
  int get id;
  @override
  String get phone;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;

  /// Create a copy of UserResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResponseDataImplCopyWith<_$UserResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
