/// Response from GET /kerabat/risk-status
class KerabatRiskStatusModel {
  final int ibuHamilId;
  final String ibuHamilName;
  final String? riskLevel;
  final DateTime? riskLevelSetAt;
  final String? message;
  final List<String> recommendations;

  const KerabatRiskStatusModel({
    required this.ibuHamilId,
    required this.ibuHamilName,
    this.riskLevel,
    this.riskLevelSetAt,
    this.message,
    this.recommendations = const [],
  });

  factory KerabatRiskStatusModel.fromJson(Map<String, dynamic> json) {
    final recs = json['recommendations'];
    return KerabatRiskStatusModel(
      ibuHamilId: (json['ibu_hamil_id'] as num?)?.toInt() ?? 0,
      ibuHamilName: json['ibu_hamil_name'] as String? ?? '',
      riskLevel: json['risk_level'] as String?,
      riskLevelSetAt: json['risk_level_set_at'] != null
          ? DateTime.tryParse(json['risk_level_set_at'] as String)
          : null,
      message: json['message'] as String?,
      recommendations: recs is List
          ? recs.map((e) => e.toString()).toList()
          : [],
    );
  }
}
