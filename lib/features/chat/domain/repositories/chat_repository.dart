import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/chat/data/models/chat_conversation_model.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatConversationModel>>> getConversations();
  Future<Either<Failure, ChatConversationModel?>> getConversation(int conversationId);
  Future<Either<Failure, List<ChatMessageModel>>> getMessages(
    int conversationId, {
    int skip = 0,
    int limit = 30,
  });
  Future<Either<Failure, ChatMessageModel>> sendMessage({
    int? conversationId,
    int? perawatId,
    required String messageText,
  });
  Future<Either<Failure, void>> markRead(int conversationId);
  Future<Either<Failure, int>> getUnreadCount(int conversationId);
}
