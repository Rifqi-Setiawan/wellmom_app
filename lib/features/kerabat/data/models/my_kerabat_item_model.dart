/// Item from GET /kerabat/my-kerabat and response of complete-profile
class MyKerabatItemModel {
  final int id;
  final int? kerabatUserId;
  final int ibuHamilId;
  final String? relationType;
  final bool canViewRecords;
  final bool canReceiveNotifications;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MyKerabatItemModel({
    required this.id,
    this.kerabatUserId,
    required this.ibuHamilId,
    this.relationType,
    this.canViewRecords = true,
    this.canReceiveNotifications = true,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyKerabatItemModel.fromJson(Map<String, dynamic> json) {
    return MyKerabatItemModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      kerabatUserId: (json['kerabat_user_id'] as num?)?.toInt(),
      ibuHamilId: (json['ibu_hamil_id'] as num?)?.toInt() ?? 0,
      relationType: json['relation_type'] as String?,
      canViewRecords: json['can_view_records'] as bool? ?? true,
      canReceiveNotifications:
          json['can_receive_notifications'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : DateTime.now(),
    );
  }
}
