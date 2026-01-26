import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/health/data/datasources/health_remote_datasource.dart';
import 'package:wellmom_app/features/health/presentation/viewmodels/create_health_record_view_model.dart';

/// Provider for HealthRemoteDataSource
final healthRemoteDataSourceProvider =
    Provider<HealthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return HealthRemoteDataSource(dio);
});

/// Provider for CreateHealthRecordViewModel
final createHealthRecordViewModelProvider =
    StateNotifierProvider.autoDispose<CreateHealthRecordViewModel,
        CreateHealthRecordState>((ref) {
  final remoteDataSource = ref.watch(healthRemoteDataSourceProvider);
  return CreateHealthRecordViewModel(remoteDataSource: remoteDataSource);
});
