import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:wellmom_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:wellmom_app/features/profile/presentation/viewmodels/edit_profile_view_model.dart';
import 'package:wellmom_app/features/profile/presentation/viewmodels/health_profile_view_model.dart';

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ProfileRemoteDataSource(dio);
});

final editProfileViewModelProvider =
    StateNotifierProvider.autoDispose<EditProfileViewModel, EditProfileState>((ref) {
  final profileDataSource = ref.watch(profileRemoteDataSourceProvider);
  final locationService = ref.watch(locationServiceProvider);
  final wilayahService = ref.watch(wilayahServiceProvider);
  return EditProfileViewModel(
    profileDataSource: profileDataSource,
    locationService: locationService,
    wilayahService: wilayahService,
  );
});

final healthProfileViewModelProvider =
    StateNotifierProvider.autoDispose<HealthProfileViewModel, HealthProfileState>((ref) {
  final profileDataSource = ref.watch(profileRemoteDataSourceProvider);
  return HealthProfileViewModel(profileDataSource: profileDataSource);
});
