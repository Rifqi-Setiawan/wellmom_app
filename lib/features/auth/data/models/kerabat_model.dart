import 'package:freezed_annotation/freezed_annotation.dart';

part 'kerabat_model.freezed.dart';
part 'kerabat_model.g.dart';

/// Kerabat model for family/relative relationships
@freezed
class KerabatModel with _$KerabatModel {
  const factory KerabatModel({
    required int id,
    @JsonKey(name: 'kerabat_user_id') required int kerabatUserId, // user_id dari kerabat
    @JsonKey(name: 'ibu_hamil_id') required int ibuHamilId, // foreign key ke ibu hamil
    @JsonKey(name: 'relation_type')
        required String relationType, // 'Suami', 'Kakak', 'Ibu', etc.
    @JsonKey(name: 'is_primary_contact')
        @Default(false)
        bool isPrimaryContact,
    @JsonKey(name: 'can_view_records') @Default(true) bool canViewRecords,
    @JsonKey(name: 'can_receive_notifications')
        @Default(true)
        bool canReceiveNotifications,
    @JsonKey(name: 'invite_code') String? inviteCode,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _KerabatModel;

  factory KerabatModel.fromJson(Map<String, dynamic> json) =>
      _$KerabatModelFromJson(json);
}
