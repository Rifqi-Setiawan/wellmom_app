import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/chatbot/data/datasources/chatbot_remote_datasource.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_conversation_model.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_quota_model.dart';
import 'package:wellmom_app/features/chatbot/data/models/chatbot_status_model.dart';

/// Local chat message for UI display
class ChatMessage {
  final String id;
  final String role; // "user" or "assistant"
  final String content;
  final DateTime createdAt;
  final bool isLoading; // For loading indicator on assistant messages

  const ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    required this.createdAt,
    this.isLoading = false,
  });

  ChatMessage copyWith({
    String? id,
    String? role,
    String? content,
    DateTime? createdAt,
    bool? isLoading,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      role: role ?? this.role,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// State for chatbot
class ChatbotState {
  final List<ChatMessage> messages;
  final int? currentConversationId;
  final bool isLoading;
  final bool isSending;
  final String? error;
  final ChatbotQuotaModel? quota;
  final List<ChatbotConversationModel> conversations;
  final ChatbotStatusModel? status;
  final bool isCheckingStatus;

  const ChatbotState({
    this.messages = const [],
    this.currentConversationId,
    this.isLoading = false,
    this.isSending = false,
    this.error,
    this.quota,
    this.conversations = const [],
    this.status,
    this.isCheckingStatus = false,
  });

  ChatbotState copyWith({
    List<ChatMessage>? messages,
    int? currentConversationId,
    bool? isLoading,
    bool? isSending,
    String? error,
    ChatbotQuotaModel? quota,
    List<ChatbotConversationModel>? conversations,
    ChatbotStatusModel? status,
    bool? isCheckingStatus,
    bool clearError = false,
    bool clearConversationId = false,
  }) {
    return ChatbotState(
      messages: messages ?? this.messages,
      currentConversationId: clearConversationId
          ? null
          : (currentConversationId ?? this.currentConversationId),
      isLoading: isLoading ?? this.isLoading,
      isSending: isSending ?? this.isSending,
      error: clearError ? null : (error ?? this.error),
      quota: quota ?? this.quota,
      conversations: conversations ?? this.conversations,
      status: status ?? this.status,
      isCheckingStatus: isCheckingStatus ?? this.isCheckingStatus,
    );
  }

  /// Check if user can send message
  /// Allow sending if quota is unknown (null) - will get proper error from API
  /// Only block if quota is explicitly 0 or chatbot is not available
  bool get canSendMessage {
    if (isSending) return false;
    if (status != null && !status!.isAvailable) return false;
    if (quota == null) return true; // Allow if quota unknown
    return quota!.remaining > 0;
  }
  
  /// Check if chatbot is available
  bool get isChatbotAvailable => status?.isAvailable ?? true;
  
  /// Get status error message
  String? get statusError => status?.error;
}

/// Welcome message from WellBot
const String welcomeMessage = '''Halo Bunda! 👋 Saya WellBot, asisten kesehatan kehamilan Anda.

Saya siap membantu menjawab pertanyaan seputar:
• Gejala dan perubahan tubuh
• Nutrisi dan makanan
• Olahraga yang aman
• Tanda-tanda bahaya

Silakan tanyakan apa saja! 💕''';

/// ViewModel for chatbot screen
class ChatbotViewModel extends StateNotifier<ChatbotState> {
  final ChatbotRemoteDataSource remoteDataSource;
  final String token;

  ChatbotViewModel({
    required this.remoteDataSource,
    required this.token,
  }) : super(const ChatbotState()) {
    _initializeChat();
  }

  /// Initialize chat with welcome message and check status
  void _initializeChat() {
    final welcomeMsg = ChatMessage(
      id: 'welcome',
      role: 'assistant',
      content: welcomeMessage,
      createdAt: DateTime.now(),
    );
    state = state.copyWith(messages: [welcomeMsg]);
    
    // Check chatbot status first
    checkStatus();
    
    // Fetch quota
    fetchQuota();
  }

  Future<void> checkStatus() async {
    if (token.isEmpty) return;
    
    state = state.copyWith(isCheckingStatus: true);
    try {
      final status = await remoteDataSource.getStatus(token);
      state = state.copyWith(
        status: status,
        isCheckingStatus: false,
      );

      if (!status.isAvailable) {
        final errorMsg = ChatMessage(
          id: 'status_error',
          role: 'assistant',
          content: '⚠️ ${status.error ?? "WellBot sedang tidak tersedia saat ini. Silakan coba lagi nanti, Bunda."}',
          createdAt: DateTime.now(),
        );
        state = state.copyWith(
          messages: [...state.messages, errorMsg],
        );
      }
    } catch (_) {
      state = state.copyWith(isCheckingStatus: false);
    }
  }
  Future<void> fetchQuota() async {
    try {
      final quota = await remoteDataSource.getQuota(token);
      state = state.copyWith(quota: quota);
    } catch (e) {
      // Silently fail for quota fetch
    }
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty || state.isSending) return;

    state = state.copyWith(clearError: true);


    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: 'user',
      content: message.trim(),
      createdAt: DateTime.now(),
    );

    // Add loading placeholder for assistant
    final loadingMessage = ChatMessage(
      id: 'loading',
      role: 'assistant',
      content: '',
      createdAt: DateTime.now(),
      isLoading: true,
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage, loadingMessage],
      isSending: true,
    );

    try {
      final response = await remoteDataSource.sendMessage(
        message.trim(),
        state.currentConversationId,
        token,
      );

      // Remove loading message and add real response
      final updatedMessages = state.messages
          .where((m) => m.id != 'loading')
          .toList();

      final assistantMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: 'assistant',
        content: response.response,
        createdAt: DateTime.now(),
      );

      state = state.copyWith(
        messages: [...updatedMessages, assistantMessage],
        currentConversationId: response.conversationId,
        quota: response.quota,
        isSending: false,
      );
    } on Failure catch (e) {
      // Remove loading message
      final updatedMessages = state.messages
          .where((m) => m.id != 'loading')
          .toList();

      state = state.copyWith(
        messages: updatedMessages,
        error: e.message,
        isSending: false,
      );
    } catch (e) {
      // Remove loading message
      final updatedMessages = state.messages
          .where((m) => m.id != 'loading')
          .toList();

      state = state.copyWith(
        messages: updatedMessages,
        error: 'Terjadi kesalahan. Coba lagi nanti.',
        isSending: false,
      );
    }
  }

  /// Load conversation history
  Future<void> loadConversationHistory(int conversationId) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final history = await remoteDataSource.getConversationHistory(
        conversationId,
        token,
      );

      final messages = history.messages.map((m) => ChatMessage(
        id: m.id.toString(),
        role: m.role,
        content: m.content,
        createdAt: m.createdAt,
      )).toList();

      state = state.copyWith(
        messages: messages,
        currentConversationId: conversationId,
        isLoading: false,
      );
    } on Failure catch (e) {
      state = state.copyWith(
        error: e.message,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Gagal memuat riwayat percakapan.',
        isLoading: false,
      );
    }
  }

  /// Fetch conversation list
  Future<void> fetchConversations() async {
    try {
      final conversations = await remoteDataSource.getConversations(token);
      state = state.copyWith(conversations: conversations);
    } catch (e) {
      // Silently fail for conversations fetch
    }
  }

  /// Start a new conversation
  void startNewConversation() {
    final welcomeMsg = ChatMessage(
      id: 'welcome',
      role: 'assistant',
      content: welcomeMessage,
      createdAt: DateTime.now(),
    );
    state = state.copyWith(
      messages: [welcomeMsg],
      clearConversationId: true,
      clearError: true,
    );
  }

  /// Delete a conversation
  Future<bool> deleteConversation(int conversationId) async {
    try {
      await remoteDataSource.deleteConversation(conversationId, token);
      
      // Remove from list
      final updatedConversations = state.conversations
          .where((c) => c.id != conversationId)
          .toList();
      
      state = state.copyWith(conversations: updatedConversations);
      
      // If current conversation was deleted, start new
      if (state.currentConversationId == conversationId) {
        startNewConversation();
      }
      
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
