import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
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

  /// Get WebSocket base URL (detect emulator vs device)
  static String _getWebSocketBaseUrl() {
    // Untuk development: detect emulator dan gunakan 10.0.2.2
    // Untuk production: gunakan IP server yang sudah dikonfigurasi
    if (kDebugMode) {
      // Cek apakah running di emulator (Android emulator menggunakan 10.0.2.2)
      // Untuk production, gunakan IP server yang sudah ada
      final baseUrl = apiBaseUrl;
      
      // Jika base URL mengandung localhost atau 127.0.0.1, ganti dengan 10.0.2.2 untuk emulator
      if (baseUrl.contains('localhost') || baseUrl.contains('127.0.0.1')) {
        return baseUrl.replaceAll('localhost', '10.0.2.2')
            .replaceAll('127.0.0.1', '10.0.2.2');
      }
      
      // Jika sudah menggunakan IP server, tetap gunakan IP tersebut
      return baseUrl;
    }
    
    // Production: gunakan base URL yang sudah dikonfigurasi
    return apiBaseUrl;
  }

  /// Build WebSocket URL from API base. http(s) -> ws(s), append /ws/chat/{id}?token=...
  static String buildUrl(int conversationId, String token) {
    final base = _getWebSocketBaseUrl().replaceFirst(RegExp(r'^http'), 'ws');
    final path = '$base/ws/chat/$conversationId';
    final uri = Uri.parse(path).replace(
      queryParameters: {'token': token},
    );
    debugPrint('[WebSocket] Connecting to: $uri');
    return uri.toString();
  }

  /// Connect to chat WebSocket. Token = JWT ibu hamil.
  void connect(int conversationId, String token) {
    if (token.isEmpty) {
      debugPrint('[WebSocket] Cannot connect: token is empty');
      return;
    }
    disconnect();
    final url = buildUrl(conversationId, token);
    try {
      debugPrint('[WebSocket] Connecting to conversation $conversationId');
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: false,
      );
      debugPrint('[WebSocket] Connected successfully');
    } catch (e) {
      debugPrint('[WebSocket] Connection error: $e');
      _onError(e);
    }
  }

  void _onMessage(dynamic data) {
    if (_disposed) return;
    try {
      final map = data is String
          ? jsonDecode(data) as Map<String, dynamic>?
          : data as Map<String, dynamic>?;
      if (map == null) {
        debugPrint('[WebSocket] Received null message');
        return;
      }
      
      final type = map['type'] as String? ?? map['event'] as String?;
      debugPrint('[WebSocket] Received message type: $type');
      
      if (type == 'new_message') {
        final payload = map['data'] ?? map['message'] ?? map;
        final msg = ChatMessageModel.fromJson(
          Map<String, dynamic>.from(payload is Map ? payload : {}),
        );
        debugPrint('[WebSocket] New message received: ${msg.id} - ${msg.messageText.substring(0, msg.messageText.length > 50 ? 50 : msg.messageText.length)}...');
        if (!_newMessagesController.isClosed) {
          _newMessagesController.add(msg);
        }
      } else if (type == 'connection') {
        debugPrint('[WebSocket] Connection confirmed');
      } else if (type == 'read_receipt') {
        debugPrint('[WebSocket] Read receipt received');
      } else {
        debugPrint('[WebSocket] Unknown message type: $type');
      }
    } catch (e) {
      debugPrint('[WebSocket] Error parsing message: $e');
    }
  }

  void _onError(dynamic error) {
    debugPrint('[WebSocket] Error: $error');
    if (!_disposed && !_newMessagesController.isClosed) {
      _newMessagesController.addError(error);
    }
  }

  void _onDone() {
    debugPrint('[WebSocket] Connection closed');
  }

  void disconnect() {
    if (_channel != null) {
      debugPrint('[WebSocket] Disconnecting...');
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
