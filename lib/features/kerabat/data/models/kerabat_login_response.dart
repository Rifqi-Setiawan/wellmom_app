/// Response from POST /kerabat/login-with-invite
class KerabatLoginResponse {
  final String accessToken;
  final String tokenType;
  final int kerabatId;
  final int ibuHamilId;
  final String ibuHamilName;
  final bool requiresProfileCompletion;

  const KerabatLoginResponse({
    required this.accessToken,
    this.tokenType = 'bearer',
    required this.kerabatId,
    required this.ibuHamilId,
    required this.ibuHamilName,
    this.requiresProfileCompletion = false,
  });

  factory KerabatLoginResponse.fromJson(Map<String, dynamic> json) {
    final rawToken = json['access_token'] ?? json['accessToken'];
    final accessToken = rawToken is String ? rawToken : '';
    return KerabatLoginResponse(
      accessToken: accessToken,
      tokenType: json['token_type'] as String? ?? 'bearer',
      kerabatId: (json['kerabat_id'] as num?)?.toInt() ?? 0,
      ibuHamilId: (json['ibu_hamil_id'] as num?)?.toInt() ?? 0,
      ibuHamilName: json['ibu_hamil_name'] as String? ?? '',
      requiresProfileCompletion:
          json['requires_profile_completion'] as bool? ?? false,
    );
  }
}
