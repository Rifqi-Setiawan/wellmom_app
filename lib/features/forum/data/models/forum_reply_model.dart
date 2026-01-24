import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_reply_model.freezed.dart';
part 'forum_reply_model.g.dart';

/// Model for forum reply
@freezed
class ForumReplyModel with _$ForumReplyModel {
  const factory ForumReplyModel({
    required int id,
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'author_user_id') required int authorUserId,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'author_role') required String authorRole,
    @JsonKey(name: 'reply_text') required String replyText,
    @JsonKey(name: 'parent_reply_id') int? parentReplyId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ForumReplyModel;

  factory ForumReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ForumReplyModelFromJson(json);
}
