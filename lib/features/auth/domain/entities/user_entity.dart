/// User entity representing a user in the domain layer
class UserEntity {
  final String? id;
  final String namaLengkap;
  final String nik;
  final DateTime tanggalLahir;
  final String alamat;
  final double? latitude;
  final double? longitude;

  const UserEntity({
    this.id,
    required this.namaLengkap,
    required this.nik,
    required this.tanggalLahir,
    required this.alamat,
    this.latitude,
    this.longitude,
  });
}
