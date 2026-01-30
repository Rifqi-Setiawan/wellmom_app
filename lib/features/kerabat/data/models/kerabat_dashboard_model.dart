/// Response from GET /kerabat/dashboard
class KerabatDashboardModel {
  final int kerabatId;
  final String kerabatName;
  final String relationType;
  final KerabatDashboardIbuHamil ibuHamil;
  final KerabatDashboardHealthRecord? latestHealthRecord;
  final KerabatDashboardEmergencyContact? emergencyContact;
  final int unreadNotificationsCount;
  final String? riskAlert;

  const KerabatDashboardModel({
    required this.kerabatId,
    required this.kerabatName,
    required this.relationType,
    required this.ibuHamil,
    this.latestHealthRecord,
    this.emergencyContact,
    this.unreadNotificationsCount = 0,
    this.riskAlert,
  });

  factory KerabatDashboardModel.fromJson(Map<String, dynamic> json) {
    return KerabatDashboardModel(
      kerabatId: (json['kerabat_id'] as num?)?.toInt() ?? 0,
      kerabatName: json['kerabat_name'] as String? ?? '',
      relationType: json['relation_type'] as String? ?? '',
      ibuHamil: KerabatDashboardIbuHamil.fromJson(
        json['ibu_hamil'] is Map
            ? Map<String, dynamic>.from(json['ibu_hamil'] as Map)
            : {},
      ),
      latestHealthRecord: json['latest_health_record'] != null
          ? KerabatDashboardHealthRecord.fromJson(
              Map<String, dynamic>.from(json['latest_health_record'] as Map),
            )
          : null,
      emergencyContact: json['emergency_contact'] != null
          ? KerabatDashboardEmergencyContact.fromJson(
              Map<String, dynamic>.from(json['emergency_contact'] as Map),
            )
          : null,
      unreadNotificationsCount:
          (json['unread_notifications_count'] as num?)?.toInt() ?? 0,
      riskAlert: json['risk_alert'] as String?,
    );
  }
}

class KerabatDashboardIbuHamil {
  final int id;
  final String namaLengkap;
  final int? usiaKehamilanMinggu;
  final int? usiaKehamilanHari;
  final DateTime? tanggalHpht;
  final DateTime? tanggalTaksiranPersalinan;
  final String? riskLevel;
  final DateTime? riskLevelSetAt;
  final String? golonganDarah;

  KerabatDashboardIbuHamil({
    required this.id,
    required this.namaLengkap,
    this.usiaKehamilanMinggu,
    this.usiaKehamilanHari,
    this.tanggalHpht,
    this.tanggalTaksiranPersalinan,
    this.riskLevel,
    this.riskLevelSetAt,
    this.golonganDarah,
  });

  factory KerabatDashboardIbuHamil.fromJson(Map<String, dynamic> json) {
    return KerabatDashboardIbuHamil(
      id: (json['id'] as num?)?.toInt() ?? 0,
      namaLengkap: json['nama_lengkap'] as String? ?? '',
      usiaKehamilanMinggu: (json['usia_kehamilan_minggu'] as num?)?.toInt(),
      usiaKehamilanHari: (json['usia_kehamilan_hari'] as num?)?.toInt(),
      tanggalHpht: json['tanggal_hpht'] != null
          ? DateTime.tryParse(json['tanggal_hpht'] as String)
          : null,
      tanggalTaksiranPersalinan:
          json['tanggal_taksiran_persalinan'] != null
              ? DateTime.tryParse(json['tanggal_taksiran_persalinan'] as String)
              : null,
      riskLevel: json['risk_level'] as String?,
      riskLevelSetAt: json['risk_level_set_at'] != null
          ? DateTime.tryParse(json['risk_level_set_at'] as String)
          : null,
      golonganDarah: json['golongan_darah'] as String?,
    );
  }
}

class KerabatDashboardHealthRecord {
  final int id;
  final DateTime? checkupDate;
  final int? bloodPressureSystolic;
  final int? bloodPressureDiastolic;
  final int? heartRate;
  final double? bodyTemperature;
  final double? weight;
  final String? complaints;
  final String? checkedBy;
  final String? notes;

  KerabatDashboardHealthRecord({
    required this.id,
    this.checkupDate,
    this.bloodPressureSystolic,
    this.bloodPressureDiastolic,
    this.heartRate,
    this.bodyTemperature,
    this.weight,
    this.complaints,
    this.checkedBy,
    this.notes,
  });

  factory KerabatDashboardHealthRecord.fromJson(Map<String, dynamic> json) {
    return KerabatDashboardHealthRecord(
      id: (json['id'] as num?)?.toInt() ?? 0,
      checkupDate: json['checkup_date'] != null
          ? DateTime.tryParse(json['checkup_date'] as String)
          : null,
      bloodPressureSystolic: (json['blood_pressure_systolic'] as num?)?.toInt(),
      bloodPressureDiastolic:
          (json['blood_pressure_diastolic'] as num?)?.toInt(),
      heartRate: (json['heart_rate'] as num?)?.toInt(),
      bodyTemperature: (json['body_temperature'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      complaints: json['complaints'] as String?,
      checkedBy: json['checked_by'] as String?,
      notes: json['notes'] as String?,
    );
  }
}

class KerabatDashboardEmergencyContact {
  final String? perawatName;
  final String? perawatPhone;
  final String? puskesmasName;
  final String? puskesmasPhone;
  final String? puskesmasAddress;

  KerabatDashboardEmergencyContact({
    this.perawatName,
    this.perawatPhone,
    this.puskesmasName,
    this.puskesmasPhone,
    this.puskesmasAddress,
  });

  factory KerabatDashboardEmergencyContact.fromJson(Map<String, dynamic> json) {
    return KerabatDashboardEmergencyContact(
      perawatName: json['perawat_name'] as String?,
      perawatPhone: json['perawat_phone'] as String?,
      puskesmasName: json['puskesmas_name'] as String?,
      puskesmasPhone: json['puskesmas_phone'] as String?,
      puskesmasAddress: json['puskesmas_address'] as String?,
    );
  }
}
