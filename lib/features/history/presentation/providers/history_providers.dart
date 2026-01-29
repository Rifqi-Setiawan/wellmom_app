import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/history/data/datasources/history_remote_datasource.dart';
import 'package:wellmom_app/features/history/presentation/viewmodels/history_view_model.dart';

final historyRemoteDataSourceProvider = Provider<HistoryRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return HistoryRemoteDataSource(dio);
});

final historyViewModelProvider =
    StateNotifierProvider<HistoryViewModel, HistoryState>((ref) {
  final remote = ref.watch(historyRemoteDataSourceProvider);
  return HistoryViewModel(remote: remote);
});
