import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/kerabat/data/datasources/kerabat_remote_datasource.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_dashboard_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_health_records_response_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_me_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_notification_model.dart'; // KerabatNotificationsResponseModel
import 'package:wellmom_app/features/kerabat/data/models/kerabat_risk_status_model.dart';
import 'package:wellmom_app/features/kerabat/data/models/my_kerabat_item_model.dart';
import 'package:wellmom_app/features/kerabat/data/repositories/kerabat_repository_impl.dart';
import 'package:wellmom_app/features/kerabat/domain/repositories/kerabat_repository.dart';

final kerabatRemoteDataSourceProvider = Provider<KerabatRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return KerabatRemoteDataSourceImpl(dio);
});

final kerabatRepositoryProvider = Provider<KerabatRepository>((ref) {
  final remote = ref.watch(kerabatRemoteDataSourceProvider);
  return KerabatRepositoryImpl(remote);
});

/// Provider for list of connected kerabat (GET my-kerabat). Auto-dispose, refetch on invalidate.
final myKerabatListProvider =
    FutureProvider.autoDispose<List<MyKerabatItemModel>>((ref) async {
  final repo = ref.watch(kerabatRepositoryProvider);
  final result = await repo.getMyKerabat();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (list) => list,
  );
});

/// State providers for kerabat session (set after login-with-invite).
final kerabatIdProvider = StateProvider<int?>((ref) => null);
final kerabatIbuHamilIdProvider = StateProvider<int?>((ref) => null);
final kerabatIbuHamilNameProvider = StateProvider<String?>((ref) => null);

/// Dashboard (GET /kerabat/dashboard). Invalidate to refresh.
final kerabatDashboardProvider =
    FutureProvider.autoDispose<KerabatDashboardModel?>((ref) async {
  final repo = ref.watch(kerabatRepositoryProvider);
  final result = await repo.getDashboard();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (data) => data,
  );
});

/// Health records with pagination. Family: (page, perPage).
final kerabatHealthRecordsProvider = FutureProvider.autoDispose
    .family<KerabatHealthRecordsResponseModel, ({int page, int perPage})>(
  (ref, params) async {
    final repo = ref.watch(kerabatRepositoryProvider);
    final result = await repo.getHealthRecords(
      page: params.page,
      perPage: params.perPage,
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (data) => data,
    );
  },
);

/// Risk status (GET /kerabat/risk-status).
final kerabatRiskStatusProvider =
    FutureProvider.autoDispose<KerabatRiskStatusModel?>((ref) async {
  final repo = ref.watch(kerabatRepositoryProvider);
  final result = await repo.getRiskStatus();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (data) => data,
  );
});

/// Notifications. Family: unreadOnly (bool).
final kerabatNotificationsProvider = FutureProvider.autoDispose
    .family<KerabatNotificationsResponseModel, bool>((ref, unreadOnly) async {
  final repo = ref.watch(kerabatRepositoryProvider);
  final result = await repo.getNotifications(unreadOnly: unreadOnly);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (data) => data,
  );
});

/// Kerabat profile (GET /kerabat/me).
final kerabatMeProvider =
    FutureProvider.autoDispose<KerabatMeModel?>((ref) async {
  final repo = ref.watch(kerabatRepositoryProvider);
  final result = await repo.getKerabatMe();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (data) => data,
  );
});
