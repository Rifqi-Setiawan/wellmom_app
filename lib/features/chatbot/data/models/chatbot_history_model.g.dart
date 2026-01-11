// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatbotHistoryModelImpl _$$ChatbotHistoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatbotHistoryModelImpl(
  conversation: ChatbotConversationModel.fromJson(
    json['conversation'] as Map<String, dynamic>,
  ),
  messages: (json['messages'] as List<dynamic>)
      .map((e) => ChatbotMessageModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ChatbotHistoryModelImplToJson(
  _$ChatbotHistoryModelImpl instance,
) => <String, dynamic>{
  'conversation': instance.conversation,
  'messages': instance.messages,
};
