// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatbotHistoryModel _$ChatbotHistoryModelFromJson(Map<String, dynamic> json) =>
    _ChatbotHistoryModel(
      conversation: ChatbotConversationModel.fromJson(
        json['conversation'] as Map<String, dynamic>,
      ),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatbotMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatbotHistoryModelToJson(
  _ChatbotHistoryModel instance,
) => <String, dynamic>{
  'conversation': instance.conversation,
  'messages': instance.messages,
};
