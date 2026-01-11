import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_quota_model.freezed.dart';
part 'chatbot_quota_model.g.dart';

/// Model for chatbot quota from API
@freezed
class ChatbotQuotaModel with _$ChatbotQuotaModel {
  const factory ChatbotQuotaModel({
    @JsonKey(name: 'used_today') required int usedToday,
    required int limit,
    required int remaining,
    @JsonKey(name: 'resets_at') required DateTime resetsAt,
  }) = _ChatbotQuotaModel;

  factory ChatbotQuotaModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotQuotaModelFromJson(json);
}
