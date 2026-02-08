// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_kesehatan_ibu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RiwayatKesehatanIbuModel _$RiwayatKesehatanIbuModelFromJson(
  Map<String, dynamic> json,
) => _RiwayatKesehatanIbuModel(
  darahTinggi: json['darah_tinggi'] as bool? ?? false,
  diabetes: json['diabetes'] as bool? ?? false,
  anemia: json['anemia'] as bool? ?? false,
  penyakitJantung: json['penyakit_jantung'] as bool? ?? false,
  asma: json['asma'] as bool? ?? false,
  penyakitGinjal: json['penyakit_ginjal'] as bool? ?? false,
  tbcMalaria: json['tbc_malaria'] as bool? ?? false,
);

Map<String, dynamic> _$RiwayatKesehatanIbuModelToJson(
  _RiwayatKesehatanIbuModel instance,
) => <String, dynamic>{
  'darah_tinggi': instance.darahTinggi,
  'diabetes': instance.diabetes,
  'anemia': instance.anemia,
  'penyakit_jantung': instance.penyakitJantung,
  'asma': instance.asma,
  'penyakit_ginjal': instance.penyakitGinjal,
  'tbc_malaria': instance.tbcMalaria,
};
