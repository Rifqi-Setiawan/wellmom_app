/// Login response entity for domain layer
class LoginResponseEntity {
  final String accessToken;
  final String tokenType;
  final int userId;
  final int ibuHamilId;
  final String namaLengkap;
  final String email;

  const LoginResponseEntity({
    required this.accessToken,
    required this.tokenType,
    required this.userId,
    required this.ibuHamilId,
    required this.namaLengkap,
    required this.email,
  });
}
