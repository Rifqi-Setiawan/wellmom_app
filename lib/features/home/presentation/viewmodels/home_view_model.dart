import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:wellmom_app/features/home/data/models/puskesmas_detail_model.dart';
import 'package:wellmom_app/core/errors/failures.dart';

class HomeState {
  final bool isLoading;
  final String? error;
  final IbuHamilModel? ibuHamil;
  final PuskesmasDetailModel? puskesmas;

  const HomeState({
    this.isLoading = false,
    this.error,
    this.ibuHamil,
    this.puskesmas,
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
    bool clearError = false,
    IbuHamilModel? ibuHamil,
    PuskesmasDetailModel? puskesmas,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      ibuHamil: ibuHamil ?? this.ibuHamil,
      puskesmas: puskesmas ?? this.puskesmas,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final HomeRemoteDataSource remote;

  HomeViewModel({required this.remote}) : super(const HomeState());

  Future<void> fetchHome() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final ibu = await remote.getIbuHamilMe();
      PuskesmasDetailModel? puskesmas;
      if (ibu.puskesmasId != null) {
        puskesmas = await remote.getPuskesmasDetail(ibu.puskesmasId!);
      }
      state = state.copyWith(
        isLoading: false,
        ibuHamil: ibu,
        puskesmas: puskesmas,
      );
    } on Failure catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }
}
