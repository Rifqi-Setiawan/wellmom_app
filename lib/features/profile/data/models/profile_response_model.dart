/// Response model for GET /api/v1/ibu-hamil/me/profile
class ProfileResponseModel {
  final UserData user;
  final IbuHamilProfileData ibuHamil;

  const ProfileResponseModel({
    required this.user,
    required this.ibuHamil,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
      ibuHamil: IbuHamilProfileData.fromJson(
        json['ibu_hamil'] as Map<String, dynamic>,
      ),
    );
  }
}

class UserData {
  final int id;
  final String email;
  final String phone;
  final String fullName;
  final String role;
  final bool isActive;
  final bool isVerified;

  const UserData({
    required this.id,
    required this.email,
    required this.phone,
    required this.fullName,
    required this.role,
    required this.isActive,
    required this.isVerified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      phone: json['phone'] as String,
      fullName: json['full_name'] as String,
      role: json['role'] as String,
      isActive: json['is_active'] as bool? ?? true,
      isVerified: json['is_verified'] as bool? ?? false,
    );
  }
}

class IbuHamilProfileData {
  final int id;
  final int userId;
  final String namaLengkap;
  final String nik;
  final String dateOfBirth; // YYYY-MM-DD format
  final List<double> location; // [longitude, latitude]
  final String address;
  final String? provinsi;
  final String? kotaKabupaten;
  final String? kelurahan;
  final String? kecamatan;
  final bool isActive;

  const IbuHamilProfileData({
    required this.id,
    required this.userId,
    required this.namaLengkap,
    required this.nik,
    required this.dateOfBirth,
    required this.location,
    required this.address,
    this.provinsi,
    this.kotaKabupaten,
    this.kelurahan,
    this.kecamatan,
    required this.isActive,
  });

  factory IbuHamilProfileData.fromJson(Map<String, dynamic> json) {
    final locationList = json['location'] as List<dynamic>?;
    final location = locationList != null && locationList.length >= 2
        ? [
            (locationList[0] as num).toDouble(),
            (locationList[1] as num).toDouble(),
          ]
        : [0.0, 0.0];

    return IbuHamilProfileData(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      namaLengkap: json['nama_lengkap'] as String,
      nik: json['nik'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      location: location,
      address: json['address'] as String,
      provinsi: json['provinsi'] as String?,
      kotaKabupaten: json['kota_kabupaten'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kecamatan: json['kecamatan'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }
}
