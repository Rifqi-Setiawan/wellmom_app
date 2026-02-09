/// Single message (GET /chat/conversations/{id}/messages)
/// Backend menggunakan field "sender_role" bukan "sender_type"
class ChatMessageModel {
  final int id;
  final int conversationId;
  final String senderRole; // 'ibu_hamil' | 'perawat' (dari backend: sender_role)
  final String messageText;
  final DateTime createdAt;
  final bool isRead;
  final int? senderUserId; // Optional: sender_user_id dari backend
  final String? senderName; // Optional: sender_name dari backend

  const ChatMessageModel({
    required this.id,
    required this.conversationId,
    required this.senderRole,
    required this.messageText,
    required this.createdAt,
    this.isRead = false,
    this.senderUserId,
    this.senderName,
  });

  /// Check if message is from ibu hamil (current logged-in user)
  bool get isFromIbuHamil => senderRole.toLowerCase().trim() == 'ibu_hamil';

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    // Parse sender_role (backend menggunakan "sender_role" bukan "sender_type")
    // Normalize to lowercase and trim whitespace
    final senderRoleRaw = json['sender_role'] as String?;
    final senderRole = senderRoleRaw?.toLowerCase().trim() ?? 'perawat';
    
    return ChatMessageModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      conversationId: (json['conversation_id'] as num?)?.toInt() ?? 0,
      senderRole: senderRole, // Normalized to lowercase
      messageText: json['message_text'] as String? ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String) ?? DateTime.now()
          : DateTime.now(),
      isRead: json['is_read'] as bool? ?? false,
      senderUserId: (json['sender_user_id'] as num?)?.toInt(),
      senderName: json['sender_name'] as String?,
    );
  }
}
