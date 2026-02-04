import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/network/api_client.dart';
import 'package:wellmom_app/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:wellmom_app/features/chat/data/models/chat_conversation_model.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';
import 'package:wellmom_app/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:wellmom_app/features/chat/domain/repositories/chat_repository.dart';

final chatRemoteDataSourceProvider = Provider<ChatRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatRemoteDataSourceImpl(dio);
});

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final ds = ref.watch(chatRemoteDataSourceProvider);
  return ChatRepositoryImpl(ds);
});

/// List of conversations for ibu hamil (for homepage section).
final conversationsListProvider =
    FutureProvider.autoDispose<List<ChatConversationModel>>((ref) async {
  final repo = ref.watch(chatRepositoryProvider);
  final result = await repo.getConversations();
  return result.fold(
    (failure) => throw failure,
    (list) => list,
  );
});

/// Resolve conversationId from perawatId so chat history loads when opening with perawatId only.
final conversationIdByPerawatProvider =
    FutureProvider.autoDispose.family<int?, int>((ref, perawatId) async {
  final list = await ref.watch(conversationsListProvider.future);
  for (final c in list) {
    if (c.perawatId == perawatId) return c.id;
  }
  return null;
});

/// Messages for a single conversation (paginated). Use [conversationId] as family.
final messagesProvider = FutureProvider.autoDispose
    .family<List<ChatMessageModel>, _MessagesParams>((ref, params) async {
  final repo = ref.watch(chatRepositoryProvider);
  final result = await repo.getMessages(
    params.conversationId,
    skip: params.skip,
    limit: params.limit,
  );
  return result.fold(
    (failure) => throw failure,
    (list) => list,
  );
});

class _MessagesParams {
  final int conversationId;
  final int skip;
  final int limit;

  const _MessagesParams({
    required this.conversationId,
    this.skip = 0,
    this.limit = 30,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _MessagesParams &&
          conversationId == other.conversationId &&
          skip == other.skip &&
          limit == other.limit;

  @override
  int get hashCode => Object.hash(conversationId, skip, limit);
}

/// Helper to create messagesProvider family param.
MessagesParam messagesParam({
  required int conversationId,
  int skip = 0,
  int limit = 30,
}) =>
    MessagesParam(
      conversationId: conversationId,
      skip: skip,
      limit: limit,
    );

/// Public param class so UI can use it.
class MessagesParam {
  final int conversationId;
  final int skip;
  final int limit;

  const MessagesParam({
    required this.conversationId,
    this.skip = 0,
    this.limit = 30,
  });

  _MessagesParams get _internal => _MessagesParams(
        conversationId: conversationId,
        skip: skip,
        limit: limit,
      );
}
