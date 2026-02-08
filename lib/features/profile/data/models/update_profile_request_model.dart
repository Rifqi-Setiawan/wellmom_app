/// Request model for PATCH /api/v1/ibu-hamil/me/profile/identitas
class UpdateProfileRequestModel {
  final String namaLengkap;
  final String nik;
  final String dateOfBirth; // YYYY-MM-DD format
  final String address;
  final String? provinsi;
  final String? kotaKabupaten;
  final String? kelurahan;
  final String? kecamatan;
  final List<double> location; // [longitude, latitude]

  const UpdateProfileRequestModel({
    required this.namaLengkap,
    required this.nik,
    required this.dateOfBirth,
    required this.address,
    this.provinsi,
    this.kotaKabupaten,
    this.kelurahan,
    this.kecamatan,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama_lengkap': namaLengkap,
      'nik': nik,
      'date_of_birth': dateOfBirth,
      'address': address,
      if (provinsi != null) 'provinsi': provinsi,
      if (kotaKabupaten != null) 'kota_kabupaten': kotaKabupaten,
      if (kelurahan != null) 'kelurahan': kelurahan,
      if (kecamatan != null) 'kecamatan': kecamatan,
      'location': location,
    };
  }
}
