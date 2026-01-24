import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';
import 'package:wellmom_app/features/forum/data/datasources/forum_remote_datasource.dart';
import 'package:wellmom_app/features/forum/presentation/viewmodels/forum_post_detail_view_model.dart';
import 'package:wellmom_app/features/forum/presentation/viewmodels/forum_recent_posts_view_model.dart';
import 'package:wellmom_app/features/forum/presentation/viewmodels/forum_view_model.dart';

/// Forum remote data source provider
final forumRemoteDataSourceProvider =
    Provider<ForumRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ForumRemoteDataSourceImpl(dio);
});

/// Recent posts view model provider
final forumRecentPostsViewModelProvider =
    StateNotifierProvider.autoDispose<ForumRecentPostsViewModel,
        ForumRecentPostsState>((ref) {
  final remoteDataSource = ref.watch(forumRemoteDataSourceProvider);
  final token = ref.watch(authTokenProvider) ?? '';
  return ForumRecentPostsViewModel(
    remoteDataSource: remoteDataSource,
    token: token,
  );
});

/// Post detail view model provider (requires postId parameter)
final forumPostDetailViewModelProvider =
    StateNotifierProvider.autoDispose.family<
        ForumPostDetailViewModel, ForumPostDetailState, int>((ref, postId) {
  final remoteDataSource = ref.watch(forumRemoteDataSourceProvider);
  final token = ref.watch(authTokenProvider) ?? '';
  return ForumPostDetailViewModel(
    remoteDataSource: remoteDataSource,
    token: token,
    postId: postId,
  );
});

/// Forum view model provider (for main forum screen)
final forumViewModelProvider =
    StateNotifierProvider.autoDispose<ForumViewModel, ForumState>((ref) {
  final remoteDataSource = ref.watch(forumRemoteDataSourceProvider);
  final token = ref.watch(authTokenProvider) ?? '';
  return ForumViewModel(
    remoteDataSource: remoteDataSource,
    token: token,
  );
});
