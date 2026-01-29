import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/kerabat/data/datasources/kerabat_remote_datasource.dart';
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
