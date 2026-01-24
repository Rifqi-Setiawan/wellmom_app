import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:wellmom_app/features/home/presentation/viewmodels/home_view_model.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRemoteDataSource(dio);
});

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final remote = ref.watch(homeRemoteDataSourceProvider);
  return HomeViewModel(remote: remote);
});
