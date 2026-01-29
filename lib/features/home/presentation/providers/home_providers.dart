import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:wellmom_app/features/home/data/models/ibu_hamil_perawat_model.dart';
import 'package:wellmom_app/features/home/presentation/viewmodels/home_view_model.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRemoteDataSource(dio);
});

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final remote = ref.watch(homeRemoteDataSourceProvider);
  return HomeViewModel(remote: remote);
});

/// Provider for current ibu hamil profile (GET /ibu-hamil/me).
/// Used by Profile page and shares same API as homepage.
final ibuHamilMeProvider = FutureProvider.autoDispose<IbuHamilModel?>((ref) async {
  try {
    final ds = ref.read(homeRemoteDataSourceProvider);
    return await ds.getIbuHamilMe();
  } catch (_) {
    return null;
  }
});

/// Provider for perawat data (GET /ibu-hamil/me/perawat).
/// Used by Konsul page and can be used elsewhere.
final ibuHamilPerawatProvider = FutureProvider.autoDispose<IbuHamilPerawatModel?>((ref) async {
  final ds = ref.read(homeRemoteDataSourceProvider);
  return ds.getIbuHamilPerawat();
});
