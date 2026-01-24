import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_post_model.freezed.dart';
part 'forum_post_model.g.dart';

/// Model for forum post
@freezed
class ForumPostModel with _$ForumPostModel {
  const factory ForumPostModel({
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
  }) = _ForumPostModel;

  factory ForumPostModel.fromJson(Map<String, dynamic> json) =>
      _$ForumPostModelFromJson(json);
}
