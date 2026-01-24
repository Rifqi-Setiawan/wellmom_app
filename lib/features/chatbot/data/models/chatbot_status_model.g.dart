// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatbotStatusModelImpl _$$ChatbotStatusModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatbotStatusModelImpl(
  isAvailable: json['is_available'] as bool,
  modelName: json['model_name'] as String?,
  apiKeyConfigured: json['api_key_configured'] as bool,
  error: json['error'] as String?,
);

Map<String, dynamic> _$$ChatbotStatusModelImplToJson(
  _$ChatbotStatusModelImpl instance,
) => <String, dynamic>{
  'is_available': instance.isAvailable,
  'model_name': instance.modelName,
  'api_key_configured': instance.apiKeyConfigured,
  'error': instance.error,
};
