import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_ibu_hamil_request_model.freezed.dart';
part 'register_ibu_hamil_request_model.g.dart';

@freezed
abstract class RegisterIbuHamilRequestModel with _$RegisterIbuHamilRequestModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory RegisterIbuHamilRequestModel({
    @JsonKey(name: 'ibu_hamil') required IbuHamilData ibuHamil,
    required UserData user,
  }) = _RegisterIbuHamilRequestModel;

  factory RegisterIbuHamilRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterIbuHamilRequestModelFromJson(json);
}

@freezed
abstract class IbuHamilData with _$IbuHamilData {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory IbuHamilData({
    @JsonKey(name: 'nama_lengkap') required String namaLengkap,
    required String nik,
    @JsonKey(name: 'date_of_birth') required String dateOfBirth,
    required String address,
    required List<double> location,
    @JsonKey(name: 'emergency_contact_name') required String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone') required String emergencyContactPhone,
    @JsonKey(name: 'blood_type') String? bloodType,
    int? age,
    @JsonKey(name: 'emergency_contact_relation') String? emergencyContactRelation,
    String? provinsi,
    @JsonKey(name: 'kota_kabupaten') String? kotaKabupaten,
    String? kecamatan,
    String? kelurahan,
    @JsonKey(name: 'last_menstrual_period') String? lastMenstrualPeriod,
    @JsonKey(name: 'estimated_due_date') String? estimatedDueDate,
    @JsonKey(name: 'usia_kehamilan') int? usiaKehamilan,
    @JsonKey(name: 'kehamilan_ke') int? kehamilanKe,
    @JsonKey(name: 'jumlah_anak') int? jumlahAnak,
    @JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,
    @JsonKey(name: 'miscarriage_number') int? miscarriageNumber,
    @JsonKey(name: 'previous_pregnancy_complications') String? previousPregnancyComplications,
    @JsonKey(name: 'pernah_caesar') @Default(false) bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil') @Default(false) bool pernahPerdarahanSaatHamil,
    @JsonKey(name: 'riwayat_kesehatan_ibu') RiwayatKesehatanIbuData? riwayatKesehatanIbu,
    @JsonKey(name: 'healthcare_preference') String? healthcarePreference,
    @JsonKey(name: 'whatsapp_consent') @Default(true) bool whatsappConsent,
    @JsonKey(name: 'data_sharing_consent') @Default(false) bool dataSharingConsent,
  }) = _IbuHamilData;

  factory IbuHamilData.fromJson(Map<String, dynamic> json) =>
      _$IbuHamilDataFromJson(json);
}

@freezed
abstract class RiwayatKesehatanIbuData with _$RiwayatKesehatanIbuData {
  @JsonSerializable(includeIfNull: false)
  const factory RiwayatKesehatanIbuData({
    @JsonKey(name: 'darah_tinggi') @Default(false) bool darahTinggi,
    @Default(false) bool diabetes,
    @Default(false) bool anemia,
    @JsonKey(name: 'penyakit_jantung') @Default(false) bool penyakitJantung,
    @Default(false) bool asma,
    @JsonKey(name: 'penyakit_ginjal') @Default(false) bool penyakitGinjal,
    @JsonKey(name: 'tbc_malaria') @Default(false) bool tbcMalaria,
  }) = _RiwayatKesehatanIbuData;

  factory RiwayatKesehatanIbuData.fromJson(Map<String, dynamic> json) =>
      _$RiwayatKesehatanIbuDataFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  @JsonSerializable(includeIfNull: false)
  const factory UserData({
    required String phone,
    required String password,
    @JsonKey(name: 'full_name') required String fullName,
    required String role,
    String? email,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
