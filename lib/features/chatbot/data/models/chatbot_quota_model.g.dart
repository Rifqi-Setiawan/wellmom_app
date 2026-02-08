// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_quota_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatbotQuotaModel _$ChatbotQuotaModelFromJson(Map<String, dynamic> json) =>
    _ChatbotQuotaModel(
      usedToday: (json['used_today'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      remaining: (json['remaining'] as num).toInt(),
      resetsAt: DateTime.parse(json['resets_at'] as String),
    );

Map<String, dynamic> _$ChatbotQuotaModelToJson(_ChatbotQuotaModel instance) =>
    <String, dynamic>{
      'used_today': instance.usedToday,
      'limit': instance.limit,
      'remaining': instance.remaining,
      'resets_at': instance.resetsAt.toIso8601String(),
    };
