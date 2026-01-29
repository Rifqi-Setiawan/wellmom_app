import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/core/services/location_service.dart';
import 'package:wellmom_app/core/services/wilayah_service.dart';
import 'package:wellmom_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:wellmom_app/features/auth/data/datasources/puskesmas_remote_datasource.dart';
import 'package:wellmom_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/auth/presentation/viewmodels/confirm_registration_view_model.dart';
import 'package:wellmom_app/features/auth/presentation/viewmodels/login_view_model.dart';
import 'package:wellmom_app/features/auth/presentation/viewmodels/medical_data_view_model.dart';
import 'package:wellmom_app/features/auth/presentation/viewmodels/puskesmas_view_model.dart';
import 'package:wellmom_app/features/auth/presentation/viewmodels/register_view_model.dart';

/// Provider for storing ibu hamil id after login
final ibuHamilIdProvider = StateProvider<int?>((ref) => null);

/// Location service provider
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

/// Wilayah service provider
final wilayahServiceProvider = Provider<WilayahService>((ref) {
  final dio = ref.watch(dioProvider);
  return WilayahService(dio);
});

/// Auth remote data source provider
final authRemoteDataSourceProvider =
    Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSourceImpl(dio);
});

/// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final puskesmasRemoteDataSource = ref.watch(puskesmasRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource, puskesmasRemoteDataSource);
});

/// Register view model provider
final registerViewModelProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final locationService = ref.watch(locationServiceProvider);
  final wilayahService = ref.watch(wilayahServiceProvider);
  return RegisterViewModel(
    authRepository: authRepository,
    locationService: locationService,
    wilayahService: wilayahService,
  );
});

/// Login view model provider
final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginViewModel(authRepository: authRepository);
});

/// Medical data view model provider
final medicalDataViewModelProvider =
    StateNotifierProvider<MedicalDataViewModel, MedicalDataState>((ref) {
  return MedicalDataViewModel();
});

/// Puskesmas remote data source provider
final puskesmasRemoteDataSourceProvider =
    Provider<PuskesmasRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return PuskesmasRemoteDataSourceImpl(dio);
});

/// Puskesmas view model provider
final puskesmasViewModelProvider =
    StateNotifierProvider<PuskesmasViewModel, PuskesmasState>((ref) {
  final remoteDataSource = ref.watch(puskesmasRemoteDataSourceProvider);
  return PuskesmasViewModel(puskesmasRemoteDataSource: remoteDataSource);
});

/// Confirm registration view model provider
final confirmRegistrationViewModelProvider =
    StateNotifierProvider<ConfirmRegistrationViewModel, ConfirmRegistrationState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return ConfirmRegistrationViewModel(authRepository: authRepository);
});
