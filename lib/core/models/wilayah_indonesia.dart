/// Models for Indonesia administrative regions (Provinsi, Kota/Kab, Kecamatan)

class Provinsi {
  final String id;
  final String name;

  const Provinsi({
    required this.id,
    required this.name,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}

class KotaKabupaten {
  final String id;
  final String provinceId;
  final String name;

  const KotaKabupaten({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  factory KotaKabupaten.fromJson(Map<String, dynamic> json) {
    return KotaKabupaten(
      id: json['id'] as String,
      provinceId: json['province_id'] as String,
      name: json['name'] as String,
    );
  }
}

class Kecamatan {
  final String id;
  final String regencyId;
  final String name;

  const Kecamatan({
    required this.id,
    required this.regencyId,
    required this.name,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) {
    return Kecamatan(
      id: json['id'] as String,
      regencyId: json['regency_id'] as String,
      name: json['name'] as String,
    );
  }
}
