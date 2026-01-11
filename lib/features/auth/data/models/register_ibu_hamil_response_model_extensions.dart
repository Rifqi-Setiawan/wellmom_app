import 'package:wellmom_app/features/auth/data/models/register_ibu_hamil_response_model.dart';
import 'package:wellmom_app/features/auth/domain/entities/register_ibu_hamil_response_entity.dart';

/// Extension to convert RegisterIbuHamilResponseModel to entity
extension RegisterIbuHamilResponseModelExtensions on RegisterIbuHamilResponseModel {
  RegisterIbuHamilResponseEntity toEntity() {
    return RegisterIbuHamilResponseEntity(
      ibuHamil: IbuHamilBasicEntity(
        id: ibuHamil.id,
        namaLengkap: ibuHamil.namaLengkap,
        nik: ibuHamil.nik,
      ),
      user: UserBasicEntity(
        id: user.id,
        phone: user.phone,
        fullName: user.fullName,
      ),
      accessToken: accessToken,
      tokenType: tokenType,
      message: message,
    );
  }
}
