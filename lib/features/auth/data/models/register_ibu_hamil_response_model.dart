import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_ibu_hamil_response_model.freezed.dart';
part 'register_ibu_hamil_response_model.g.dart';

/// Response model for ibu hamil registration
/// Contains ibu_hamil, user, access_token, token_type, and message
@freezed
abstract class RegisterIbuHamilResponseModel with _$RegisterIbuHamilResponseModel {
  const factory RegisterIbuHamilResponseModel({
    @JsonKey(name: 'ibu_hamil') required IbuHamilResponseData ibuHamil,
    required UserResponseData user,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    required String message,
  }) = _RegisterIbuHamilResponseModel;

  factory RegisterIbuHamilResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterIbuHamilResponseModelFromJson(json);
}

/// Simplified ibu hamil data from registration response
@freezed
abstract class IbuHamilResponseData with _$IbuHamilResponseData {
  const factory IbuHamilResponseData({
    required int id,
    @JsonKey(name: 'nama_lengkap') required String namaLengkap,
    required String nik,
  }) = _IbuHamilResponseData;

  factory IbuHamilResponseData.fromJson(Map<String, dynamic> json) =>
      _$IbuHamilResponseDataFromJson(json);
}

/// User data from registration response
@freezed
abstract class UserResponseData with _$UserResponseData {
  const factory UserResponseData({
    required int id,
    required String phone,
    @JsonKey(name: 'full_name') required String fullName,
  }) = _UserResponseData;

  factory UserResponseData.fromJson(Map<String, dynamic> json) =>
      _$UserResponseDataFromJson(json);
}
