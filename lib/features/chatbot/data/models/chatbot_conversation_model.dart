import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_conversation_model.freezed.dart';
part 'chatbot_conversation_model.g.dart';

/// Model for chatbot conversation from API
@freezed
class ChatbotConversationModel with _$ChatbotConversationModel {
  const factory ChatbotConversationModel({
    required int id,
    required String title,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'message_count') required int messageCount,
  }) = _ChatbotConversationModel;

  factory ChatbotConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotConversationModelFromJson(json);
}
