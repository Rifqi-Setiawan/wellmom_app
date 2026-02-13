import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/forum/data/models/forum_category_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_create_post_request_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_like_response_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_post_detail_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_post_full_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_recent_posts_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_replies_response_model.dart';
import 'package:wellmom_app/features/forum/data/models/forum_reply_model.dart';

/// Abstract remote data source for forum
abstract class ForumRemoteDataSource {
  Future<ForumRecentPostsModel> getRecentPosts(String token);
  Future<ForumPostDetailModel> getPostDetail(int postId, String token);
  Future<ForumLikeResponseModel> likePost(int postId, String token);
  Future<ForumReplyModel> replyPost(
      int postId, String replyText, String token);
  Future<ForumRepliesResponseModel> getReplies(int postId, String token);
  Future<ForumCategoriesResponseModel> getCategories(String token);
  Future<ForumPostsResponseModel> getAllPosts(
    String token, {
    String? search,
    int? categoryId,
    int skip = 0,
    int limit = 20,
  });
  Future<ForumPostFullModel> createPost(
    ForumCreatePostRequestModel request,
    String token,
  );
}

class ForumRemoteDataSourceImpl implements ForumRemoteDataSource {
  final Dio dio;

  ForumRemoteDataSourceImpl(this.dio);

  /// Helper to create authorization headers
  Map<String, String> _authHeaders(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

  @override
  Future<ForumRecentPostsModel> getRecentPosts(String token) async {
    try {
      final response = await dio.get(
        '/forum/recent',
        options: Options(headers: _authHeaders(token)),
      );

      return ForumRecentPostsModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ForumPostDetailModel> getPostDetail(
      int postId, String token) async {
    try {
      final response = await dio.get(
        '/forum/$postId',
        options: Options(headers: _authHeaders(token)),
      );

      return ForumPostDetailModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ForumLikeResponseModel> likePost(int postId, String token) async {
    try {
      final response = await dio.post(
        '/forum/$postId/like',
        options: Options(headers: _authHeaders(token)),
      );

      return ForumLikeResponseModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ForumReplyModel> replyPost(
      int postId, String replyText, String token) async {
    try {
      final response = await dio.post(
        '/forum/$postId/replies',
        data: {'reply_text': replyText},
        options: Options(headers: _authHeaders(token)),
      );

      // Response is ForumRepliesResponseModel, get the first reply
      final repliesResponse = ForumRepliesResponseModel.fromJson(
          response.data as Map<String, dynamic>);
      
      if (repliesResponse.replies.isEmpty) {
        throw ServerFailure('Balasan tidak berhasil dibuat');
      }
      
      // Return the first reply (the newly created one)
      return repliesResponse.replies.first;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ForumRepliesResponseModel> getReplies(
      int postId, String token) async {
    try {
      final response = await dio.get(
        '/forum/$postId/replies',
        options: Options(headers: _authHeaders(token)),
      );

      return ForumRepliesResponseModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ForumCategoriesResponseModel> getCategories(String token) async {
    try {
      final response = await dio.get(
        '/forum/categories',
        options: Options(headers: _authHeaders(token)),
      );

      return ForumCategoriesResponseModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ForumPostsResponseModel> getAllPosts(
    String token, {
    String? search,
    int? categoryId,
    int skip = 0,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'skip': skip,
        'limit': limit,
      };
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }
      if (categoryId != null) {
        queryParams['category_id'] = categoryId;
      }

      final response = await dio.get(
        '/forum',
        queryParameters: queryParams,
        options: Options(headers: _authHeaders(token)),
      );

      return ForumPostsResponseModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ForumPostFullModel> createPost(
    ForumCreatePostRequestModel request,
    String token,
  ) async {
    try {
      final response = await dio.post(
        '/forum',
        data: request.toJson(),
        options: Options(headers: _authHeaders(token)),
      );

      return ForumPostFullModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  /// Handle Dio errors and convert to appropriate Failures
  Failure _handleDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;

      switch (statusCode) {
        case 401:
          return ServerFailure('Sesi habis. Silakan login ulang.');
        case 403:
          return ServerFailure(
              detail?.toString() ?? 'Akses ditolak.');
        case 404:
          return ServerFailure(
              detail?.toString() ?? 'Post tidak ditemukan.');
        case 422:
          return ServerFailure(
              detail?.toString() ?? 'Data tidak valid.');
        case 500:
        case 502:
        case 503:
          return ServerFailure(
              detail?.toString() ?? 'Server sedang sibuk. Coba lagi nanti.');
        default:
          return ServerFailure(
              detail?.toString() ?? 'Error $statusCode: Terjadi kesalahan pada server.');
      }
    } else {
      return NetworkFailure('Koneksi bermasalah. Periksa internet Anda.');
    }
  }
}
