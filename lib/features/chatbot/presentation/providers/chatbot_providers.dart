import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/chatbot/data/datasources/chatbot_remote_datasource.dart';
import 'package:wellmom_app/features/chatbot/presentation/viewmodels/chatbot_view_model.dart';

/// Provider for ChatbotRemoteDataSource
final chatbotRemoteDataSourceProvider = Provider<ChatbotRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatbotRemoteDataSourceImpl(dio);
});

/// Provider for storing the auth token
/// This should be set after login
final authTokenProvider = StateProvider<String?>((ref) => null);

/// Provider for ChatbotViewModel
/// Using autoDispose to recreate ViewModel when entering chatbot screen
/// This ensures fresh token is used
final chatbotViewModelProvider =
    StateNotifierProvider.autoDispose<ChatbotViewModel, ChatbotState>((ref) {
  final remoteDataSource = ref.watch(chatbotRemoteDataSourceProvider);
  final token = ref.watch(authTokenProvider) ?? '';
  
  // Debug: log token status when creating ViewModel
  print('ChatbotProvider: Creating ViewModel with token length: ${token.length}');
  if (token.isNotEmpty) {
    print('ChatbotProvider: Token preview: ${token.substring(0, token.length > 20 ? 20 : token.length)}...');
  } else {
    print('ChatbotProvider: WARNING - Token is empty!');
  }
  
  return ChatbotViewModel(
    remoteDataSource: remoteDataSource,
    token: token,
  );
});
