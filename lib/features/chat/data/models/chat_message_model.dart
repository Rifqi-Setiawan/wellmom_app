/// Single message (GET /chat/conversations/{id}/messages)
class ChatMessageModel {
  final int id;
  final int conversationId;
  final String senderType; // 'ibu_hamil' | 'perawat'
  final String messageText;
  final DateTime createdAt;
  final bool isRead;

  const ChatMessageModel({
    required this.id,
    required this.conversationId,
    required this.senderType,
    required this.messageText,
    required this.createdAt,
    this.isRead = false,
  });

  bool get isFromIbuHamil => senderType == 'ibu_hamil';

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      conversationId: (json['conversation_id'] as num?)?.toInt() ?? 0,
      senderType: json['sender_type'] as String? ?? 'perawat',
      messageText: json['message_text'] as String? ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String) ?? DateTime.now()
          : DateTime.now(),
      isRead: json['is_read'] as bool? ?? false,
    );
  }
}
