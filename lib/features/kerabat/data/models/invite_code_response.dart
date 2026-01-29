/// Response from POST /kerabat/generate-invite
class InviteCodeResponse {
  final String inviteCode;
  final DateTime expiresAt;
  final int ibuHamilId;

  const InviteCodeResponse({
    required this.inviteCode,
    required this.expiresAt,
    required this.ibuHamilId,
  });

  factory InviteCodeResponse.fromJson(Map<String, dynamic> json) {
    return InviteCodeResponse(
      inviteCode: json['invite_code'] as String? ?? '',
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'] as String)
          : DateTime.now().add(const Duration(hours: 24)),
      ibuHamilId: (json['ibu_hamil_id'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'invite_code': inviteCode,
        'expires_at': expiresAt.toIso8601String(),
        'ibu_hamil_id': ibuHamilId,
      };
}
