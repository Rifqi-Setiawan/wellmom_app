import 'package:wellmom_app/features/auth/data/models/riwayat_kesehatan_ibu_model.dart';

/// Request model for PATCH /api/v1/ibu-hamil/me/profile/kehamilan
class UpdateHealthProfileRequestModel {
  final int? usiaKehamilan;
  final int? kehamilanKe;
  final int? jumlahAnak;
  final int? miscarriageNumber;
  final String? jarakKehamilanTerakhir;
  final String? lastMenstrualPeriod; // YYYY-MM-DD format
  final String? estimatedDueDate; // YYYY-MM-DD format
  final String? previousPregnancyComplications;
  final bool? pernahCaesar;
  final bool? pernahPerdarahanSaatHamil;
  final RiwayatKesehatanIbuModel? riwayatKesehatanIbu;

  const UpdateHealthProfileRequestModel({
    this.usiaKehamilan,
    this.kehamilanKe,
    this.jumlahAnak,
    this.miscarriageNumber,
    this.jarakKehamilanTerakhir,
    this.lastMenstrualPeriod,
    this.estimatedDueDate,
    this.previousPregnancyComplications,
    this.pernahCaesar,
    this.pernahPerdarahanSaatHamil,
    this.riwayatKesehatanIbu,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (usiaKehamilan != null) {
      json['usia_kehamilan'] = usiaKehamilan;
    }
    if (kehamilanKe != null) {
      json['kehamilan_ke'] = kehamilanKe;
    }
    if (jumlahAnak != null) {
      json['jumlah_anak'] = jumlahAnak;
    }
    if (miscarriageNumber != null) {
      json['miscarriage_number'] = miscarriageNumber;
    }
    if (jarakKehamilanTerakhir != null && jarakKehamilanTerakhir!.isNotEmpty) {
      json['jarak_kehamilan_terakhir'] = jarakKehamilanTerakhir;
    }
    if (lastMenstrualPeriod != null && lastMenstrualPeriod!.isNotEmpty) {
      json['last_menstrual_period'] = lastMenstrualPeriod;
    }
    if (estimatedDueDate != null && estimatedDueDate!.isNotEmpty) {
      json['estimated_due_date'] = estimatedDueDate;
    }
    if (previousPregnancyComplications != null &&
        previousPregnancyComplications!.isNotEmpty) {
      json['previous_pregnancy_complications'] = previousPregnancyComplications;
    }
    if (pernahCaesar != null) {
      json['pernah_caesar'] = pernahCaesar;
    }
    if (pernahPerdarahanSaatHamil != null) {
      json['pernah_perdarahan_saat_hamil'] = pernahPerdarahanSaatHamil;
    }
      if (riwayatKesehatanIbu != null) {
      json['riwayat_kesehatan_ibu'] = {
        'darah_tinggi': riwayatKesehatanIbu!.darahTinggi,
        'diabetes': riwayatKesehatanIbu!.diabetes,
        'anemia': riwayatKesehatanIbu!.anemia,
        'penyakit_jantung': riwayatKesehatanIbu!.penyakitJantung,
        'asma': riwayatKesehatanIbu!.asma,
        'penyakit_ginjal': riwayatKesehatanIbu!.penyakitGinjal,
        'tbc_malaria': riwayatKesehatanIbu!.tbcMalaria,
      };
    }

    return json;
  }
}
