import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_message_model.freezed.dart';
part 'chatbot_message_model.g.dart';

/// Model for chatbot message from API
@freezed
abstract class ChatbotMessageModel with _$ChatbotMessageModel {
  const factory ChatbotMessageModel({
    required int id,
    required String role, // "user" or "assistant"
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ChatbotMessageModel;

  factory ChatbotMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotMessageModelFromJson(json);
}
