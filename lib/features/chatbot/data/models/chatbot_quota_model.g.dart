// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_quota_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatbotQuotaModelImpl _$$ChatbotQuotaModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatbotQuotaModelImpl(
  usedToday: (json['used_today'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  remaining: (json['remaining'] as num).toInt(),
  resetsAt: DateTime.parse(json['resets_at'] as String),
);

Map<String, dynamic> _$$ChatbotQuotaModelImplToJson(
  _$ChatbotQuotaModelImpl instance,
) => <String, dynamic>{
  'used_today': instance.usedToday,
  'limit': instance.limit,
  'remaining': instance.remaining,
  'resets_at': instance.resetsAt.toIso8601String(),
};
