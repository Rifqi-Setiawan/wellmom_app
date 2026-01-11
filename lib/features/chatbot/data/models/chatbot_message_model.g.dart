// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatbotMessageModelImpl _$$ChatbotMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatbotMessageModelImpl(
  id: (json['id'] as num).toInt(),
  role: json['role'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$ChatbotMessageModelImplToJson(
  _$ChatbotMessageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'role': instance.role,
  'content': instance.content,
  'created_at': instance.createdAt.toIso8601String(),
};
