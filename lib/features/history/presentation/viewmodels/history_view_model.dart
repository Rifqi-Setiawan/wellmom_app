import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/features/history/data/datasources/history_remote_datasource.dart';
import 'package:wellmom_app/features/history/data/models/health_records_response_model.dart';
import 'package:wellmom_app/core/errors/failures.dart';

class HistoryState {
  final bool isLoading;
  final String? error;
  final HealthRecordsResponseModel? recordsData;
  final DateTime? selectedDate;

  const HistoryState({
    this.isLoading = false,
    this.error,
    this.recordsData,
    this.selectedDate,
  });

  HistoryState copyWith({
    bool? isLoading,
    String? error,
    bool clearError = false,
    HealthRecordsResponseModel? recordsData,
    DateTime? selectedDate,
  }) {
    return HistoryState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      recordsData: recordsData ?? this.recordsData,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}

class HistoryViewModel extends StateNotifier<HistoryState> {
  final HistoryRemoteDataSource remote;

  HistoryViewModel({required this.remote}) : super(const HistoryState());

  Future<void> fetchHealthRecordsByDate({
    int? ibuHamilId,
    required DateTime checkupDate,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final resolvedId = ibuHamilId ?? await remote.getIbuHamilId();
      print(
        'HistoryViewModel: Fetching health records for ibuHamilId: $resolvedId, date: $checkupDate',
      );
      final recordsData = await remote.getHealthRecordsByDate(
        ibuHamilId: resolvedId,
        checkupDate: checkupDate,
      );

      print(
        'HistoryViewModel: Fetched ${recordsData.records.length} records',
      );

      state = state.copyWith(
        isLoading: false,
        recordsData: recordsData,
        selectedDate: checkupDate,
      );
    } on Failure catch (e) {
      print('HistoryViewModel: Failure - ${e.message}');
      state = state.copyWith(isLoading: false, error: e.message);
    } catch (e, stackTrace) {
      print('HistoryViewModel: Unexpected error - $e');
      print('HistoryViewModel: Stack trace: $stackTrace');
      state = state.copyWith(
        isLoading: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }
}
