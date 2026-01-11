import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
