// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kerabat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KerabatModel _$KerabatModelFromJson(Map<String, dynamic> json) {
  return _KerabatModel.fromJson(json);
}

/// @nodoc
mixin _$KerabatModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'kerabat_user_id')
  int get kerabatUserId => throw _privateConstructorUsedError; // user_id dari kerabat
  @JsonKey(name: 'ibu_hamil_id')
  int get ibuHamilId => throw _privateConstructorUsedError; // foreign key ke ibu hamil
  @JsonKey(name: 'relation_type')
  String get relationType => throw _privateConstructorUsedError; // 'Suami', 'Kakak', 'Ibu', etc.
  @JsonKey(name: 'is_primary_contact')
  bool get isPrimaryContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_view_records')
  bool get canViewRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_receive_notifications')
  bool get canReceiveNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'invite_code')
  String? get inviteCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this KerabatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KerabatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KerabatModelCopyWith<KerabatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KerabatModelCopyWith<$Res> {
  factory $KerabatModelCopyWith(
    KerabatModel value,
    $Res Function(KerabatModel) then,
  ) = _$KerabatModelCopyWithImpl<$Res, KerabatModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'kerabat_user_id') int kerabatUserId,
    @JsonKey(name: 'ibu_hamil_id') int ibuHamilId,
    @JsonKey(name: 'relation_type') String relationType,
    @JsonKey(name: 'is_primary_contact') bool isPrimaryContact,
    @JsonKey(name: 'can_view_records') bool canViewRecords,
    @JsonKey(name: 'can_receive_notifications') bool canReceiveNotifications,
    @JsonKey(name: 'invite_code') String? inviteCode,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$KerabatModelCopyWithImpl<$Res, $Val extends KerabatModel>
    implements $KerabatModelCopyWith<$Res> {
  _$KerabatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KerabatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kerabatUserId = null,
    Object? ibuHamilId = null,
    Object? relationType = null,
    Object? isPrimaryContact = null,
    Object? canViewRecords = null,
    Object? canReceiveNotifications = null,
    Object? inviteCode = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            kerabatUserId: null == kerabatUserId
                ? _value.kerabatUserId
                : kerabatUserId // ignore: cast_nullable_to_non_nullable
                      as int,
            ibuHamilId: null == ibuHamilId
                ? _value.ibuHamilId
                : ibuHamilId // ignore: cast_nullable_to_non_nullable
                      as int,
            relationType: null == relationType
                ? _value.relationType
                : relationType // ignore: cast_nullable_to_non_nullable
                      as String,
            isPrimaryContact: null == isPrimaryContact
                ? _value.isPrimaryContact
                : isPrimaryContact // ignore: cast_nullable_to_non_nullable
                      as bool,
            canViewRecords: null == canViewRecords
                ? _value.canViewRecords
                : canViewRecords // ignore: cast_nullable_to_non_nullable
                      as bool,
            canReceiveNotifications: null == canReceiveNotifications
                ? _value.canReceiveNotifications
                : canReceiveNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            inviteCode: freezed == inviteCode
                ? _value.inviteCode
                : inviteCode // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$KerabatModelImplCopyWith<$Res>
    implements $KerabatModelCopyWith<$Res> {
  factory _$$KerabatModelImplCopyWith(
    _$KerabatModelImpl value,
    $Res Function(_$KerabatModelImpl) then,
  ) = __$$KerabatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'kerabat_user_id') int kerabatUserId,
    @JsonKey(name: 'ibu_hamil_id') int ibuHamilId,
    @JsonKey(name: 'relation_type') String relationType,
    @JsonKey(name: 'is_primary_contact') bool isPrimaryContact,
    @JsonKey(name: 'can_view_records') bool canViewRecords,
    @JsonKey(name: 'can_receive_notifications') bool canReceiveNotifications,
    @JsonKey(name: 'invite_code') String? inviteCode,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$KerabatModelImplCopyWithImpl<$Res>
    extends _$KerabatModelCopyWithImpl<$Res, _$KerabatModelImpl>
    implements _$$KerabatModelImplCopyWith<$Res> {
  __$$KerabatModelImplCopyWithImpl(
    _$KerabatModelImpl _value,
    $Res Function(_$KerabatModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KerabatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kerabatUserId = null,
    Object? ibuHamilId = null,
    Object? relationType = null,
    Object? isPrimaryContact = null,
    Object? canViewRecords = null,
    Object? canReceiveNotifications = null,
    Object? inviteCode = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$KerabatModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        kerabatUserId: null == kerabatUserId
            ? _value.kerabatUserId
            : kerabatUserId // ignore: cast_nullable_to_non_nullable
                  as int,
        ibuHamilId: null == ibuHamilId
            ? _value.ibuHamilId
            : ibuHamilId // ignore: cast_nullable_to_non_nullable
                  as int,
        relationType: null == relationType
            ? _value.relationType
            : relationType // ignore: cast_nullable_to_non_nullable
                  as String,
        isPrimaryContact: null == isPrimaryContact
            ? _value.isPrimaryContact
            : isPrimaryContact // ignore: cast_nullable_to_non_nullable
                  as bool,
        canViewRecords: null == canViewRecords
            ? _value.canViewRecords
            : canViewRecords // ignore: cast_nullable_to_non_nullable
                  as bool,
        canReceiveNotifications: null == canReceiveNotifications
            ? _value.canReceiveNotifications
            : canReceiveNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        inviteCode: freezed == inviteCode
            ? _value.inviteCode
            : inviteCode // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$KerabatModelImpl implements _KerabatModel {
  const _$KerabatModelImpl({
    required this.id,
    @JsonKey(name: 'kerabat_user_id') required this.kerabatUserId,
    @JsonKey(name: 'ibu_hamil_id') required this.ibuHamilId,
    @JsonKey(name: 'relation_type') required this.relationType,
    @JsonKey(name: 'is_primary_contact') this.isPrimaryContact = false,
    @JsonKey(name: 'can_view_records') this.canViewRecords = true,
    @JsonKey(name: 'can_receive_notifications')
    this.canReceiveNotifications = true,
    @JsonKey(name: 'invite_code') this.inviteCode,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$KerabatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KerabatModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'kerabat_user_id')
  final int kerabatUserId;
  // user_id dari kerabat
  @override
  @JsonKey(name: 'ibu_hamil_id')
  final int ibuHamilId;
  // foreign key ke ibu hamil
  @override
  @JsonKey(name: 'relation_type')
  final String relationType;
  // 'Suami', 'Kakak', 'Ibu', etc.
  @override
  @JsonKey(name: 'is_primary_contact')
  final bool isPrimaryContact;
  @override
  @JsonKey(name: 'can_view_records')
  final bool canViewRecords;
  @override
  @JsonKey(name: 'can_receive_notifications')
  final bool canReceiveNotifications;
  @override
  @JsonKey(name: 'invite_code')
  final String? inviteCode;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'KerabatModel(id: $id, kerabatUserId: $kerabatUserId, ibuHamilId: $ibuHamilId, relationType: $relationType, isPrimaryContact: $isPrimaryContact, canViewRecords: $canViewRecords, canReceiveNotifications: $canReceiveNotifications, inviteCode: $inviteCode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KerabatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kerabatUserId, kerabatUserId) ||
                other.kerabatUserId == kerabatUserId) &&
            (identical(other.ibuHamilId, ibuHamilId) ||
                other.ibuHamilId == ibuHamilId) &&
            (identical(other.relationType, relationType) ||
                other.relationType == relationType) &&
            (identical(other.isPrimaryContact, isPrimaryContact) ||
                other.isPrimaryContact == isPrimaryContact) &&
            (identical(other.canViewRecords, canViewRecords) ||
                other.canViewRecords == canViewRecords) &&
            (identical(
                  other.canReceiveNotifications,
                  canReceiveNotifications,
                ) ||
                other.canReceiveNotifications == canReceiveNotifications) &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
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
    kerabatUserId,
    ibuHamilId,
    relationType,
    isPrimaryContact,
    canViewRecords,
    canReceiveNotifications,
    inviteCode,
    createdAt,
    updatedAt,
  );

  /// Create a copy of KerabatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KerabatModelImplCopyWith<_$KerabatModelImpl> get copyWith =>
      __$$KerabatModelImplCopyWithImpl<_$KerabatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KerabatModelImplToJson(this);
  }
}

abstract class _KerabatModel implements KerabatModel {
  const factory _KerabatModel({
    required final int id,
    @JsonKey(name: 'kerabat_user_id') required final int kerabatUserId,
    @JsonKey(name: 'ibu_hamil_id') required final int ibuHamilId,
    @JsonKey(name: 'relation_type') required final String relationType,
    @JsonKey(name: 'is_primary_contact') final bool isPrimaryContact,
    @JsonKey(name: 'can_view_records') final bool canViewRecords,
    @JsonKey(name: 'can_receive_notifications')
    final bool canReceiveNotifications,
    @JsonKey(name: 'invite_code') final String? inviteCode,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$KerabatModelImpl;

  factory _KerabatModel.fromJson(Map<String, dynamic> json) =
      _$KerabatModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'kerabat_user_id')
  int get kerabatUserId; // user_id dari kerabat
  @override
  @JsonKey(name: 'ibu_hamil_id')
  int get ibuHamilId; // foreign key ke ibu hamil
  @override
  @JsonKey(name: 'relation_type')
  String get relationType; // 'Suami', 'Kakak', 'Ibu', etc.
  @override
  @JsonKey(name: 'is_primary_contact')
  bool get isPrimaryContact;
  @override
  @JsonKey(name: 'can_view_records')
  bool get canViewRecords;
  @override
  @JsonKey(name: 'can_receive_notifications')
  bool get canReceiveNotifications;
  @override
  @JsonKey(name: 'invite_code')
  String? get inviteCode;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of KerabatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KerabatModelImplCopyWith<_$KerabatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
