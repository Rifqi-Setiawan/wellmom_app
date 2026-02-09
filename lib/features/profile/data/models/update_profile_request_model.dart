/// Request model for PATCH /api/v1/ibu-hamil/me/profile/identitas
/// Backend: All fields are optional, but we require essential fields for better UX
class UpdateProfileRequestModel {
  final String? namaLengkap;
  final String? nik;
  final String? dateOfBirth; // YYYY-MM-DD format
  final String? address;
  final String? provinsi;
  final String? kotaKabupaten;
  final String? kelurahan;
  final String? kecamatan;
  final List<double>? location; // [longitude, latitude]

  const UpdateProfileRequestModel({
    this.namaLengkap,
    this.nik,
    this.dateOfBirth,
    this.address,
    this.provinsi,
    this.kotaKabupaten,
    this.kelurahan,
    this.kecamatan,
    this.location,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    
    if (namaLengkap != null && namaLengkap!.isNotEmpty) {
      json['nama_lengkap'] = namaLengkap;
    }
    if (nik != null && nik!.isNotEmpty) {
      json['nik'] = nik;
    }
    if (dateOfBirth != null && dateOfBirth!.isNotEmpty) {
      json['date_of_birth'] = dateOfBirth;
    }
    if (address != null && address!.isNotEmpty) {
      json['address'] = address;
    }
    if (provinsi != null && provinsi!.isNotEmpty) {
      json['provinsi'] = provinsi;
    }
    if (kotaKabupaten != null && kotaKabupaten!.isNotEmpty) {
      json['kota_kabupaten'] = kotaKabupaten;
    }
    if (kelurahan != null && kelurahan!.isNotEmpty) {
      json['kelurahan'] = kelurahan;
    }
    if (kecamatan != null && kecamatan!.isNotEmpty) {
      json['kecamatan'] = kecamatan;
    }
    // Only include location if it's valid (2 elements: [longitude, latitude])
    if (location != null && 
        location!.length == 2 && 
        location![0] >= -180 && location![0] <= 180 && // longitude
        location![1] >= -90 && location![1] <= 90) { // latitude
      json['location'] = location;
    }
    
    return json;
  }
}
