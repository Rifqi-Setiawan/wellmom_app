import 'package:freezed_annotation/freezed_annotation.dart';

part 'puskesmas_model.freezed.dart';
part 'puskesmas_model.g.dart';

/// Puskesmas basic info model
@freezed
abstract class PuskesmasModel with _$PuskesmasModel {
  const factory PuskesmasModel({
    required int id,
    required String name,
    @JsonKey(name: 'registration_status') required String registrationStatus,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    String? phone,
    String? email,
    String? address,
  }) = _PuskesmasModel;

  factory PuskesmasModel.fromJson(Map<String, dynamic> json) =>
      _$PuskesmasModelFromJson(json);
}

/// Nearest puskesmas response model
@freezed
abstract class NearestPuskesmasModel with _$NearestPuskesmasModel {
  const factory NearestPuskesmasModel({
    required PuskesmasModel puskesmas,
    @JsonKey(name: 'distance_km') required double distanceKm,
    required String address,
  }) = _NearestPuskesmasModel;

  factory NearestPuskesmasModel.fromJson(Map<String, dynamic> json) =>
      _$NearestPuskesmasModelFromJson(json);
}
