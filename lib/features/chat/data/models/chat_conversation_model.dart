/// One conversation in list (GET /chat/conversations)
class ChatConversationModel {
  final int id;
  final int? perawatId;
  final String? perawatName;
  final String? perawatPhotoUrl;
  final String? lastMessageText;
  final DateTime? lastMessageAt;
  final int unreadCount;
  final bool? isAssigned;

  const ChatConversationModel({
    required this.id,
    this.perawatId,
    this.perawatName,
    this.perawatPhotoUrl,
    this.lastMessageText,
    this.lastMessageAt,
    this.unreadCount = 0,
    this.isAssigned,
  });

  factory ChatConversationModel.fromJson(Map<String, dynamic> json) {
    return ChatConversationModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      perawatId: (json['perawat_id'] as num?)?.toInt(),
      perawatName: json['perawat_name'] as String?,
      perawatPhotoUrl: json['perawat_photo_url'] as String?,
      lastMessageText: json['last_message_text'] as String?,
      lastMessageAt: json['last_message_at'] != null
          ? DateTime.tryParse(json['last_message_at'] as String)
          : null,
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      isAssigned: json['is_assigned'] as bool?,
    );
  }
}
