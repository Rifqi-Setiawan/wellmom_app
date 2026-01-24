import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wellmom_app/features/forum/data/models/forum_reply_model.dart';

part 'forum_post_detail_model.freezed.dart';
part 'forum_post_detail_model.g.dart';

/// Model for forum post detail with replies
@freezed
class ForumPostDetailModel with _$ForumPostDetailModel {
  const factory ForumPostDetailModel({
    required int id,
    @JsonKey(name: 'author_user_id') required int authorUserId,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'author_role') required String authorRole,
    required String title,
    required String details,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'reply_count') required int replyCount,
    @JsonKey(name: 'is_liked') required bool isLiked,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required List<ForumReplyModel> replies,
  }) = _ForumPostDetailModel;

  factory ForumPostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ForumPostDetailModelFromJson(json);
}
