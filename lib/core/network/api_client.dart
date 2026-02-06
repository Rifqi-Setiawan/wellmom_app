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
        // Log request
        print('[DIO] Request: ${options.method} ${options.path}');
        
        // Get token from provider first
        var token = ref.read(authTokenProvider);
        final tokenFromProvider = token;
        print('[DIO] Token from provider: ${tokenFromProvider?.substring(0, tokenFromProvider.length > 20 ? 20 : tokenFromProvider.length) ?? "NULL"}... (length: ${tokenFromProvider?.length ?? 0})');
        
        // Fallback to storage if provider is empty
        if (token == null || token.isEmpty) {
          token = await AuthStorageService.getAccessToken();
          if (token != null) {
            final tokenPreview = token.length > 20 ? token.substring(0, 20) : token;
            print('[DIO] Token from storage: $tokenPreview... (length: ${token.length})');
          } else {
            print('[DIO] Token from storage: NULL');
          }
          
          // Sync to provider if found in storage
          if (token != null && token.isNotEmpty && ref.read(authTokenProvider) == null) {
            ref.read(authTokenProvider.notifier).state = token;
            print('[DIO] Token dari storage disinkronkan ke provider');
          }
        }
        
        // Trim token
        token = token?.trim();
        
        // Set Authorization header
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
          // Log token hash untuk tracking perubahan token
          print('[DIO] Authorization header set for ${options.path}');
          print('[DIO] Token length: ${token.length}, Token hash: ${token.hashCode}');
        } else {
          print('[DIO] WARNING - No token for ${options.path}');
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
