// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) {
  return _LoginResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseModel {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ibu_hamil_id')
  int get ibuHamilId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this LoginResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseModelCopyWith<LoginResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseModelCopyWith<$Res> {
  factory $LoginResponseModelCopyWith(
    LoginResponseModel value,
    $Res Function(LoginResponseModel) then,
  ) = _$LoginResponseModelCopyWithImpl<$Res, LoginResponseModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'ibu_hamil_id') int ibuHamilId,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String email,
  });
}

/// @nodoc
class _$LoginResponseModelCopyWithImpl<$Res, $Val extends LoginResponseModel>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? userId = null,
    Object? ibuHamilId = null,
    Object? namaLengkap = null,
    Object? email = null,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenType: null == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            ibuHamilId: null == ibuHamilId
                ? _value.ibuHamilId
                : ibuHamilId // ignore: cast_nullable_to_non_nullable
                      as int,
            namaLengkap: null == namaLengkap
                ? _value.namaLengkap
                : namaLengkap // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginResponseModelImplCopyWith<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  factory _$$LoginResponseModelImplCopyWith(
    _$LoginResponseModelImpl value,
    $Res Function(_$LoginResponseModelImpl) then,
  ) = __$$LoginResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'ibu_hamil_id') int ibuHamilId,
    @JsonKey(name: 'nama_lengkap') String namaLengkap,
    String email,
  });
}

/// @nodoc
class __$$LoginResponseModelImplCopyWithImpl<$Res>
    extends _$LoginResponseModelCopyWithImpl<$Res, _$LoginResponseModelImpl>
    implements _$$LoginResponseModelImplCopyWith<$Res> {
  __$$LoginResponseModelImplCopyWithImpl(
    _$LoginResponseModelImpl _value,
    $Res Function(_$LoginResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? userId = null,
    Object? ibuHamilId = null,
    Object? namaLengkap = null,
    Object? email = null,
  }) {
    return _then(
      _$LoginResponseModelImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenType: null == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        ibuHamilId: null == ibuHamilId
            ? _value.ibuHamilId
            : ibuHamilId // ignore: cast_nullable_to_non_nullable
                  as int,
        namaLengkap: null == namaLengkap
            ? _value.namaLengkap
            : namaLengkap // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseModelImpl implements _LoginResponseModel {
  const _$LoginResponseModelImpl({
    @JsonKey(name: 'access_token') required this.accessToken,
    @JsonKey(name: 'token_type') required this.tokenType,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'ibu_hamil_id') required this.ibuHamilId,
    @JsonKey(name: 'nama_lengkap') required this.namaLengkap,
    required this.email,
  });

  factory _$LoginResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'ibu_hamil_id')
  final int ibuHamilId;
  @override
  @JsonKey(name: 'nama_lengkap')
  final String namaLengkap;
  @override
  final String email;

  @override
  String toString() {
    return 'LoginResponseModel(accessToken: $accessToken, tokenType: $tokenType, userId: $userId, ibuHamilId: $ibuHamilId, namaLengkap: $namaLengkap, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.ibuHamilId, ibuHamilId) ||
                other.ibuHamilId == ibuHamilId) &&
            (identical(other.namaLengkap, namaLengkap) ||
                other.namaLengkap == namaLengkap) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accessToken,
    tokenType,
    userId,
    ibuHamilId,
    namaLengkap,
    email,
  );

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseModelImplCopyWith<_$LoginResponseModelImpl> get copyWith =>
      __$$LoginResponseModelImplCopyWithImpl<_$LoginResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseModelImplToJson(this);
  }
}

abstract class _LoginResponseModel implements LoginResponseModel {
  const factory _LoginResponseModel({
    @JsonKey(name: 'access_token') required final String accessToken,
    @JsonKey(name: 'token_type') required final String tokenType,
    @JsonKey(name: 'user_id') required final int userId,
    @JsonKey(name: 'ibu_hamil_id') required final int ibuHamilId,
    @JsonKey(name: 'nama_lengkap') required final String namaLengkap,
    required final String email,
  }) = _$LoginResponseModelImpl;

  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) =
      _$LoginResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'ibu_hamil_id')
  int get ibuHamilId;
  @override
  @JsonKey(name: 'nama_lengkap')
  String get namaLengkap;
  @override
  String get email;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseModelImplCopyWith<_$LoginResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
