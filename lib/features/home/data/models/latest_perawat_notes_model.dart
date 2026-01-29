class LatestPerawatNotesModel {
  final bool hasNotes;
  final String? notes;
  final DateTime? checkupDate;
  final int? perawatId;
  final int? healthRecordId;
  final String? message;

  const LatestPerawatNotesModel({
    required this.hasNotes,
    this.notes,
    this.checkupDate,
    this.perawatId,
    this.healthRecordId,
    this.message,
  });

  factory LatestPerawatNotesModel.fromJson(Map<String, dynamic> json) {
    final checkupDateRaw = json['checkup_date'] as String?;
    DateTime? parsedDate;
    if (checkupDateRaw != null && checkupDateRaw.isNotEmpty) {
      parsedDate = DateTime.tryParse(checkupDateRaw);
    }

    return LatestPerawatNotesModel(
      hasNotes: json['has_notes'] == true,
      notes: json['notes'] as String?,
      checkupDate: parsedDate,
      perawatId: (json['perawat_id'] as num?)?.toInt(),
      healthRecordId: (json['health_record_id'] as num?)?.toInt(),
      message: json['message'] as String?,
    );
  }
}
