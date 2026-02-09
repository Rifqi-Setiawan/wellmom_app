import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/auth/data/models/riwayat_kesehatan_ibu_model.dart';
import 'package:wellmom_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:wellmom_app/features/profile/data/models/update_health_profile_request_model.dart';

/// State for health profile form
class HealthProfileState {
  // Section A: Kehamilan
  final int? usiaKehamilan; // minggu
  final int? kehamilanKe;
  final int? jumlahAnak;
  final bool hasRiwayatKeguguran; // true = Ya, false = Tidak
  final int? jumlahKeguguran; // Berapa kali? (only if hasRiwayatKeguguran == true)
  final String? jarakKehamilanTerakhir;
  final DateTime? hpht; // Hari Pertama Haid Terakhir
  final DateTime? hpl; // Hari Perkiraan Lahir (Perkiraan)

  // Section B: Riwayat Kesehatan Ibu
  final bool darahTinggi;
  final bool diabetes;
  final bool anemia;
  final bool penyakitJantung;
  final bool asma;
  final bool penyakitGinjal;
  final bool tbcMalaria;

  // Section C: Riwayat Masa Lalu
  final String? komplikasiKehamilanSebelumnya;
  final bool pernahCaesar; // true = Ya, false = Tidak
  final String? pernahPerdarahanSaatHamil; // Text field

  // Loading & Error
  final bool isLoading;
  final bool isSaving;
  final String? error;

  const HealthProfileState({
    this.usiaKehamilan,
    this.kehamilanKe,
    this.jumlahAnak,
    this.hasRiwayatKeguguran = false,
    this.jumlahKeguguran,
    this.jarakKehamilanTerakhir,
    this.hpht,
    this.hpl,
    this.darahTinggi = false,
    this.diabetes = false,
    this.anemia = false,
    this.penyakitJantung = false,
    this.asma = false,
    this.penyakitGinjal = false,
    this.tbcMalaria = false,
    this.komplikasiKehamilanSebelumnya,
    this.pernahCaesar = false,
    this.pernahPerdarahanSaatHamil,
    this.isLoading = false,
    this.isSaving = false,
    this.error,
  });

  HealthProfileState copyWith({
    int? usiaKehamilan,
    int? kehamilanKe,
    int? jumlahAnak,
    bool? hasRiwayatKeguguran,
    int? jumlahKeguguran,
    String? jarakKehamilanTerakhir,
    DateTime? hpht,
    DateTime? hpl,
    bool? darahTinggi,
    bool? diabetes,
    bool? anemia,
    bool? penyakitJantung,
    bool? asma,
    bool? penyakitGinjal,
    bool? tbcMalaria,
    String? komplikasiKehamilanSebelumnya,
    bool? pernahCaesar,
    String? pernahPerdarahanSaatHamil,
    bool? isLoading,
    bool? isSaving,
    String? error,
    bool clearError = false,
  }) {
    return HealthProfileState(
      usiaKehamilan: usiaKehamilan ?? this.usiaKehamilan,
      kehamilanKe: kehamilanKe ?? this.kehamilanKe,
      jumlahAnak: jumlahAnak ?? this.jumlahAnak,
      hasRiwayatKeguguran: hasRiwayatKeguguran ?? this.hasRiwayatKeguguran,
      jumlahKeguguran: jumlahKeguguran ?? this.jumlahKeguguran,
      jarakKehamilanTerakhir: jarakKehamilanTerakhir ?? this.jarakKehamilanTerakhir,
      hpht: hpht ?? this.hpht,
      hpl: hpl ?? this.hpl,
      darahTinggi: darahTinggi != null ? darahTinggi : this.darahTinggi,
      diabetes: diabetes != null ? diabetes : this.diabetes,
      anemia: anemia != null ? anemia : this.anemia,
      penyakitJantung: penyakitJantung != null ? penyakitJantung : this.penyakitJantung,
      asma: asma != null ? asma : this.asma,
      penyakitGinjal: penyakitGinjal != null ? penyakitGinjal : this.penyakitGinjal,
      tbcMalaria: tbcMalaria != null ? tbcMalaria : this.tbcMalaria,
      komplikasiKehamilanSebelumnya: komplikasiKehamilanSebelumnya ?? this.komplikasiKehamilanSebelumnya,
      pernahCaesar: pernahCaesar ?? this.pernahCaesar,
      pernahPerdarahanSaatHamil: pernahPerdarahanSaatHamil ?? this.pernahPerdarahanSaatHamil,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// ViewModel for health profile screen
class HealthProfileViewModel extends StateNotifier<HealthProfileState> {
  final ProfileRemoteDataSource profileDataSource;

  HealthProfileViewModel({
    required this.profileDataSource,
  }) : super(const HealthProfileState());

  /// Load health profile data from IbuHamilModel
  void loadFromIbuHamil(IbuHamilModel? ibuHamil) {
    if (ibuHamil == null) {
      state = state.copyWith(isLoading: false);
      return;
    }

    // Debug: Print loaded data
    debugPrint('[HealthProfile] Loading data from IbuHamilModel:');
    debugPrint('  usiaKehamilan: ${ibuHamil.usiaKehamilan}');
    debugPrint('  kehamilanKe: ${ibuHamil.kehamilanKe}');
    debugPrint('  jumlahAnak: ${ibuHamil.jumlahAnak}');
    debugPrint('  darahTinggi: ${ibuHamil.riwayatKesehatanIbu.darahTinggi}');
    debugPrint('  diabetes: ${ibuHamil.riwayatKesehatanIbu.diabetes}');
    debugPrint('  anemia: ${ibuHamil.riwayatKesehatanIbu.anemia}');

    state = state.copyWith(
      usiaKehamilan: ibuHamil.usiaKehamilan,
      kehamilanKe: ibuHamil.kehamilanKe ?? 1,
      jumlahAnak: ibuHamil.jumlahAnak ?? 0,
      hasRiwayatKeguguran: (ibuHamil.miscarriageNumber ?? 0) > 0,
      jumlahKeguguran: ibuHamil.miscarriageNumber,
      jarakKehamilanTerakhir: ibuHamil.jarakKehamilanTerakhir,
      hpht: ibuHamil.lastMenstrualPeriod,
      hpl: ibuHamil.estimatedDueDate,
      darahTinggi: ibuHamil.riwayatKesehatanIbu.darahTinggi,
      diabetes: ibuHamil.riwayatKesehatanIbu.diabetes,
      anemia: ibuHamil.riwayatKesehatanIbu.anemia,
      penyakitJantung: ibuHamil.riwayatKesehatanIbu.penyakitJantung,
      asma: ibuHamil.riwayatKesehatanIbu.asma,
      penyakitGinjal: ibuHamil.riwayatKesehatanIbu.penyakitGinjal,
      tbcMalaria: ibuHamil.riwayatKesehatanIbu.tbcMalaria,
      komplikasiKehamilanSebelumnya: ibuHamil.previousPregnancyComplications,
      pernahCaesar: ibuHamil.pernahCaesar,
      pernahPerdarahanSaatHamil: ibuHamil.pernahPerdarahanSaatHamil
          ? 'Ya, saat trimester 1' // Default text if true, user can edit
          : 'Tidak ada',
      isLoading: false,
    );
    
    debugPrint('[HealthProfile] State updated:');
    debugPrint('  usiaKehamilan: ${state.usiaKehamilan}');
    debugPrint('  darahTinggi: ${state.darahTinggi}');
    debugPrint('  diabetes: ${state.diabetes}');
    debugPrint('  anemia: ${state.anemia}');
  }

  // Section A: Kehamilan
  void updateUsiaKehamilan(int? value) {
    state = state.copyWith(usiaKehamilan: value, clearError: true);
  }

  void updateKehamilanKe(int? value) {
    state = state.copyWith(kehamilanKe: value, clearError: true);
  }

  void updateJumlahAnak(int? value) {
    state = state.copyWith(jumlahAnak: value, clearError: true);
  }

  void updateHasRiwayatKeguguran(bool value) {
    state = state.copyWith(
      hasRiwayatKeguguran: value,
      jumlahKeguguran: value ? state.jumlahKeguguran : null,
      clearError: true,
    );
  }

  void updateJumlahKeguguran(int? value) {
    state = state.copyWith(jumlahKeguguran: value, clearError: true);
  }

  void updateJarakKehamilanTerakhir(String? value) {
    state = state.copyWith(jarakKehamilanTerakhir: value, clearError: true);
  }

  void updateHpht(DateTime? value) {
    if (value == null) {
      state = state.copyWith(
        hpht: null,
        hpl: null,
        usiaKehamilan: null,
        clearError: true,
      );
      return;
    }

    // Calculate HPL: HPHT + 280 days (40 weeks)
    final hpl = value.add(const Duration(days: 280));

    // Calculate usia kehamilan: (Today - HPHT) in weeks
    final today = DateTime.now();
    final difference = today.difference(value);
    final usiaKehamilan = (difference.inDays / 7).floor();

    state = state.copyWith(
      hpht: value,
      hpl: hpl,
      usiaKehamilan: usiaKehamilan >= 0 ? usiaKehamilan : null,
      clearError: true,
    );
  }

  void updateHpl(DateTime? value) {
    state = state.copyWith(hpl: value, clearError: true);
  }

  // Section B: Riwayat Kesehatan Ibu
  void toggleDarahTinggi() {
    state = state.copyWith(darahTinggi: !state.darahTinggi, clearError: true);
  }

  void toggleDiabetes() {
    state = state.copyWith(diabetes: !state.diabetes, clearError: true);
  }

  void toggleAnemia() {
    state = state.copyWith(anemia: !state.anemia, clearError: true);
  }

  void togglePenyakitJantung() {
    state = state.copyWith(penyakitJantung: !state.penyakitJantung, clearError: true);
  }

  void toggleAsma() {
    state = state.copyWith(asma: !state.asma, clearError: true);
  }

  void togglePenyakitGinjal() {
    state = state.copyWith(penyakitGinjal: !state.penyakitGinjal, clearError: true);
  }

  void toggleTbcMalaria() {
    state = state.copyWith(tbcMalaria: !state.tbcMalaria, clearError: true);
  }

  // Section C: Riwayat Masa Lalu
  void updateKomplikasiKehamilanSebelumnya(String? value) {
    state = state.copyWith(komplikasiKehamilanSebelumnya: value, clearError: true);
  }

  void updatePernahCaesar(bool value) {
    state = state.copyWith(pernahCaesar: value, clearError: true);
  }

  void updatePernahPerdarahanSaatHamil(String? value) {
    state = state.copyWith(pernahPerdarahanSaatHamil: value, clearError: true);
  }

  /// Save health profile to API
  Future<bool> saveHealthProfile() async {
    state = state.copyWith(isSaving: true, clearError: true);
    try {
      // Convert dates to YYYY-MM-DD format
      String? lastMenstrualPeriodStr;
      if (state.hpht != null) {
        final year = state.hpht!.year;
        final month = state.hpht!.month.toString().padLeft(2, '0');
        final day = state.hpht!.day.toString().padLeft(2, '0');
        lastMenstrualPeriodStr = '$year-$month-$day';
      }

      String? estimatedDueDateStr;
      if (state.hpl != null) {
        final year = state.hpl!.year;
        final month = state.hpl!.month.toString().padLeft(2, '0');
        final day = state.hpl!.day.toString().padLeft(2, '0');
        estimatedDueDateStr = '$year-$month-$day';
      }

      // Convert pernahPerdarahanSaatHamil from string to bool
      // If string is not empty, it means "Ya" (true), otherwise false
      bool? pernahPerdarahanBool;
      if (state.pernahPerdarahanSaatHamil != null &&
          state.pernahPerdarahanSaatHamil!.isNotEmpty) {
        // Check if the text indicates "Ya" or contains "Ya"
        final text = state.pernahPerdarahanSaatHamil!.toLowerCase().trim();
        pernahPerdarahanBool = text.isNotEmpty &&
            (text.contains('ya') ||
                text.contains('yes') ||
                text.contains('pernah') ||
                text != 'tidak ada' &&
                    text != 'tidak' &&
                    text != 'no');
      } else {
        pernahPerdarahanBool = false;
      }

      // Build riwayat kesehatan ibu
      final riwayatKesehatanIbu = RiwayatKesehatanIbuModel(
        darahTinggi: state.darahTinggi,
        diabetes: state.diabetes,
        anemia: state.anemia,
        penyakitJantung: state.penyakitJantung,
        asma: state.asma,
        penyakitGinjal: state.penyakitGinjal,
        tbcMalaria: state.tbcMalaria,
      );

      // Create request model
      final request = UpdateHealthProfileRequestModel(
        usiaKehamilan: state.usiaKehamilan,
        kehamilanKe: state.kehamilanKe,
        jumlahAnak: state.jumlahAnak,
        miscarriageNumber: state.hasRiwayatKeguguran
            ? (state.jumlahKeguguran ?? 0)
            : 0,
        jarakKehamilanTerakhir: state.jarakKehamilanTerakhir,
        lastMenstrualPeriod: lastMenstrualPeriodStr,
        estimatedDueDate: estimatedDueDateStr,
        previousPregnancyComplications: state.komplikasiKehamilanSebelumnya,
        pernahCaesar: state.pernahCaesar,
        pernahPerdarahanSaatHamil: pernahPerdarahanBool,
        riwayatKesehatanIbu: riwayatKesehatanIbu,
      );

      // Call API
      await profileDataSource.updateHealthProfile(request);

      state = state.copyWith(isSaving: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isSaving: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }
}
