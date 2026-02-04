import 'dart:async';
import 'dart:convert';

import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// WebSocket URL: ws://<host>/api/v1/ws/chat/{conversation_id}?token=<jwt>
/// Events: type "connection" (confirm), "new_message", "read_receipt"
class ChatWebSocketService {
  WebSocketChannel? _channel;
  final StreamController<ChatMessageModel> _newMessagesController =
      StreamController<ChatMessageModel>.broadcast();
  bool _disposed = false;

  /// Stream of new messages from the server (real-time).
  Stream<ChatMessageModel> get newMessages => _newMessagesController.stream;

  /// Build WebSocket URL from API base. http(s) -> ws(s), append /ws/chat/{id}?token=...
  static String buildUrl(int conversationId, String token) {
    final base = apiBaseUrl.replaceFirst(RegExp(r'^http'), 'ws');
    final path = '$base/ws/chat/$conversationId';
    final uri = Uri.parse(path).replace(
      queryParameters: {'token': token},
    );
    return uri.toString();
  }

  /// Connect to chat WebSocket. Token = JWT ibu hamil.
  void connect(int conversationId, String token) {
    if (token.isEmpty) return;
    disconnect();
    final url = buildUrl(conversationId, token);
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: false,
      );
    } catch (e) {
      _onError(e);
    }
  }

  void _onMessage(dynamic data) {
    if (_disposed) return;
    try {
      final map = data is String
          ? jsonDecode(data) as Map<String, dynamic>?
          : data as Map<String, dynamic>?;
      if (map == null) return;
      final type = map['type'] as String? ?? map['event'] as String?;
      if (type == 'new_message') {
        final payload = map['data'] ?? map['message'] ?? map;
        final msg = ChatMessageModel.fromJson(
          Map<String, dynamic>.from(payload is Map ? payload : {}),
        );
        if (!_newMessagesController.isClosed) {
          _newMessagesController.add(msg);
        }
      }
      // read_receipt, connection: optional handling
    } catch (_) {}
  }

  void _onError(dynamic error) {
    if (!_disposed && !_newMessagesController.isClosed) {
      _newMessagesController.addError(error);
    }
  }

  void _onDone() {
    // Connection closed
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }

  void dispose() {
    _disposed = true;
    disconnect();
    _newMessagesController.close();
  }
}
