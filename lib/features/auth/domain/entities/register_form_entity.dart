/// Entity representing registration form data
class RegisterFormEntity {
  final String namaLengkap;
  final String nik;
  final DateTime tanggalLahir;
  final String alamat;
  final double? latitude;
  final double? longitude;

  const RegisterFormEntity({
    required this.namaLengkap,
    required this.nik,
    required this.tanggalLahir,
    required this.alamat,
    this.latitude,
    this.longitude,
  });

  /// Validate the form data
  String? validate() {
    if (namaLengkap.isEmpty) {
      return 'Nama lengkap harus diisi';
    }
    if (nik.isEmpty) {
      return 'NIK harus diisi';
    }
    if (nik.length != 16) {
      return 'NIK harus 16 digit';
    }
    if (alamat.isEmpty) {
      return 'Alamat harus diisi';
    }
    return null;
  }
}
