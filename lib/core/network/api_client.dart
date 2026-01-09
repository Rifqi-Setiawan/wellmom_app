import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// API base URL
const String apiBaseUrl = 'http://103.191.92.29:8000/api/v1';

/// Provides a configured Dio instance for the app.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Accept': 'application/json',
      },
    ),
  );

  // Add common interceptors here if needed (logging, auth, etc.)
  // dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
});

/// Example: simple GET helper that you can use later.
Future<Response<dynamic>> getExample(WidgetRef ref, String path,
    {Map<String, dynamic>? query}) async {
  final dio = ref.read(dioProvider);
  return dio.get(path, queryParameters: query);
}
