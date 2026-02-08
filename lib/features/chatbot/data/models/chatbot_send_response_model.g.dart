// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_send_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatbotSendResponseModel _$ChatbotSendResponseModelFromJson(
  Map<String, dynamic> json,
) => _ChatbotSendResponseModel(
  response: json['response'] as String,
  conversationId: (json['conversation_id'] as num).toInt(),
  quota: ChatbotQuotaModel.fromJson(json['quota'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatbotSendResponseModelToJson(
  _ChatbotSendResponseModel instance,
) => <String, dynamic>{
  'response': instance.response,
  'conversation_id': instance.conversationId,
  'quota': instance.quota,
};
