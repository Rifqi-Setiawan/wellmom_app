// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatbotStatusModel _$ChatbotStatusModelFromJson(Map<String, dynamic> json) =>
    _ChatbotStatusModel(
      isAvailable: json['is_available'] as bool,
      modelName: json['model_name'] as String?,
      apiKeyConfigured: json['api_key_configured'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ChatbotStatusModelToJson(_ChatbotStatusModel instance) =>
    <String, dynamic>{
      'is_available': instance.isAvailable,
      'model_name': instance.modelName,
      'api_key_configured': instance.apiKeyConfigured,
      'error': instance.error,
    };
