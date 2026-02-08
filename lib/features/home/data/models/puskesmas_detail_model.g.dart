// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puskesmas_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PuskesmasDetailModel _$PuskesmasDetailModelFromJson(
  Map<String, dynamic> json,
) => _PuskesmasDetailModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  buildingPhotoUrl: json['building_photo_url'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PuskesmasDetailModelToJson(
  _PuskesmasDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'building_photo_url': instance.buildingPhotoUrl,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
