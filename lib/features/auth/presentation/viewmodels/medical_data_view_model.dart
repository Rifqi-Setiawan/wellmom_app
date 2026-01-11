import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for medical data form
class MedicalDataState {
  // Card A: Kehamilan
  final DateTime? hpht; // Hari Pertama Haid Terakhir
  final DateTime? hpl; // Hari Perkiraan Lahir
  final int? usiaKehamilan; // minggu
  final int? kehamilanKe;
  final int? jumlahAnak;
  final int? jumlahKeguguran; // Jumlah keguguran (0, 1, 2, dst.)
  final String? jarakKehamilanTerakhir;

  // Card B: Riwayat Kesehatan Ibu
  final bool darahTinggi;
  final bool diabetes;
  final bool anemia;
  final bool penyakitJantung;
  final bool asma;
  final bool penyakitGinjal;
  final bool tbcMalaria;

  // Card C: Riwayat Masa Lalu
  final String? komplikasiKehamilanSebelumnya;
  final bool? pernahCaesar; // null = not selected, true = Ya, false = Tidak
  final bool? pernahPerdarahanSaatHamil; // null = not selected, true = Ya, false = Tidak

  // UI State
  final bool isCardAExpanded;
  final bool isCardBExpanded;
  final bool isCardCExpanded;

  // Consent
  final bool dataSharingConsent;
  final bool whatsappConsent;

  const MedicalDataState({
    this.hpht,
    this.hpl,
    this.usiaKehamilan,
    this.kehamilanKe,
    this.jumlahAnak,
    this.jumlahKeguguran,
    this.jarakKehamilanTerakhir,
    this.darahTinggi = false,
    this.diabetes = false,
    this.anemia = false,
    this.penyakitJantung = false,
    this.asma = false,
    this.penyakitGinjal = false,
    this.tbcMalaria = false,
    this.komplikasiKehamilanSebelumnya,
    this.pernahCaesar,
    this.pernahPerdarahanSaatHamil,
    this.isCardAExpanded = false,
    this.isCardBExpanded = false,
    this.isCardCExpanded = false,
    this.dataSharingConsent = false,
    this.whatsappConsent = false,
  });

  MedicalDataState copyWith({
    DateTime? hpht,
    DateTime? hpl,
    int? usiaKehamilan,
    int? kehamilanKe,
    int? jumlahAnak,
    int? jumlahKeguguran,
    String? jarakKehamilanTerakhir,
    bool? darahTinggi,
    bool? diabetes,
    bool? anemia,
    bool? penyakitJantung,
    bool? asma,
    bool? penyakitGinjal,
    bool? tbcMalaria,
    String? komplikasiKehamilanSebelumnya,
    bool? pernahCaesar,
    bool? pernahPerdarahanSaatHamil,
    bool? isCardAExpanded,
    bool? isCardBExpanded,
    bool? isCardCExpanded,
    bool? dataSharingConsent,
    bool? whatsappConsent,
  }) {
    return MedicalDataState(
      hpht: hpht ?? this.hpht,
      hpl: hpl ?? this.hpl,
      usiaKehamilan: usiaKehamilan ?? this.usiaKehamilan,
      kehamilanKe: kehamilanKe ?? this.kehamilanKe,
      jumlahAnak: jumlahAnak ?? this.jumlahAnak,
      jumlahKeguguran: jumlahKeguguran ?? this.jumlahKeguguran,
      jarakKehamilanTerakhir: jarakKehamilanTerakhir ?? this.jarakKehamilanTerakhir,
      darahTinggi: darahTinggi ?? this.darahTinggi,
      diabetes: diabetes ?? this.diabetes,
      anemia: anemia ?? this.anemia,
      penyakitJantung: penyakitJantung ?? this.penyakitJantung,
      asma: asma ?? this.asma,
      penyakitGinjal: penyakitGinjal ?? this.penyakitGinjal,
      tbcMalaria: tbcMalaria ?? this.tbcMalaria,
      komplikasiKehamilanSebelumnya: komplikasiKehamilanSebelumnya ?? this.komplikasiKehamilanSebelumnya,
      pernahCaesar: pernahCaesar ?? this.pernahCaesar,
      pernahPerdarahanSaatHamil: pernahPerdarahanSaatHamil ?? this.pernahPerdarahanSaatHamil,
      isCardAExpanded: isCardAExpanded ?? this.isCardAExpanded,
      isCardBExpanded: isCardBExpanded ?? this.isCardBExpanded,
      isCardCExpanded: isCardCExpanded ?? this.isCardCExpanded,
      dataSharingConsent: dataSharingConsent ?? this.dataSharingConsent,
      whatsappConsent: whatsappConsent ?? this.whatsappConsent,
    );
  }
}

/// ViewModel for medical data screen
class MedicalDataViewModel extends StateNotifier<MedicalDataState> {
  MedicalDataViewModel() : super(const MedicalDataState());

  // Card A: Kehamilan
  void updateHpht(DateTime? value) {
    if (value == null) {
      state = state.copyWith(
        hpht: null,
        hpl: null,
        usiaKehamilan: null,
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
    );
  }

  void updateHpl(DateTime? value) {
    state = state.copyWith(hpl: value);
  }

  void updateUsiaKehamilan(int? value) {
    state = state.copyWith(usiaKehamilan: value);
  }

  void updateKehamilanKe(int? value) {
    state = state.copyWith(kehamilanKe: value);
  }

  void updateJumlahAnak(int? value) {
    state = state.copyWith(jumlahAnak: value);
  }

  void updateJumlahKeguguran(int? value) {
    state = state.copyWith(jumlahKeguguran: value);
  }

  void updateJarakKehamilanTerakhir(String? value) {
    state = state.copyWith(jarakKehamilanTerakhir: value);
  }

  // Card B: Riwayat Kesehatan Ibu
  void toggleDarahTinggi() {
    state = state.copyWith(darahTinggi: !state.darahTinggi);
  }

  void toggleDiabetes() {
    state = state.copyWith(diabetes: !state.diabetes);
  }

  void toggleAnemia() {
    state = state.copyWith(anemia: !state.anemia);
  }

  void togglePenyakitJantung() {
    state = state.copyWith(penyakitJantung: !state.penyakitJantung);
  }

  void toggleAsma() {
    state = state.copyWith(asma: !state.asma);
  }

  void togglePenyakitGinjal() {
    state = state.copyWith(penyakitGinjal: !state.penyakitGinjal);
  }

  void toggleTbcMalaria() {
    state = state.copyWith(tbcMalaria: !state.tbcMalaria);
  }

  // Card C: Riwayat Masa Lalu
  void updateKomplikasiKehamilanSebelumnya(String? value) {
    state = state.copyWith(komplikasiKehamilanSebelumnya: value);
  }

  void updatePernahCaesar(bool? value) {
    state = state.copyWith(pernahCaesar: value);
  }

  void updatePernahPerdarahanSaatHamil(bool? value) {
    state = state.copyWith(pernahPerdarahanSaatHamil: value);
  }

  // UI State: Card Expansion
  void toggleCardA() {
    state = state.copyWith(isCardAExpanded: !state.isCardAExpanded);
  }

  void toggleCardB() {
    state = state.copyWith(isCardBExpanded: !state.isCardBExpanded);
  }

  void toggleCardC() {
    state = state.copyWith(isCardCExpanded: !state.isCardCExpanded);
  }

  // Consent
  void updateDataSharingConsent(bool value) {
    state = state.copyWith(dataSharingConsent: value);
  }

  void updateWhatsappConsent(bool value) {
    state = state.copyWith(whatsappConsent: value);
  }
}
