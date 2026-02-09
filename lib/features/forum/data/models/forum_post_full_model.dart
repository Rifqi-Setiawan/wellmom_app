import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_post_full_model.freezed.dart';
part 'forum_post_full_model.g.dart';

@freezed
abstract class ForumPostFullModel with _$ForumPostFullModel {
  const factory ForumPostFullModel({
    required int id,
    @JsonKey(name: 'author_user_id') required int authorUserId,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'author_role') required String authorRole,
    @JsonKey(name: 'author_photo_url') String? authorPhotoUrl,
    required String title,
    required String details,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'category_display_name') required String categoryDisplayName,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'reply_count') required int replyCount,
    @JsonKey(name: 'is_liked') required bool isLiked,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ForumPostFullModel;

  factory ForumPostFullModel.fromJson(Map<String, dynamic> json) =>
      _$ForumPostFullModelFromJson(json);
}

@freezed
abstract class ForumPostsResponseModel with _$ForumPostsResponseModel {
  const factory ForumPostsResponseModel({
    required List<ForumPostFullModel> posts,
    required int total,
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ForumPostsResponseModel;

  factory ForumPostsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForumPostsResponseModelFromJson(json);
}
