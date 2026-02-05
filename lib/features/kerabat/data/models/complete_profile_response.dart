import 'package:wellmom_app/features/kerabat/data/models/my_kerabat_item_model.dart';

/// Response from POST /kerabat/complete-profile
/// Contains kerabat data and optionally a new access token if phone was updated
class CompleteProfileResponse {
  final MyKerabatItemModel kerabat;
  final String? accessToken;
  final String? tokenType;
  final String? message;

  const CompleteProfileResponse({
    required this.kerabat,
    this.accessToken,
    this.tokenType,
    this.message,
  });

  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) {
    // Response structure:
    // {
    //   "kerabat": { ... },  // MyKerabatItemModel data
    //   "access_token": "..." | null,  // New token if phone was updated
    //   "token_type": "bearer",
    //   "message": "..."
    // }
    
    final kerabatData = json['kerabat'];
    if (kerabatData == null || kerabatData is! Map<String, dynamic>) {
      throw FormatException('Missing or invalid "kerabat" field in response');
    }

    return CompleteProfileResponse(
      kerabat: MyKerabatItemModel.fromJson(kerabatData),
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      message: json['message'] as String?,
    );
  }
}
