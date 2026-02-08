// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ibu_hamil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IbuHamilModel _$IbuHamilModelFromJson(
  Map<String, dynamic> json,
) => _IbuHamilModel(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  namaLengkap: json['nama_lengkap'] as String,
  nik: json['nik'] as String,
  dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
  profilePhotoUrl: json['profile_photo_url'] as String?,
  address: json['address'] as String,
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  provinsi: json['provinsi'] as String?,
  kotaKabupaten: json['kota_kabupaten'] as String?,
  kelurahan: json['kelurahan'] as String?,
  kecamatan: json['kecamatan'] as String?,
  rtRw: json['rt_rw'] as String?,
  lastMenstrualPeriod: json['last_menstrual_period'] == null
      ? null
      : DateTime.parse(json['last_menstrual_period'] as String),
  estimatedDueDate: json['estimated_due_date'] == null
      ? null
      : DateTime.parse(json['estimated_due_date'] as String),
  usiaKehamilan: (json['usia_kehamilan'] as num?)?.toInt(),
  kehamilanKe: (json['kehamilan_ke'] as num?)?.toInt() ?? 1,
  jumlahAnak: (json['jumlah_anak'] as num?)?.toInt() ?? 0,
  jarakKehamilanTerakhir: json['jarak_kehamilan_terakhir'] as String?,
  miscarriageNumber: (json['miscarriage_number'] as num?)?.toInt() ?? 0,
  previousPregnancyComplications:
      json['previous_pregnancy_complications'] as String?,
  pernahCaesar: json['pernah_caesar'] as bool? ?? false,
  pernahPerdarahanSaatHamil:
      json['pernah_perdarahan_saat_hamil'] as bool? ?? false,
  riwayatKesehatanIbu: RiwayatKesehatanIbuModel.fromJson(
    json['riwayat_kesehatan_ibu'] as Map<String, dynamic>,
  ),
  emergencyContactName: json['emergency_contact_name'] as String,
  emergencyContactPhone: json['emergency_contact_phone'] as String,
  emergencyContactRelation: json['emergency_contact_relation'] as String?,
  age: (json['age'] as num?)?.toInt(),
  bloodType: json['blood_type'] as String?,
  heightCm: (json['height_cm'] as num?)?.toDouble(),
  prePregnancyWeightKg: (json['pre_pregnancy_weight_kg'] as num?)?.toDouble(),
  medicalHistory: json['medical_history'] as String?,
  currentMedications: json['current_medications'] as String?,
  riskLevel: json['risk_level'] as String?,
  healthcarePreference: json['healthcare_preference'] as String?,
  whatsappConsent: json['whatsapp_consent'] as bool? ?? true,
  dataSharingConsent: json['data_sharing_consent'] as bool? ?? false,
  puskesmasId: (json['puskesmas_id'] as num?)?.toInt(),
  perawatId: (json['perawat_id'] as num?)?.toInt(),
  assignmentDate: json['assignment_date'] == null
      ? null
      : DateTime.parse(json['assignment_date'] as String),
  assignmentDistanceKm: (json['assignment_distance_km'] as num?)?.toDouble(),
  isActive: json['is_active'] as bool? ?? true,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$IbuHamilModelToJson(
  _IbuHamilModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'nama_lengkap': instance.namaLengkap,
  'nik': instance.nik,
  'date_of_birth': instance.dateOfBirth.toIso8601String(),
  'profile_photo_url': instance.profilePhotoUrl,
  'address': instance.address,
  'location': instance.location,
  'provinsi': instance.provinsi,
  'kota_kabupaten': instance.kotaKabupaten,
  'kelurahan': instance.kelurahan,
  'kecamatan': instance.kecamatan,
  'rt_rw': instance.rtRw,
  'last_menstrual_period': instance.lastMenstrualPeriod?.toIso8601String(),
  'estimated_due_date': instance.estimatedDueDate?.toIso8601String(),
  'usia_kehamilan': instance.usiaKehamilan,
  'kehamilan_ke': instance.kehamilanKe,
  'jumlah_anak': instance.jumlahAnak,
  'jarak_kehamilan_terakhir': instance.jarakKehamilanTerakhir,
  'miscarriage_number': instance.miscarriageNumber,
  'previous_pregnancy_complications': instance.previousPregnancyComplications,
  'pernah_caesar': instance.pernahCaesar,
  'pernah_perdarahan_saat_hamil': instance.pernahPerdarahanSaatHamil,
  'riwayat_kesehatan_ibu': instance.riwayatKesehatanIbu,
  'emergency_contact_name': instance.emergencyContactName,
  'emergency_contact_phone': instance.emergencyContactPhone,
  'emergency_contact_relation': instance.emergencyContactRelation,
  'age': instance.age,
  'blood_type': instance.bloodType,
  'height_cm': instance.heightCm,
  'pre_pregnancy_weight_kg': instance.prePregnancyWeightKg,
  'medical_history': instance.medicalHistory,
  'current_medications': instance.currentMedications,
  'risk_level': instance.riskLevel,
  'healthcare_preference': instance.healthcarePreference,
  'whatsapp_consent': instance.whatsappConsent,
  'data_sharing_consent': instance.dataSharingConsent,
  'puskesmas_id': instance.puskesmasId,
  'perawat_id': instance.perawatId,
  'assignment_date': instance.assignmentDate?.toIso8601String(),
  'assignment_distance_km': instance.assignmentDistanceKm,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
