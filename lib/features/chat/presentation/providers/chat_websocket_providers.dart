import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';
import 'package:wellmom_app/features/chat/data/services/chat_websocket_service.dart';
import 'package:wellmom_app/features/chat/presentation/providers/chat_providers.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';

/// Holds merged messages: initial from REST + new messages from WebSocket (real-time).
/// Deduplicates by message.id. Use for KonsulChatScreen when conversationId is set.
final chatMessagesWithWsProvider =
    StateNotifierProvider.autoDispose.family<
        ChatMessagesWithWsNotifier,
        AsyncValue<List<ChatMessageModel>>,
        int>((ref, conversationId) {
  return ChatMessagesWithWsNotifier(ref, conversationId);
});

class ChatMessagesWithWsNotifier
    extends StateNotifier<AsyncValue<List<ChatMessageModel>>> {
  ChatMessagesWithWsNotifier(this._ref, this.conversationId)
      : super(const AsyncValue.loading()) {
    _loadAndConnect();
    _ref.onDispose(() {
      _wsSubscription?.cancel();
      _ws?.dispose();
    });
  }

  final Ref _ref;
  final int conversationId;

  ChatWebSocketService? _ws;
  StreamSubscription<ChatMessageModel>? _wsSubscription;

  Future<void> _loadAndConnect() async {
    final repo = _ref.read(chatRepositoryProvider);
    final result = await repo.getMessages(conversationId);
    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (list) {
        state = AsyncValue.data(List<ChatMessageModel>.from(list));
        _connectWs();
      },
    );
  }

  void _connectWs() {
    _wsSubscription?.cancel();
    _ws?.dispose();
    _ws = null;
    final token = _ref.read(authTokenProvider);
    if (token == null || token.isEmpty) return;
    _ws = ChatWebSocketService();
    _wsSubscription = _ws!.newMessages.listen((msg) {
      final current = state.valueOrNull;
      if (current == null) return;
      if (current.any((m) => m.id == msg.id)) return;
      state = AsyncValue.data([...current, msg]);
    });
    _ws!.connect(conversationId, token);
  }

  /// Call after sending a message via REST so list refreshes (or WS may deliver same message - dedupe handles it).
  void appendMessage(ChatMessageModel message) {
    final current = state.valueOrNull;
    if (current == null) return;
    if (current.any((m) => m.id == message.id)) return;
    state = AsyncValue.data([...current, message]);
  }

  /// Invalidate and refetch initial list (e.g. after send).
  void refresh() {
    _loadAndConnect();
  }
}
