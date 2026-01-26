import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/health/data/datasources/health_remote_datasource.dart';
import 'package:wellmom_app/features/health/data/models/create_health_record_request_model.dart';
import 'package:wellmom_app/features/health/data/models/health_record_model.dart';

class CreateHealthRecordState {
  final bool isLoading;
  final String? error;
  final HealthRecordModel? createdRecord;

  const CreateHealthRecordState({
    this.isLoading = false,
    this.error,
    this.createdRecord,
  });

  CreateHealthRecordState copyWith({
    bool? isLoading,
    String? error,
    bool clearError = false,
    HealthRecordModel? createdRecord,
    bool clearCreatedRecord = false,
  }) {
    return CreateHealthRecordState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      createdRecord: clearCreatedRecord
          ? null
          : (createdRecord ?? this.createdRecord),
    );
  }
}

class CreateHealthRecordViewModel extends StateNotifier<CreateHealthRecordState> {
  final HealthRemoteDataSource remoteDataSource;

  CreateHealthRecordViewModel({required this.remoteDataSource})
      : super(const CreateHealthRecordState());

  Future<bool> createHealthRecord(
    CreateHealthRecordRequestModel request,
  ) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final record = await remoteDataSource.createHealthRecord(request);
      state = state.copyWith(
        isLoading: false,
        createdRecord: record,
      );
      return true;
    } on Failure catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
      return false;
    }
  }
}
