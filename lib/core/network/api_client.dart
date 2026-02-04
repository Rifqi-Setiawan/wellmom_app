import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';

/// API base URL
const String apiBaseUrl = 'http://103.191.92.29:8000/api/v1';

/// Provides a configured Dio instance for the app.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60), // Increased for AI responses
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // Add authentication interceptor: pakai token dari provider, fallback dari storage
  // Header harus persis "Authorization" (bukan authorization/Autorization) dan nilai "Bearer <token>"
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        var token = ref.read(authTokenProvider);
        if (token == null || token.isEmpty) {
          token = await AuthStorageService.getAccessToken();
          if (token != null && token.isNotEmpty && ref.read(authTokenProvider) == null) {
            ref.read(authTokenProvider.notifier).state = token;
          }
        }
        token = token?.trim();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
          print('API: Authorization header set for ${options.path} (token length: ${token.length})');
        } else {
          print('API: WARNING - No token for ${options.path}');
        }
        handler.next(options);
      },
    ),
  );

  // Add logging interceptor for debugging
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    error: true,
  ));

  return dio;
});

/// Example: simple GET helper that you can use later.
Future<Response<dynamic>> getExample(WidgetRef ref, String path,
    {Map<String, dynamic>? query}) async {
  final dio = ref.read(dioProvider);
  return dio.get(path, queryParameters: query);
}
