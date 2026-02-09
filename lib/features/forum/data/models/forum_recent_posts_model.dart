import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wellmom_app/features/forum/data/models/forum_post_model.dart';

part 'forum_recent_posts_model.freezed.dart';
part 'forum_recent_posts_model.g.dart';

/// Model for recent forum posts response
@freezed
abstract class ForumRecentPostsModel with _$ForumRecentPostsModel {
  const factory ForumRecentPostsModel({
    required List<ForumPostModel> posts,
    required int total,
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _ForumRecentPostsModel;

  factory ForumRecentPostsModel.fromJson(Map<String, dynamic> json) =>
      _$ForumRecentPostsModelFromJson(json);
}
