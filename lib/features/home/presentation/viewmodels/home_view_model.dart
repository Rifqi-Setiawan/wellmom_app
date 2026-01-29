import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/features/auth/data/models/ibu_hamil_model.dart';
import 'package:wellmom_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:wellmom_app/features/home/data/models/ibu_hamil_perawat_model.dart';
import 'package:wellmom_app/features/home/data/models/latest_perawat_notes_model.dart';
import 'package:wellmom_app/features/home/data/models/puskesmas_detail_model.dart';
import 'package:wellmom_app/features/health/data/models/health_record_model.dart';
import 'package:wellmom_app/core/errors/failures.dart';

class HomeState {
  final bool isLoading;
  final String? error;
  final IbuHamilModel? ibuHamil;
  final PuskesmasDetailModel? puskesmas;
  final HealthRecordModel? latestHealthRecord;
  final LatestPerawatNotesModel? latestPerawatNotes;
  final IbuHamilPerawatModel? ibuHamilPerawat;

  const HomeState({
    this.isLoading = false,
    this.error,
    this.ibuHamil,
    this.puskesmas,
    this.latestHealthRecord,
    this.latestPerawatNotes,
    this.ibuHamilPerawat,
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
    bool clearError = false,
    IbuHamilModel? ibuHamil,
    PuskesmasDetailModel? puskesmas,
    HealthRecordModel? latestHealthRecord,
    LatestPerawatNotesModel? latestPerawatNotes,
    IbuHamilPerawatModel? ibuHamilPerawat,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      ibuHamil: ibuHamil ?? this.ibuHamil,
      puskesmas: puskesmas ?? this.puskesmas,
      latestHealthRecord: latestHealthRecord ?? this.latestHealthRecord,
      latestPerawatNotes: latestPerawatNotes ?? this.latestPerawatNotes,
      ibuHamilPerawat: ibuHamilPerawat ?? this.ibuHamilPerawat,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final HomeRemoteDataSource remote;

  HomeViewModel({required this.remote}) : super(const HomeState());

  Future<void> fetchHome() async {
    print('HomeViewModel: fetchHome() called');
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      print('HomeViewModel: Fetching ibu hamil data...');
      final ibu = await remote.getIbuHamilMe();
      print('HomeViewModel: Ibu hamil data received - nama: ${ibu.namaLengkap}, id: ${ibu.id}');
      
      PuskesmasDetailModel? puskesmas;
      if (ibu.puskesmasId != null) {
        print('HomeViewModel: Fetching puskesmas data for id: ${ibu.puskesmasId}');
        puskesmas = await remote.getPuskesmasDetail(ibu.puskesmasId!);
        print('HomeViewModel: Puskesmas data received - name: ${puskesmas.name}');
      } else {
        print('HomeViewModel: No puskesmas_id, skipping puskesmas fetch');
      }
      
      // Fetch latest health record for metrics
      HealthRecordModel? latestHealthRecord;
      try {
        print('HomeViewModel: Fetching latest health record...');
        latestHealthRecord = await remote.getLatestHealthRecord();
        if (latestHealthRecord != null) {
          print('HomeViewModel: Latest health record received - id: ${latestHealthRecord.id}');
        } else {
          print('HomeViewModel: No latest health record found');
        }
      } catch (e) {
        print('HomeViewModel: Error fetching health record (non-fatal): $e');
        // Silently fail - health records are optional
        latestHealthRecord = null;
      }

      // Fetch latest perawat notes for homepage
      LatestPerawatNotesModel? latestPerawatNotes;
      try {
        latestPerawatNotes = await remote.getLatestPerawatNotes();
      } catch (e) {
        latestPerawatNotes = null;
      }

      // Fetch perawat info
      IbuHamilPerawatModel? ibuHamilPerawat;
      try {
        ibuHamilPerawat = await remote.getIbuHamilPerawat();
      } catch (e) {
        ibuHamilPerawat = null;
      }

      print('HomeViewModel: Updating state with all data...');
      state = state.copyWith(
        isLoading: false,
        ibuHamil: ibu,
        puskesmas: puskesmas,
        latestHealthRecord: latestHealthRecord,
        latestPerawatNotes: latestPerawatNotes,
        ibuHamilPerawat: ibuHamilPerawat,
      );
      print('HomeViewModel: State updated - ibuHamil: ${state.ibuHamil?.namaLengkap}, puskesmas: ${state.puskesmas?.name}');
    } on Failure catch (e) {
      print('HomeViewModel: Failure caught - ${e.message}');
      state = state.copyWith(isLoading: false, error: e.message);
    } catch (e, stackTrace) {
      print('HomeViewModel: Unexpected error - $e');
      print('HomeViewModel: Stack trace: $stackTrace');
      state = state.copyWith(
        isLoading: false,
        error: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }
}
