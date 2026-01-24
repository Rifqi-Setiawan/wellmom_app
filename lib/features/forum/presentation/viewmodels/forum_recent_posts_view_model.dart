import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/forum/data/datasources/forum_remote_datasource.dart';
import 'package:wellmom_app/features/forum/data/models/forum_post_model.dart';

/// State for recent forum posts
class ForumRecentPostsState {
  final List<ForumPostModel> posts;
  final bool isLoading;
  final String? error;
  final int total;
  final bool hasMore;

  const ForumRecentPostsState({
    this.posts = const [],
    this.isLoading = false,
    this.error,
    this.total = 0,
    this.hasMore = false,
  });

  ForumRecentPostsState copyWith({
    List<ForumPostModel>? posts,
    bool? isLoading,
    String? error,
    int? total,
    bool? hasMore,
    bool clearError = false,
  }) {
    return ForumRecentPostsState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      total: total ?? this.total,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// ViewModel for recent forum posts
class ForumRecentPostsViewModel
    extends StateNotifier<ForumRecentPostsState> {
  final ForumRemoteDataSource remoteDataSource;
  final String token;

  ForumRecentPostsViewModel({
    required this.remoteDataSource,
    required this.token,
  }) : super(const ForumRecentPostsState()) {
    fetchRecentPosts();
  }

  /// Fetch recent posts
  Future<void> fetchRecentPosts() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final response = await remoteDataSource.getRecentPosts(token);
      state = state.copyWith(
        posts: response.posts,
        total: response.total,
        hasMore: response.hasMore,
        isLoading: false,
      );
    } on Failure catch (e) {
      state = state.copyWith(
        error: e.message,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Terjadi kesalahan: ${e.toString()}',
        isLoading: false,
      );
    }
  }

  /// Refresh posts
  Future<void> refresh() async {
    await fetchRecentPosts();
  }
}
