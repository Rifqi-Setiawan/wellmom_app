import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/chat/data/models/chat_conversation_model.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatConversationModel>> getConversations();
  Future<ChatConversationModel?> getConversation(int conversationId);
  Future<List<ChatMessageModel>> getMessages(
    int conversationId, {
    int skip = 0,
    int limit = 30,
  });
  Future<ChatMessageModel> sendMessage({
    int? conversationId,
    int? perawatId,
    required String messageText,
  });
  Future<void> markRead(int conversationId);
  Future<int> getUnreadCount(int conversationId);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final Dio dio;

  ChatRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ChatConversationModel>> getConversations() async {
    try {
      final response = await dio.get('/chat/conversations');
      List<dynamic> list;
      if (response.data is List) {
        list = response.data as List;
      } else if (response.data is Map) {
        final data = response.data as Map<String, dynamic>;
        if (data['conversations'] is List) {
          list = data['conversations'] as List;
        } else if (data['data'] is List) {
          list = data['data'] as List;
        } else {
          throw ServerFailure('Format respons tidak valid');
        }
      } else {
        throw ServerFailure('Format respons tidak valid');
      }
      return list
          .map((e) => ChatConversationModel.fromJson(
                Map<String, dynamic>.from(e as Map),
              ))
          .toList();
    } on DioException catch (e) {
      throw _mapError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<ChatConversationModel?> getConversation(int conversationId) async {
    try {
      final response = await dio.get('/chat/conversations/$conversationId');
      if (response.data is! Map) return null;
      return ChatConversationModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw _mapError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<List<ChatMessageModel>> getMessages(
    int conversationId, {
    int skip = 0,
    int limit = 30,
  }) async {
    try {
      final response = await dio.get(
        '/chat/conversations/$conversationId/messages',
        queryParameters: {'skip': skip, 'limit': limit},
      );
      List<dynamic> list;
      if (response.data is List) {
        list = response.data as List;
      } else if (response.data is Map && (response.data as Map).containsKey('messages')) {
        list = (response.data as Map)['messages'] as List;
      } else {
        throw ServerFailure('Format respons tidak valid');
      }
      return list
          .map((e) => ChatMessageModel.fromJson(
                Map<String, dynamic>.from(e as Map),
              ))
          .toList();
    } on DioException catch (e) {
      throw _mapError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<ChatMessageModel> sendMessage({
    int? conversationId,
    int? perawatId,
    required String messageText,
  }) async {
    try {
      final body = <String, dynamic>{
        'message_text': messageText,
        if (conversationId != null) 'conversation_id': conversationId,
        if (perawatId != null) 'perawat_id': perawatId,
      };
      final response = await dio.post('/chat/messages', data: body);
      if (response.data is! Map) {
        throw ServerFailure('Format respons tidak valid');
      }
      return ChatMessageModel.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      throw _mapError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<void> markRead(int conversationId) async {
    try {
      await dio.post('/chat/conversations/$conversationId/mark-read');
    } on DioException catch (e) {
      throw _mapError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  @override
  Future<int> getUnreadCount(int conversationId) async {
    try {
      final response = await dio.get(
        '/chat/conversations/$conversationId/unread-count',
      );
      if (response.data is Map && (response.data as Map).containsKey('unread_count')) {
        return ((response.data as Map)['unread_count'] as num?)?.toInt() ?? 0;
      }
      if (response.data is num) return (response.data as num).toInt();
      return 0;
    } on DioException catch (e) {
      throw _mapError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure(e.toString());
    }
  }

  Failure _mapError(DioException e) {
    if (e.response == null) {
      return NetworkFailure(e.message ?? 'Koneksi jaringan bermasalah');
    }
    final data = e.response!.data;
    final detail = data is Map ? (data['detail'] ?? data['message']) : null;
    return ServerFailure(detail?.toString() ?? 'Terjadi kesalahan');
  }
}
