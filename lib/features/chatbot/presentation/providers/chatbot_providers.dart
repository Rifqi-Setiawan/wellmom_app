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
final chatbotViewModelProvider =
    StateNotifierProvider<ChatbotViewModel, ChatbotState>((ref) {
  final remoteDataSource = ref.watch(chatbotRemoteDataSourceProvider);
  final token = ref.watch(authTokenProvider) ?? '';
  
  return ChatbotViewModel(
    remoteDataSource: remoteDataSource,
    token: token,
  );
});
