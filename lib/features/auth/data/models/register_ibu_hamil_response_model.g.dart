// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_ibu_hamil_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterIbuHamilResponseModelImpl
_$$RegisterIbuHamilResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$RegisterIbuHamilResponseModelImpl(
      ibuHamil: IbuHamilResponseData.fromJson(
        json['ibu_hamil'] as Map<String, dynamic>,
      ),
      user: UserResponseData.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$RegisterIbuHamilResponseModelImplToJson(
  _$RegisterIbuHamilResponseModelImpl instance,
) => <String, dynamic>{
  'ibu_hamil': instance.ibuHamil,
  'user': instance.user,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'message': instance.message,
};

_$IbuHamilResponseDataImpl _$$IbuHamilResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$IbuHamilResponseDataImpl(
  id: (json['id'] as num).toInt(),
  namaLengkap: json['nama_lengkap'] as String,
  nik: json['nik'] as String,
);

Map<String, dynamic> _$$IbuHamilResponseDataImplToJson(
  _$IbuHamilResponseDataImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nama_lengkap': instance.namaLengkap,
  'nik': instance.nik,
};

_$UserResponseDataImpl _$$UserResponseDataImplFromJson(
  Map<String, dynamic> json,
) => _$UserResponseDataImpl(
  id: (json['id'] as num).toInt(),
  phone: json['phone'] as String,
  fullName: json['full_name'] as String,
);

Map<String, dynamic> _$$UserResponseDataImplToJson(
  _$UserResponseDataImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'phone': instance.phone,
  'full_name': instance.fullName,
};
