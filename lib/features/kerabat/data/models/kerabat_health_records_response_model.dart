/// Response from GET /kerabat/health-records?page=1&per_page=10
class KerabatHealthRecordsResponseModel {
  final int ibuHamilId;
  final String ibuHamilName;
  final List<KerabatHealthRecordItemModel> records;
  final int total;
  final int page;
  final int perPage;

  const KerabatHealthRecordsResponseModel({
    required this.ibuHamilId,
    required this.ibuHamilName,
    required this.records,
    required this.total,
    required this.page,
    required this.perPage,
  });

  factory KerabatHealthRecordsResponseModel.fromJson(Map<String, dynamic> json) {
    final list = json['records'];
    return KerabatHealthRecordsResponseModel(
      ibuHamilId: (json['ibu_hamil_id'] as num?)?.toInt() ?? 0,
      ibuHamilName: json['ibu_hamil_name'] as String? ?? '',
      records: list is List
          ? list
              .map((e) => KerabatHealthRecordItemModel.fromJson(
                    Map<String, dynamic>.from(e as Map),
                  ))
              .toList()
          : [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 10,
    );
  }
}

/// Single record in list or detail GET /kerabat/health-records/{id}
class KerabatHealthRecordItemModel {
  final int id;
  final int ibuHamilId;
  final String? checkupDate;
  final String? checkedBy;
  final int? bloodPressureSystolic;
  final int? bloodPressureDiastolic;
  final int? heartRate;
  final double? bodyTemperature;
  final double? weight;
  final String? complaints;
  final double? hemoglobin;
  final String? notes;

  const KerabatHealthRecordItemModel({
    required this.id,
    required this.ibuHamilId,
    this.checkupDate,
    this.checkedBy,
    this.bloodPressureSystolic,
    this.bloodPressureDiastolic,
    this.heartRate,
    this.bodyTemperature,
    this.weight,
    this.complaints,
    this.hemoglobin,
    this.notes,
  });

  factory KerabatHealthRecordItemModel.fromJson(Map<String, dynamic> json) {
    return KerabatHealthRecordItemModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      ibuHamilId: (json['ibu_hamil_id'] as num?)?.toInt() ?? 0,
      checkupDate: json['checkup_date'] as String?,
      checkedBy: json['checked_by'] as String?,
      bloodPressureSystolic: (json['blood_pressure_systolic'] as num?)?.toInt(),
      bloodPressureDiastolic:
          (json['blood_pressure_diastolic'] as num?)?.toInt(),
      heartRate: (json['heart_rate'] as num?)?.toInt(),
      bodyTemperature: (json['body_temperature'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      complaints: json['complaints'] as String?,
      hemoglobin: (json['hemoglobin'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );
  }
}
