import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/forum/data/datasources/forum_remote_datasource.dart';
import 'package:wellmom_app/features/forum/data/models/forum_post_detail_model.dart';

/// State for forum post detail
class ForumPostDetailState {
  final ForumPostDetailModel? post;
  final bool isLoading;
  final bool isLiking;
  final bool isReplying;
  final String? error;

  const ForumPostDetailState({
    this.post,
    this.isLoading = false,
    this.isLiking = false,
    this.isReplying = false,
    this.error,
  });

  ForumPostDetailState copyWith({
    ForumPostDetailModel? post,
    bool? isLoading,
    bool? isLiking,
    bool? isReplying,
    String? error,
    bool clearError = false,
  }) {
    return ForumPostDetailState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      isLiking: isLiking ?? this.isLiking,
      isReplying: isReplying ?? this.isReplying,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// ViewModel for forum post detail
class ForumPostDetailViewModel
    extends StateNotifier<ForumPostDetailState> {
  final ForumRemoteDataSource remoteDataSource;
  final String token;
  final int postId;

  ForumPostDetailViewModel({
    required this.remoteDataSource,
    required this.token,
    required this.postId,
  }) : super(const ForumPostDetailState()) {
    fetchPostDetail();
  }

  /// Fetch post detail
  Future<void> fetchPostDetail() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final post = await remoteDataSource.getPostDetail(postId, token);
      state = state.copyWith(
        post: post,
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

  /// Like/unlike post
  Future<void> toggleLike() async {
    if (state.post == null || state.isLiking) return;

    state = state.copyWith(isLiking: true, clearError: true);

    try {
      final response = await remoteDataSource.likePost(postId, token);
      
      // Update post with new like status
      if (state.post != null) {
        final updatedPost = state.post!.copyWith(
          isLiked: response.isLiked,
          likeCount: response.likeCount,
        );
        state = state.copyWith(
          post: updatedPost,
          isLiking: false,
        );
      }
    } on Failure catch (e) {
      state = state.copyWith(
        error: e.message,
        isLiking: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Terjadi kesalahan: ${e.toString()}',
        isLiking: false,
      );
    }
  }

  /// Reply to post
  Future<void> replyPost(String replyText) async {
    if (state.post == null || state.isReplying || replyText.trim().isEmpty) {
      return;
    }

    state = state.copyWith(isReplying: true, clearError: true);

    try {
      final newReply = await remoteDataSource.replyPost(
        postId,
        replyText.trim(),
        token,
      );

      // Add new reply to the list
      if (state.post != null) {
        final updatedReplies = [newReply, ...state.post!.replies];
        final updatedPost = state.post!.copyWith(
          replies: updatedReplies,
          replyCount: state.post!.replyCount + 1,
        );
        state = state.copyWith(
          post: updatedPost,
          isReplying: false,
        );
      }
    } on Failure catch (e) {
      state = state.copyWith(
        error: e.message,
        isReplying: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Terjadi kesalahan: ${e.toString()}',
        isReplying: false,
      );
    }
  }

  /// Refresh post detail
  Future<void> refresh() async {
    await fetchPostDetail();
  }
}
