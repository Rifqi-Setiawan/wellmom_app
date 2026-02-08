// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kerabat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KerabatModel _$KerabatModelFromJson(Map<String, dynamic> json) =>
    _KerabatModel(
      id: (json['id'] as num).toInt(),
      kerabatUserId: (json['kerabat_user_id'] as num).toInt(),
      ibuHamilId: (json['ibu_hamil_id'] as num).toInt(),
      relationType: json['relation_type'] as String,
      isPrimaryContact: json['is_primary_contact'] as bool? ?? false,
      canViewRecords: json['can_view_records'] as bool? ?? true,
      canReceiveNotifications:
          json['can_receive_notifications'] as bool? ?? true,
      inviteCode: json['invite_code'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$KerabatModelToJson(_KerabatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kerabat_user_id': instance.kerabatUserId,
      'ibu_hamil_id': instance.ibuHamilId,
      'relation_type': instance.relationType,
      'is_primary_contact': instance.isPrimaryContact,
      'can_view_records': instance.canViewRecords,
      'can_receive_notifications': instance.canReceiveNotifications,
      'invite_code': instance.inviteCode,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
