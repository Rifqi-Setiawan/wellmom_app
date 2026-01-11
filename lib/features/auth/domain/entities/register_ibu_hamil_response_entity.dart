/// Entity for ibu hamil registration response
class RegisterIbuHamilResponseEntity {
  final IbuHamilBasicEntity ibuHamil;
  final UserBasicEntity user;
  final String accessToken;
  final String tokenType;
  final String message;

  const RegisterIbuHamilResponseEntity({
    required this.ibuHamil,
    required this.user,
    required this.accessToken,
    required this.tokenType,
    required this.message,
  });
}

/// Basic ibu hamil entity from registration response
class IbuHamilBasicEntity {
  final int id;
  final String namaLengkap;
  final String nik;

  const IbuHamilBasicEntity({
    required this.id,
    required this.namaLengkap,
    required this.nik,
  });
}

/// Basic user entity from registration response
class UserBasicEntity {
  final int id;
  final String phone;
  final String fullName;

  const UserBasicEntity({
    required this.id,
    required this.phone,
    required this.fullName,
  });
}
