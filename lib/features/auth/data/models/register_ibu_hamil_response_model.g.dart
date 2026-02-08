// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_ibu_hamil_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterIbuHamilResponseModel _$RegisterIbuHamilResponseModelFromJson(
  Map<String, dynamic> json,
) => _RegisterIbuHamilResponseModel(
  ibuHamil: IbuHamilResponseData.fromJson(
    json['ibu_hamil'] as Map<String, dynamic>,
  ),
  user: UserResponseData.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$RegisterIbuHamilResponseModelToJson(
  _RegisterIbuHamilResponseModel instance,
) => <String, dynamic>{
  'ibu_hamil': instance.ibuHamil,
  'user': instance.user,
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'message': instance.message,
};

_IbuHamilResponseData _$IbuHamilResponseDataFromJson(
  Map<String, dynamic> json,
) => _IbuHamilResponseData(
  id: (json['id'] as num).toInt(),
  namaLengkap: json['nama_lengkap'] as String,
  nik: json['nik'] as String,
);

Map<String, dynamic> _$IbuHamilResponseDataToJson(
  _IbuHamilResponseData instance,
) => <String, dynamic>{
  'id': instance.id,
  'nama_lengkap': instance.namaLengkap,
  'nik': instance.nik,
};

_UserResponseData _$UserResponseDataFromJson(Map<String, dynamic> json) =>
    _UserResponseData(
      id: (json['id'] as num).toInt(),
      phone: json['phone'] as String,
      fullName: json['full_name'] as String,
    );

Map<String, dynamic> _$UserResponseDataToJson(_UserResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'full_name': instance.fullName,
    };
