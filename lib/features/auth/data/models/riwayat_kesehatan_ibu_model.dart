import 'package:freezed_annotation/freezed_annotation.dart';

part 'riwayat_kesehatan_ibu_model.freezed.dart';
part 'riwayat_kesehatan_ibu_model.g.dart';

/// Riwayat kesehatan ibu model (nested object)
@freezed
class RiwayatKesehatanIbuModel with _$RiwayatKesehatanIbuModel {
  const factory RiwayatKesehatanIbuModel({
    @JsonKey(name: 'darah_tinggi') @Default(false) bool darahTinggi,
    @Default(false) bool diabetes,
    @Default(false) bool anemia,
    @JsonKey(name: 'penyakit_jantung') @Default(false) bool penyakitJantung,
    @Default(false) bool asma,
    @JsonKey(name: 'penyakit_ginjal') @Default(false) bool penyakitGinjal,
    @JsonKey(name: 'tbc_malaria') @Default(false) bool tbcMalaria,
  }) = _RiwayatKesehatanIbuModel;

  factory RiwayatKesehatanIbuModel.fromJson(Map<String, dynamic> json) =>
      _$RiwayatKesehatanIbuModelFromJson(json);
}
