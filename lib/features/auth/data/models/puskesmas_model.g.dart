// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puskesmas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PuskesmasModelImpl _$$PuskesmasModelImplFromJson(Map<String, dynamic> json) =>
    _$PuskesmasModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      registrationStatus: json['registration_status'] as String,
      isActive: json['is_active'] as bool? ?? true,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$PuskesmasModelImplToJson(
  _$PuskesmasModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'registration_status': instance.registrationStatus,
  'is_active': instance.isActive,
  'phone': instance.phone,
  'email': instance.email,
  'address': instance.address,
};

_$NearestPuskesmasModelImpl _$$NearestPuskesmasModelImplFromJson(
  Map<String, dynamic> json,
) => _$NearestPuskesmasModelImpl(
  puskesmas: PuskesmasModel.fromJson(json['puskesmas'] as Map<String, dynamic>),
  distanceKm: (json['distance_km'] as num).toDouble(),
  address: json['address'] as String,
);

Map<String, dynamic> _$$NearestPuskesmasModelImplToJson(
  _$NearestPuskesmasModelImpl instance,
) => <String, dynamic>{
  'puskesmas': instance.puskesmas,
  'distance_km': instance.distanceKm,
  'address': instance.address,
};
