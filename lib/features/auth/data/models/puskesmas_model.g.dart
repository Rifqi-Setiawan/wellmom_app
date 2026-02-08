// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puskesmas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PuskesmasModel _$PuskesmasModelFromJson(Map<String, dynamic> json) =>
    _PuskesmasModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      registrationStatus: json['registration_status'] as String,
      isActive: json['is_active'] as bool? ?? true,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$PuskesmasModelToJson(_PuskesmasModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'registration_status': instance.registrationStatus,
      'is_active': instance.isActive,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };

_NearestPuskesmasModel _$NearestPuskesmasModelFromJson(
  Map<String, dynamic> json,
) => _NearestPuskesmasModel(
  puskesmas: PuskesmasModel.fromJson(json['puskesmas'] as Map<String, dynamic>),
  distanceKm: (json['distance_km'] as num).toDouble(),
  address: json['address'] as String,
);

Map<String, dynamic> _$NearestPuskesmasModelToJson(
  _NearestPuskesmasModel instance,
) => <String, dynamic>{
  'puskesmas': instance.puskesmas,
  'distance_km': instance.distanceKm,
  'address': instance.address,
};
