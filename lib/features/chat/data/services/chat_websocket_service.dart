import 'dart:async';
import 'dart:convert';

import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatWebSocketService {
  WebSocketChannel? _channel;
  final StreamController<ChatMessageModel> _newMessagesController =
      StreamController<ChatMessageModel>.broadcast();
  bool _disposed = false;

  Stream<ChatMessageModel> get newMessages => _newMessagesController.stream;

  static String _getWebSocketBaseUrl() {
    final baseUrl = apiBaseUrl;
    if (baseUrl.contains('localhost') || baseUrl.contains('127.0.0.1')) {
      return baseUrl
          .replaceAll('localhost', '10.0.2.2')
          .replaceAll('127.0.0.1', '10.0.2.2');
    }
    return baseUrl;
  }

  static String buildUrl(int conversationId, String token) {
    final base = _getWebSocketBaseUrl().replaceFirst(RegExp(r'^http'), 'ws');
    final path = '$base/ws/chat/$conversationId';
    final uri = Uri.parse(path).replace(
      queryParameters: {'token': token},
    );
    return uri.toString();
  }

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
        final payload = map['message'] ?? map['data'] ?? map;
        final msg = ChatMessageModel.fromJson(
          Map<String, dynamic>.from(payload is Map ? payload : {}),
        );
        if (!_newMessagesController.isClosed) {
          _newMessagesController.add(msg);
        }
      }
    } catch (_) {
      // Message parsing failed, skip
    }
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
    if (_channel != null) {
      _channel?.sink.close();
      _channel = null;
    }
  }

  void dispose() {
    _disposed = true;
    disconnect();
    _newMessagesController.close();
  }
}
