import 'package:wellmom_app/core/errors/failures.dart';
import 'package:wellmom_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:wellmom_app/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:wellmom_app/features/chat/data/models/chat_conversation_model.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';
import 'package:wellmom_app/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ChatConversationModel>>> getConversations() async {
    try {
      final result = await remoteDataSource.getConversations();
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatConversationModel?>> getConversation(
    int conversationId,
  ) async {
    try {
      final result = await remoteDataSource.getConversation(conversationId);
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessageModel>>> getMessages(
    int conversationId, {
    int skip = 0,
    int limit = 30,
  }) async {
    try {
      final result = await remoteDataSource.getMessages(
        conversationId,
        skip: skip,
        limit: limit,
      );
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatMessageModel>> sendMessage({
    int? conversationId,
    int? perawatId,
    required String messageText,
  }) async {
    try {
      final result = await remoteDataSource.sendMessage(
        conversationId: conversationId,
        perawatId: perawatId,
        messageText: messageText,
      );
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markRead(int conversationId) async {
    try {
      await remoteDataSource.markRead(conversationId);
      return Either.right(null);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount(int conversationId) async {
    try {
      final result = await remoteDataSource.getUnreadCount(conversationId);
      return Either.right(result);
    } on Failure catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(UnknownFailure(e.toString()));
    }
  }
}
