class PerawatModel {
  final int id;
  final String namaLengkap;
  final String email;
  final String nomorHp;
  final String? profilePhotoUrl;

  const PerawatModel({
    required this.id,
    required this.namaLengkap,
    required this.email,
    required this.nomorHp,
    this.profilePhotoUrl,
  });

  factory PerawatModel.fromJson(Map<String, dynamic> json) {
    return PerawatModel(
      id: (json['id'] as num).toInt(),
      namaLengkap: json['nama_lengkap'] as String,
      email: json['email'] as String,
      nomorHp: json['nomor_hp'] as String,
      profilePhotoUrl: json['profile_photo_url'] as String?,
    );
  }
}

class IbuHamilPerawatModel {
  final bool hasPerawat;
  final PerawatModel? perawat;
  final Map<String, dynamic>? puskesmas;
  final String? message;

  const IbuHamilPerawatModel({
    required this.hasPerawat,
    this.perawat,
    this.puskesmas,
    this.message,
  });

  factory IbuHamilPerawatModel.fromJson(Map<String, dynamic> json) {
    final perawatData = json['perawat'] as Map<String, dynamic>?;
    return IbuHamilPerawatModel(
      hasPerawat: json['has_perawat'] == true,
      perawat: perawatData != null ? PerawatModel.fromJson(perawatData) : null,
      puskesmas: json['puskesmas'] as Map<String, dynamic>?,
      message: json['message'] as String?,
    );
  }
}
