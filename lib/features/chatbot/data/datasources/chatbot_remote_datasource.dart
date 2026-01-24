import 'package:dio/dio.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_conversation_model.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_history_model.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_quota_model.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_send_response_model.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_status_model.dart';

/// Error messages in Indonesian
const chatbotErrors = {
  'QUOTA_EXCEEDED': 'Batas penggunaan harian habis. Coba lagi besok ya, Bunda!',
  'RATE_LIMITED': 'Terlalu cepat, Bunda. Tunggu sebentar ya...',
  'NETWORK_ERROR': 'Koneksi bermasalah. Periksa internet Anda.',
  'SERVER_ERROR': 'Server sedang sibuk. Coba lagi nanti.',
  'UNAUTHORIZED': 'Sesi habis. Silakan login ulang.',
  'MODEL_NOT_FOUND': 'Model AI sedang tidak tersedia. Coba lagi nanti, Bunda.',
  'API_KEY_MISSING': 'Konfigurasi AI belum lengkap. Hubungi administrator.',
};

/// Abstract remote data source for chatbot
abstract class ChatbotRemoteDataSource {
  Future<ChatbotSendResponseModel> sendMessage(
      String message, int? conversationId, String token);
  Future<List<ChatbotConversationModel>> getConversations(String token,
      {int skip = 0, int limit = 20});
  Future<ChatbotHistoryModel> getConversationHistory(
      int conversationId, String token);
  Future<ChatbotQuotaModel> getQuota(String token);
  Future<void> deleteConversation(int conversationId, String token);
  Future<ChatbotStatusModel> getStatus(String token);
}

/// Implementation of ChatbotRemoteDataSource
class ChatbotRemoteDataSourceImpl implements ChatbotRemoteDataSource {
  final Dio dio;

  ChatbotRemoteDataSourceImpl(this.dio);

  /// Helper to create authorization headers
  Map<String, String> _authHeaders(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

  @override
  Future<ChatbotSendResponseModel> sendMessage(
      String message, int? conversationId, String token) async {
    try {
      String endpoint = '/chatbot/send';
      if (conversationId != null) {
        endpoint += '?conversation_id=$conversationId';
      }

      final response = await dio.post(
        endpoint,
        data: {'message': message},
        options: Options(headers: _authHeaders(token)),
      );

      return ChatbotSendResponseModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<List<ChatbotConversationModel>> getConversations(String token,
      {int skip = 0, int limit = 20}) async {
    try {
      final response = await dio.get(
        '/chatbot/conversations',
        queryParameters: {'skip': skip, 'limit': limit},
        options: Options(headers: _authHeaders(token)),
      );

      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) =>
              ChatbotConversationModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ChatbotHistoryModel> getConversationHistory(
      int conversationId, String token) async {
    try {
      final response = await dio.get(
        '/chatbot/conversations/$conversationId',
        options: Options(headers: _authHeaders(token)),
      );

      return ChatbotHistoryModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ChatbotQuotaModel> getQuota(String token) async {
    try {
      final response = await dio.get(
        '/chatbot/quota',
        options: Options(headers: _authHeaders(token)),
      );

      return ChatbotQuotaModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteConversation(int conversationId, String token) async {
    try {
      await dio.delete(
        '/chatbot/conversations/$conversationId',
        options: Options(headers: _authHeaders(token)),
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is Failure) rethrow;
      throw UnknownFailure('Terjadi kesalahan: ${e.toString()}');
    }
  }

  @override
  Future<ChatbotStatusModel> getStatus(String token) async {
    try {
      final response = await dio.get(
        '/chatbot/status',
        options: Options(headers: _authHeaders(token)),
      );
      return ChatbotStatusModel.fromJson(
          response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      // If status endpoint fails, return unavailable status
      print('Failed to get chatbot status: ${e.message}');
      print('Status code: ${e.response?.statusCode}');
      print('Response: ${e.response?.data}');
      
      // If 401, token is invalid
      if (e.response?.statusCode == 401) {
        return const ChatbotStatusModel(
          isAvailable: false,
          apiKeyConfigured: true,
          error: 'Sesi habis. Silakan login ulang.',
        );
      }
      
      return const ChatbotStatusModel(
        isAvailable: false,
        apiKeyConfigured: false,
        error: 'Tidak dapat memeriksa status chatbot',
      );
    } catch (e) {
      return const ChatbotStatusModel(
        isAvailable: false,
        apiKeyConfigured: false,
        error: 'Terjadi kesalahan saat memeriksa status',
      );
    }
  }

  /// Handle Dio errors and convert to appropriate Failures
  Failure _handleDioError(DioException e) {
    // Debug: print error details
    print('Chatbot API Error: ${e.type}');
    print('Status code: ${e.response?.statusCode}');
    print('Response data: ${e.response?.data}');
    print('Request path: ${e.requestOptions.path}');
    print('Error message: ${e.message}');
    
    // Handle timeout errors
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return NetworkFailure('Koneksi timeout. Coba lagi, Bunda.');
    }
    
    // Handle connection errors
    if (e.type == DioExceptionType.connectionError) {
      return NetworkFailure(chatbotErrors['NETWORK_ERROR']!);
    }
    
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;
      final detail = responseData is Map ? responseData['detail'] : null;

      switch (statusCode) {
        case 401:
          return ServerFailure(chatbotErrors['UNAUTHORIZED']!);
        case 403:
          // Check if quota exceeded
          if (detail != null &&
              (detail.toString().contains('quota') ||
                  detail.toString().contains('batas') ||
                  detail.toString().contains('limit'))) {
            return ServerFailure(chatbotErrors['QUOTA_EXCEEDED']!);
          }
          return ServerFailure(
              detail?.toString() ?? 'Akses ditolak.');
        case 404:
          return ServerFailure(
              detail?.toString() ?? 'Endpoint tidak ditemukan: ${e.requestOptions.path}');
        case 422:
          // Validation error
          return ServerFailure(
              detail?.toString() ?? 'Data tidak valid.');
        case 429:
          return ServerFailure(chatbotErrors['RATE_LIMITED']!);
        case 500:
        case 502:
        case 503:
          // Check for specific AI model errors
          final detailStr = detail?.toString().toLowerCase() ?? '';
          if (detailStr.contains('model') && 
              (detailStr.contains('tidak ditemukan') || 
               detailStr.contains('not found') ||
               detailStr.contains('unavailable'))) {
            return ServerFailure(chatbotErrors['MODEL_NOT_FOUND']!);
          }
          if (detailStr.contains('api key') || 
              detailStr.contains('api_key') ||
              detailStr.contains('gemini')) {
            return ServerFailure(chatbotErrors['API_KEY_MISSING']!);
          }
          // Return the actual error message from backend if available
          return ServerFailure(
              detail?.toString() ?? chatbotErrors['SERVER_ERROR']!);
        default:
          return ServerFailure(
              detail?.toString() ?? 'Error $statusCode: Terjadi kesalahan pada server.');
      }
    } else {
      return NetworkFailure(chatbotErrors['NETWORK_ERROR']!);
    }
  }
}
