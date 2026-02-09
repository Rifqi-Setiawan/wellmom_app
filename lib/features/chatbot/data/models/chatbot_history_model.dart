import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_conversation_model.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_message_model.dart';

part 'chatbot_history_model.freezed.dart';
part 'chatbot_history_model.g.dart';

/// Model for conversation history from API
@freezed
abstract class ChatbotHistoryModel with _$ChatbotHistoryModel {
  const factory ChatbotHistoryModel({
    required ChatbotConversationModel conversation,
    required List<ChatbotMessageModel> messages,
  }) = _ChatbotHistoryModel;

  factory ChatbotHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotHistoryModelFromJson(json);
}
