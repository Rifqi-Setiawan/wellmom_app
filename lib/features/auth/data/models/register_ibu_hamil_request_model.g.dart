// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_ibu_hamil_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterIbuHamilRequestModel _$RegisterIbuHamilRequestModelFromJson(
  Map<String, dynamic> json,
) => _RegisterIbuHamilRequestModel(
  ibuHamil: IbuHamilData.fromJson(json['ibu_hamil'] as Map<String, dynamic>),
  user: UserData.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterIbuHamilRequestModelToJson(
  _RegisterIbuHamilRequestModel instance,
) => <String, dynamic>{
  'ibu_hamil': instance.ibuHamil.toJson(),
  'user': instance.user.toJson(),
};

_IbuHamilData _$IbuHamilDataFromJson(Map<String, dynamic> json) =>
    _IbuHamilData(
      namaLengkap: json['nama_lengkap'] as String,
      nik: json['nik'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      address: json['address'] as String,
      location: (json['location'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      emergencyContactName: json['emergency_contact_name'] as String,
      emergencyContactPhone: json['emergency_contact_phone'] as String,
      bloodType: json['blood_type'] as String?,
      age: (json['age'] as num?)?.toInt(),
      emergencyContactRelation: json['emergency_contact_relation'] as String?,
      provinsi: json['provinsi'] as String?,
      kotaKabupaten: json['kota_kabupaten'] as String?,
      kecamatan: json['kecamatan'] as String?,
      kelurahan: json['kelurahan'] as String?,
      lastMenstrualPeriod: json['last_menstrual_period'] as String?,
      estimatedDueDate: json['estimated_due_date'] as String?,
      usiaKehamilan: (json['usia_kehamilan'] as num?)?.toInt(),
      kehamilanKe: (json['kehamilan_ke'] as num?)?.toInt(),
      jumlahAnak: (json['jumlah_anak'] as num?)?.toInt(),
      jarakKehamilanTerakhir: json['jarak_kehamilan_terakhir'] as String?,
      miscarriageNumber: (json['miscarriage_number'] as num?)?.toInt(),
      previousPregnancyComplications:
          json['previous_pregnancy_complications'] as String?,
      pernahCaesar: json['pernah_caesar'] as bool? ?? false,
      pernahPerdarahanSaatHamil:
          json['pernah_perdarahan_saat_hamil'] as bool? ?? false,
      riwayatKesehatanIbu: json['riwayat_kesehatan_ibu'] == null
          ? null
          : RiwayatKesehatanIbuData.fromJson(
              json['riwayat_kesehatan_ibu'] as Map<String, dynamic>,
            ),
      healthcarePreference: json['healthcare_preference'] as String?,
      whatsappConsent: json['whatsapp_consent'] as bool? ?? true,
      dataSharingConsent: json['data_sharing_consent'] as bool? ?? false,
    );

Map<String, dynamic> _$IbuHamilDataToJson(
  _IbuHamilData instance,
) => <String, dynamic>{
  'nama_lengkap': instance.namaLengkap,
  'nik': instance.nik,
  'date_of_birth': instance.dateOfBirth,
  'address': instance.address,
  'location': instance.location,
  'emergency_contact_name': instance.emergencyContactName,
  'emergency_contact_phone': instance.emergencyContactPhone,
  'blood_type': ?instance.bloodType,
  'age': ?instance.age,
  'emergency_contact_relation': ?instance.emergencyContactRelation,
  'provinsi': ?instance.provinsi,
  'kota_kabupaten': ?instance.kotaKabupaten,
  'kecamatan': ?instance.kecamatan,
  'kelurahan': ?instance.kelurahan,
  'last_menstrual_period': ?instance.lastMenstrualPeriod,
  'estimated_due_date': ?instance.estimatedDueDate,
  'usia_kehamilan': ?instance.usiaKehamilan,
  'kehamilan_ke': ?instance.kehamilanKe,
  'jumlah_anak': ?instance.jumlahAnak,
  'jarak_kehamilan_terakhir': ?instance.jarakKehamilanTerakhir,
  'miscarriage_number': ?instance.miscarriageNumber,
  'previous_pregnancy_complications': ?instance.previousPregnancyComplications,
  'pernah_caesar': instance.pernahCaesar,
  'pernah_perdarahan_saat_hamil': instance.pernahPerdarahanSaatHamil,
  'riwayat_kesehatan_ibu': ?instance.riwayatKesehatanIbu?.toJson(),
  'healthcare_preference': ?instance.healthcarePreference,
  'whatsapp_consent': instance.whatsappConsent,
  'data_sharing_consent': instance.dataSharingConsent,
};

_RiwayatKesehatanIbuData _$RiwayatKesehatanIbuDataFromJson(
  Map<String, dynamic> json,
) => _RiwayatKesehatanIbuData(
  darahTinggi: json['darah_tinggi'] as bool? ?? false,
  diabetes: json['diabetes'] as bool? ?? false,
  anemia: json['anemia'] as bool? ?? false,
  penyakitJantung: json['penyakit_jantung'] as bool? ?? false,
  asma: json['asma'] as bool? ?? false,
  penyakitGinjal: json['penyakit_ginjal'] as bool? ?? false,
  tbcMalaria: json['tbc_malaria'] as bool? ?? false,
);

Map<String, dynamic> _$RiwayatKesehatanIbuDataToJson(
  _RiwayatKesehatanIbuData instance,
) => <String, dynamic>{
  'darah_tinggi': instance.darahTinggi,
  'diabetes': instance.diabetes,
  'anemia': instance.anemia,
  'penyakit_jantung': instance.penyakitJantung,
  'asma': instance.asma,
  'penyakit_ginjal': instance.penyakitGinjal,
  'tbc_malaria': instance.tbcMalaria,
};

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  phone: json['phone'] as String,
  password: json['password'] as String,
  fullName: json['full_name'] as String,
  role: json['role'] as String,
  email: json['email'] as String?,
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'phone': instance.phone,
  'password': instance.password,
  'full_name': instance.fullName,
  'role': instance.role,
  'email': ?instance.email,
};
