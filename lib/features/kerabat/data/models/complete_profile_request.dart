/// Request body for POST /kerabat/complete-profile
class CompleteProfileRequest {
  final String fullName;
  final String relationType;
  final String? phone;

  const CompleteProfileRequest({
    required this.fullName,
    required this.relationType,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'full_name': fullName,
      'relation_type': relationType,
    };
    if (phone != null && phone!.isNotEmpty) {
      map['phone'] = phone;
    }
    return map;
  }
}
