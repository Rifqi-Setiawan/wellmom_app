// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_ibu_hamil_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterIbuHamilRequestModelImpl _$$RegisterIbuHamilRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterIbuHamilRequestModelImpl(
  ibuHamil: IbuHamilData.fromJson(json['ibuHamil'] as Map<String, dynamic>),
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$RegisterIbuHamilRequestModelImplToJson(
  _$RegisterIbuHamilRequestModelImpl instance,
) => <String, dynamic>{'ibuHamil': instance.ibuHamil, 'user': instance.user};

_$IbuHamilDataImpl _$$IbuHamilDataImplFromJson(Map<String, dynamic> json) =>
    _$IbuHamilDataImpl(
      address: json['address'] as String,
      age: (json['age'] as num?)?.toInt(),
      bloodType: json['blood_type'] as String?,
      currentMedications: json['current_medications'] as String?,
      dataSharingConsent: json['data_sharing_consent'] as bool? ?? false,
      dateOfBirth: json['date_of_birth'] as String,
      emergencyContactName: json['emergency_contact_name'] as String,
      emergencyContactPhone: json['emergency_contact_phone'] as String,
      emergencyContactRelation: json['emergency_contact_relation'] as String?,
      estimatedDueDate: json['estimated_due_date'] as String?,
      healthcarePreference: json['healthcare_preference'] as String?,
      heightCm: (json['height_cm'] as num?)?.toDouble(),
      jarakKehamilanTerakhir: json['jarak_kehamilan_terakhir'] as String?,
      jumlahAnak: (json['jumlah_anak'] as num?)?.toInt(),
      kecamatan: json['kecamatan'] as String,
      kehamilanKe: (json['kehamilan_ke'] as num?)?.toInt(),
      kelurahan: json['kelurahan'] as String?,
      kotaKabupaten: json['kota_kabupaten'] as String,
      lastMenstrualPeriod: json['last_menstrual_period'] as String?,
      location: (json['location'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      medicalHistory: json['medical_history'] as String?,
      miscarriageNumber: (json['miscarriage_number'] as num?)?.toInt() ?? 0,
      namaLengkap: json['nama_lengkap'] as String,
      nik: json['nik'] as String,
      pernahCaesar: json['pernah_caesar'] as bool? ?? false,
      pernahPerdarahanSaatHamil:
          json['pernah_perdarahan_saat_hamil'] as bool? ?? false,
      prePregnancyWeightKg: (json['pre_pregnancy_weight_kg'] as num?)
          ?.toDouble(),
      previousPregnancyComplications:
          json['previous_pregnancy_complications'] as String?,
      provinsi: json['provinsi'] as String,
      riskLevel: json['risk_level'] as String?,
      riwayatKesehatanIbu: RiwayatKesehatanIbuData.fromJson(
        json['riwayat_kesehatan_ibu'] as Map<String, dynamic>,
      ),
      rtRw: json['rt_rw'] as String?,
      usiaKehamilan: (json['usia_kehamilan'] as num?)?.toInt(),
      whatsappConsent: json['whatsapp_consent'] as bool? ?? false,
    );

Map<String, dynamic> _$$IbuHamilDataImplToJson(
  _$IbuHamilDataImpl instance,
) => <String, dynamic>{
  'address': instance.address,
  'age': instance.age,
  'blood_type': instance.bloodType,
  'current_medications': instance.currentMedications,
  'data_sharing_consent': instance.dataSharingConsent,
  'date_of_birth': instance.dateOfBirth,
  'emergency_contact_name': instance.emergencyContactName,
  'emergency_contact_phone': instance.emergencyContactPhone,
  'emergency_contact_relation': instance.emergencyContactRelation,
  'estimated_due_date': instance.estimatedDueDate,
  'healthcare_preference': instance.healthcarePreference,
  'height_cm': instance.heightCm,
  'jarak_kehamilan_terakhir': instance.jarakKehamilanTerakhir,
  'jumlah_anak': instance.jumlahAnak,
  'kecamatan': instance.kecamatan,
  'kehamilan_ke': instance.kehamilanKe,
  'kelurahan': instance.kelurahan,
  'kota_kabupaten': instance.kotaKabupaten,
  'last_menstrual_period': instance.lastMenstrualPeriod,
  'location': instance.location,
  'medical_history': instance.medicalHistory,
  'miscarriage_number': instance.miscarriageNumber,
  'nama_lengkap': instance.namaLengkap,
  'nik': instance.nik,
  'pernah_caesar': instance.pernahCaesar,
  'pernah_perdarahan_saat_hamil': instance.pernahPerdarahanSaatHamil,
  'pre_pregnancy_weight_kg': instance.prePregnancyWeightKg,
  'previous_pregnancy_complications': instance.previousPregnancyComplications,
  'provinsi': instance.provinsi,
  'risk_level': instance.riskLevel,
  'riwayat_kesehatan_ibu': instance.riwayatKesehatanIbu,
  'rt_rw': instance.rtRw,
  'usia_kehamilan': instance.usiaKehamilan,
  'whatsapp_consent': instance.whatsappConsent,
};

_$RiwayatKesehatanIbuDataImpl _$$RiwayatKesehatanIbuDataImplFromJson(
  Map<String, dynamic> json,
) => _$RiwayatKesehatanIbuDataImpl(
  anemia: json['anemia'] as bool? ?? false,
  asma: json['asma'] as bool? ?? false,
  darahTinggi: json['darah_tinggi'] as bool? ?? false,
  diabetes: json['diabetes'] as bool? ?? false,
  penyakitGinjal: json['penyakit_ginjal'] as bool? ?? false,
  penyakitJantung: json['penyakit_jantung'] as bool? ?? false,
  tbcMalaria: json['tbc_malaria'] as bool? ?? false,
);

Map<String, dynamic> _$$RiwayatKesehatanIbuDataImplToJson(
  _$RiwayatKesehatanIbuDataImpl instance,
) => <String, dynamic>{
  'anemia': instance.anemia,
  'asma': instance.asma,
  'darah_tinggi': instance.darahTinggi,
  'diabetes': instance.diabetes,
  'penyakit_ginjal': instance.penyakitGinjal,
  'penyakit_jantung': instance.penyakitJantung,
  'tbc_malaria': instance.tbcMalaria,
};

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'full_name': instance.fullName,
      'password': instance.password,
      'phone': instance.phone,
      'role': instance.role,
    };
