import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_quota_model.dart';

part 'chatbot_send_response_model.freezed.dart';
part 'chatbot_send_response_model.g.dart';

/// Model for send message response from API
@freezed
abstract class ChatbotSendResponseModel with _$ChatbotSendResponseModel {
  const factory ChatbotSendResponseModel({
    required String response,
    @JsonKey(name: 'conversation_id') required int conversationId,
    required ChatbotQuotaModel quota,
  }) = _ChatbotSendResponseModel;

  factory ChatbotSendResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotSendResponseModelFromJson(json);
}
