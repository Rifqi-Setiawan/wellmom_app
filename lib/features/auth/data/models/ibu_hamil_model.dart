import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wellmom_app/core/models/location.dart';
import 'package:wellmom_app/features/auth/data/models/riwayat_kesehatan_ibu_model.dart';

part 'ibu_hamil_model.freezed.dart';
part 'ibu_hamil_model.g.dart';

/// Ibu Hamil model with comprehensive pregnancy and health data
@freezed
class IbuHamilModel with _$IbuHamilModel {
  const factory IbuHamilModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'nama_lengkap') required String namaLengkap,
    required String nik, // 16 digit
    @JsonKey(name: 'date_of_birth') required DateTime dateOfBirth,
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,

    // Alamat & Lokasi
    required String address,
    required Location location, // longitude & latitude
    String? provinsi,
    @JsonKey(name: 'kota_kabupaten') String? kotaKabupaten,
    String? kelurahan,
    String? kecamatan,
    @JsonKey(name: 'rt_rw') String? rtRw,

    // Data Kehamilan
    @JsonKey(name: 'last_menstrual_period') DateTime? lastMenstrualPeriod, // HPHT
    @JsonKey(name: 'estimated_due_date') DateTime? estimatedDueDate, // HPL
    @JsonKey(name: 'usia_kehamilan') int? usiaKehamilan, // minggu
    @JsonKey(name: 'kehamilan_ke') @Default(1) int? kehamilanKe,
    @JsonKey(name: 'jumlah_anak') @Default(0) int? jumlahAnak,
    @JsonKey(name: 'jarak_kehamilan_terakhir') String? jarakKehamilanTerakhir,
    @JsonKey(name: 'miscarriage_number') @Default(0) int? miscarriageNumber,
    @JsonKey(name: 'previous_pregnancy_complications')
        String? previousPregnancyComplications,
    @JsonKey(name: 'pernah_caesar') @Default(false) bool pernahCaesar,
    @JsonKey(name: 'pernah_perdarahan_saat_hamil')
        @Default(false)
        bool pernahPerdarahanSaatHamil,

    // Riwayat Kesehatan (nested object)
    @JsonKey(name: 'riwayat_kesehatan_ibu')
        required RiwayatKesehatanIbuModel riwayatKesehatanIbu,

    // Kontak Darurat
    @JsonKey(name: 'emergency_contact_name') required String emergencyContactName,
    @JsonKey(name: 'emergency_contact_phone')
        required String emergencyContactPhone,
    @JsonKey(name: 'emergency_contact_relation')
        String? emergencyContactRelation,

    // Data Tambahan
    int? age,
    @JsonKey(name: 'blood_type') String? bloodType,
    @JsonKey(name: 'height_cm') double? heightCm,
    @JsonKey(name: 'pre_pregnancy_weight_kg') double? prePregnancyWeightKg,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    @JsonKey(name: 'current_medications') String? currentMedications,
    @JsonKey(name: 'risk_level') String? riskLevel, // 'low', 'normal', 'high'
    @JsonKey(name: 'healthcare_preference') String? healthcarePreference,
    @JsonKey(name: 'whatsapp_consent') @Default(true) bool whatsappConsent,
    @JsonKey(name: 'data_sharing_consent')
        @Default(false)
        bool dataSharingConsent,

    // Assignment (opsional untuk mobile)
    @JsonKey(name: 'puskesmas_id') int? puskesmasId,
    @JsonKey(name: 'perawat_id') int? perawatId,
    @JsonKey(name: 'assignment_date') DateTime? assignmentDate,
    @JsonKey(name: 'assignment_distance_km') double? assignmentDistanceKm,

    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _IbuHamilModel;

  factory IbuHamilModel.fromJson(Map<String, dynamic> json) =>
      _$IbuHamilModelFromJson(json);
}
