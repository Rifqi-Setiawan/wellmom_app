// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseModelImpl _$$LoginResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$LoginResponseModelImpl(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
  userId: (json['user_id'] as num).toInt(),
  ibuHamilId: (json['ibu_hamil_id'] as num).toInt(),
  namaLengkap: json['nama_lengkap'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$$LoginResponseModelImplToJson(
  _$LoginResponseModelImpl instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'user_id': instance.userId,
  'ibu_hamil_id': instance.ibuHamilId,
  'nama_lengkap': instance.namaLengkap,
  'email': instance.email,
};
