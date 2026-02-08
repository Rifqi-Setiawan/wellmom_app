// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatbotConversationModel _$ChatbotConversationModelFromJson(
  Map<String, dynamic> json,
) => _ChatbotConversationModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  messageCount: (json['message_count'] as num).toInt(),
);

Map<String, dynamic> _$ChatbotConversationModelToJson(
  _ChatbotConversationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'message_count': instance.messageCount,
};
