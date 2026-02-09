import 'package:freezed_annotation/freezed_annotation.dart';

part 'puskesmas_detail_model.freezed.dart';
part 'puskesmas_detail_model.g.dart';

/// Detail info for Puskesmas used on home screen
@freezed
abstract class PuskesmasDetailModel with _$PuskesmasDetailModel {
  const factory PuskesmasDetailModel({
    required int id,
    required String name,
    String? phone,
    String? address,
    @JsonKey(name: 'building_photo_url') String? buildingPhotoUrl,
    double? latitude,
    double? longitude,
  }) = _PuskesmasDetailModel;

  factory PuskesmasDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PuskesmasDetailModelFromJson(json);
}
