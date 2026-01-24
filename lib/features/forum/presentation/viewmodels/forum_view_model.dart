import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/forum/data/datasources/forum_remote_datasource.dart';
import 'package:wellmom_app/features/forum/data/models/forum_category_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_create_post_request_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_post_full_model.dart';

class ForumState {
  final List<ForumPostFullModel> posts;
  final List<ForumCategoryModel> categories;
  final bool isLoading;
  final bool isLoadingMore;
  final bool isCreatingPost;
  final String? error;
  final int? selectedCategoryId;
  final String searchQuery;
  final bool hasMore;
  final int total;

  const ForumState({
    this.posts = const [],
    this.categories = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.isCreatingPost = false,
    this.error,
    this.selectedCategoryId,
    this.searchQuery = '',
    this.hasMore = false,
    this.total = 0,
  });

  ForumState copyWith({
    List<ForumPostFullModel>? posts,
    List<ForumCategoryModel>? categories,
    bool? isLoading,
    bool? isLoadingMore,
    bool? isCreatingPost,
    String? error,
    int? selectedCategoryId,
    String? searchQuery,
    bool? hasMore,
    int? total,
  }) {
    return ForumState(
      posts: posts ?? this.posts,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isCreatingPost: isCreatingPost ?? this.isCreatingPost,
      error: error,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      searchQuery: searchQuery ?? this.searchQuery,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
    );
  }
}

class ForumViewModel extends StateNotifier<ForumState> {
  final ForumRemoteDataSource remoteDataSource;
  final String token;

  ForumViewModel({
    required this.remoteDataSource,
    required this.token,
  }) : super(const ForumState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.wait([
      fetchCategories(),
      fetchPosts(),
    ]);
  }

  Future<void> fetchCategories() async {
    try {
      final response = await remoteDataSource.getCategories(token);
      state = state.copyWith(categories: response.categories);
    } catch (e) {
      if (e is Failure) {
        state = state.copyWith(error: e.message);
      } else {
        state = state.copyWith(error: 'Gagal memuat kategori: ${e.toString()}');
      }
    }
  }

  Future<void> fetchPosts({bool refresh = false}) async {
    if (refresh) {
      state = state.copyWith(isLoading: true, error: null, posts: []);
    } else {
      state = state.copyWith(isLoadingMore: true);
    }

    try {
      final response = await remoteDataSource.getAllPosts(
        token,
        search: state.searchQuery.isEmpty ? null : state.searchQuery,
        categoryId: state.selectedCategoryId,
        skip: refresh ? 0 : state.posts.length,
        limit: 20,
      );

      state = state.copyWith(
        posts: refresh
            ? response.posts
            : [...state.posts, ...response.posts],
        hasMore: response.hasMore,
        total: response.total,
        isLoading: false,
        isLoadingMore: false,
        error: null,
      );
    } catch (e) {
      if (e is Failure) {
        state = state.copyWith(
          error: e.message,
          isLoading: false,
          isLoadingMore: false,
        );
      } else {
        state = state.copyWith(
          error: 'Gagal memuat post: ${e.toString()}',
          isLoading: false,
          isLoadingMore: false,
        );
      }
    }
  }

  Future<void> searchPosts(String query) async {
    state = state.copyWith(searchQuery: query);
    await fetchPosts(refresh: true);
  }

  Future<void> filterByCategory(int? categoryId) async {
    state = state.copyWith(selectedCategoryId: categoryId);
    await fetchPosts(refresh: true);
  }

  Future<void> createPost({
    required String title,
    required String details,
    required int categoryId,
  }) async {
    state = state.copyWith(isCreatingPost: true, error: null);

    try {
      final request = ForumCreatePostRequestModel(
        title: title,
        details: details,
        categoryId: categoryId,
      );

      final newPost = await remoteDataSource.createPost(request, token);

      // Add new post to the beginning of the list
      state = state.copyWith(
        posts: [newPost, ...state.posts],
        isCreatingPost: false,
        error: null,
      );
    } catch (e) {
      if (e is Failure) {
        state = state.copyWith(
          error: e.message,
          isCreatingPost: false,
        );
      } else {
        state = state.copyWith(
          error: 'Gagal membuat post: ${e.toString()}',
          isCreatingPost: false,
        );
      }
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void refresh() {
    fetchPosts(refresh: true);
  }
}
