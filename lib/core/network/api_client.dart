import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/storage/auth_storage_service.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';

const String apiBaseUrl = 'http://103.191.92.29:8000/api/v1';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

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
        }

        handler.next(options);
      },
    ),
  );

  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  return dio;
});
