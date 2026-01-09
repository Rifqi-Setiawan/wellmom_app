import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/data/datasources/puskesmas_remote_datasource.dart';
import 'package:wellmom_app/features/auth/data/models/puskesmas_model.dart';

/// State for puskesmas selection
class PuskesmasState {
  final List<NearestPuskesmasModel> nearestPuskesmas;
  final NearestPuskesmasModel? selectedPuskesmas;
  final bool isLoading;
  final String? error;

  const PuskesmasState({
    this.nearestPuskesmas = const [],
    this.selectedPuskesmas,
    this.isLoading = false,
    this.error,
  });

  PuskesmasState copyWith({
    List<NearestPuskesmasModel>? nearestPuskesmas,
    NearestPuskesmasModel? selectedPuskesmas,
    bool? isLoading,
    String? error,
    bool clearError = false,
    bool clearSelected = false,
  }) {
    return PuskesmasState(
      nearestPuskesmas: nearestPuskesmas ?? this.nearestPuskesmas,
      selectedPuskesmas: clearSelected
          ? null
          : (selectedPuskesmas ?? this.selectedPuskesmas),
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// ViewModel for puskesmas selection
class PuskesmasViewModel extends StateNotifier<PuskesmasState> {
  final PuskesmasRemoteDataSource puskesmasRemoteDataSource;

  PuskesmasViewModel({
    required this.puskesmasRemoteDataSource,
  }) : super(const PuskesmasState());

  /// Fetch nearest puskesmas
  Future<void> fetchNearestPuskesmas(
    double latitude,
    double longitude,
  ) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
    );

    try {
      final puskesmasList =
          await puskesmasRemoteDataSource.getNearestPuskesmas(
        latitude,
        longitude,
      );

      state = state.copyWith(
        nearestPuskesmas: puskesmasList,
        isLoading: false,
        clearError: true,
      );
    } on Failure catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  /// Select puskesmas
  void selectPuskesmas(NearestPuskesmasModel puskesmas) {
    state = state.copyWith(selectedPuskesmas: puskesmas);
  }

  /// Clear selection
  void clearSelection() {
    state = state.copyWith(clearSelected: true);
  }
}
