import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_status_model.freezed.dart';
part 'chatbot_status_model.g.dart';

/// Model for chatbot status from API
@freezed
abstract class ChatbotStatusModel with _$ChatbotStatusModel {
  const factory ChatbotStatusModel({
    @JsonKey(name: 'is_available') required bool isAvailable,
    @JsonKey(name: 'model_name') String? modelName,
    @JsonKey(name: 'api_key_configured') required bool apiKeyConfigured,
    String? error,
  }) = _ChatbotStatusModel;

  factory ChatbotStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ChatbotStatusModelFromJson(json);
}
