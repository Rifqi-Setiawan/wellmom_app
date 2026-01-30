/// Response from GET /kerabat/me
class KerabatMeModel {
  final int id;
  final int? userId;
  final String fullName;
  final String? phone;
  final String relationType;
  final int ibuHamilId;
  final String ibuHamilName;
  final bool canViewRecords;
  final bool canReceiveNotifications;
  final DateTime? createdAt;

  const KerabatMeModel({
    required this.id,
    this.userId,
    required this.fullName,
    this.phone,
    required this.relationType,
    required this.ibuHamilId,
    required this.ibuHamilName,
    this.canViewRecords = true,
    this.canReceiveNotifications = true,
    this.createdAt,
  });

  factory KerabatMeModel.fromJson(Map<String, dynamic> json) {
    return KerabatMeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt(),
      fullName: json['full_name'] as String? ?? '',
      phone: json['phone'] as String?,
      relationType: json['relation_type'] as String? ?? '',
      ibuHamilId: (json['ibu_hamil_id'] as num?)?.toInt() ?? 0,
      ibuHamilName: json['ibu_hamil_name'] as String? ?? '',
      canViewRecords: json['can_view_records'] as bool? ?? true,
      canReceiveNotifications:
          json['can_receive_notifications'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
    );
  }
}
