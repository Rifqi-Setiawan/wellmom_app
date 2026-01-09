import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User model for authentication and user management
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    String? email,
    required String phone, // E.164 format
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'role') required String role, // 'ibu_hamil' or 'kerabat'
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
