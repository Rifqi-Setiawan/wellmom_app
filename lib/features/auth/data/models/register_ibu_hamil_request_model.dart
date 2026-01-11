import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_ibu_hamil_request_model.freezed.dart';
part 'register_ibu_hamil_request_model.g.dart';

/// Request model for complete ibu hamil registration
@freezed
class RegisterIbuHamilRequestModel with _$RegisterIbuHamilRequestModel {
  const factory RegisterIbuHamilRequestModel({
    @JsonKey(name: 'ibu_hamil') required IbuHamilData ibuHamil,
    required UserData user,
  }) = _RegisterIbuHamilRequestModel;

  factory RegisterIbuHamilRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterIbuHamilRequestModelFromJson(json);
}

@freezed
class IbuHamilData with _$IbuHamilData {
  const factory IbuHamilData({
    required String address,
    int? age,
    @JsonKey(name: 'blood_type') String? bloodType,
    @JsonKey(name: 'data_sharing_consent') @Default(false) bool dataSharingConsent,
    @JsonKey(name: 'date_of_birth') required String dateOfBirth,
    @JsonKey(name: 'emergency_contact_name') required String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone') required String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation,
    @JsonKey(name: 'estimated_due_date') String? estimatedDueDate,
    @JsonKey(name: 'healthcare_preference') String? healthcarePreference,
    @JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,
    @JsonKey(name: 'jumlah_anak') int? jumlahAnak,
    required String kecamatan,
    @JsonKey(name: 'kehamilan_ke') int? kehamilanKe,
    String? kelurahan,
    @JsonKey(name: 'kota_kabupaten') required String kotaKabupaten,
    @JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod,
    required List<double> location, // [longitude, latitude]
    @JsonKey(name: 'miscarriage_number') @Default(0) int miscarriageNumber,
    @JsonKey(name: 'nama_lengkap') required String namaLengkap,
    required String nik,
    @JsonKey(name: 'pernah_caesar') @Default(false) bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil') @Default(false) bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications,
    required String provinsi,
    @JsonKey(name: 'risk_level') String? riskLevel,
    @JsonKey(name: 'riwayat_kesehatan_ibu') required RiwayatKesehatanIbuData riwayatKesehatanIbu,
    @JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,
    @JsonKey(name: 'whatsapp_consent') @Default(false) bool whatsappConsent,
  }) = _IbuHamilData;

  factory IbuHamilData.fromJson(Map<String, dynamic> json) =>
      _$IbuHamilDataFromJson(json);
}

@freezed
class RiwayatKesehatanIbuData with _$RiwayatKesehatanIbuData {
  const factory RiwayatKesehatanIbuData({
    @Default(false) bool anemia,
    @Default(false) bool asma,
    @JsonKey(name: 'darah_tinggi') @Default(false) bool darahTinggi,
    @Default(false) bool diabetes,
    @JsonKey(name: 'penyakit_ginjal') @Default(false) bool penyakitGinjal,
    @JsonKey(name: 'penyakit_jantung') @Default(false) bool penyakitJantung,
    @JsonKey(name: 'tbc_malaria') @Default(false) bool tbcMalaria,
  }) = _RiwayatKesehatanIbuData;

  factory RiwayatKesehatanIbuData.fromJson(Map<String, dynamic> json) =>
      _$RiwayatKesehatanIbuDataFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    required String password,
    required String phone,
    required String role,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
