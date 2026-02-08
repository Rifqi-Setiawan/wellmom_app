// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_post_full_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForumPostFullModel _$ForumPostFullModelFromJson(Map<String, dynamic> json) =>
    _ForumPostFullModel(
      id: (json['id'] as num).toInt(),
      authorUserId: (json['author_user_id'] as num).toInt(),
      authorName: json['author_name'] as String,
      authorRole: json['author_role'] as String,
      authorPhotoUrl: json['author_photo_url'] as String?,
      title: json['title'] as String,
      details: json['details'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      categoryName: json['category_name'] as String,
      categoryDisplayName: json['category_display_name'] as String,
      likeCount: (json['like_count'] as num).toInt(),
      replyCount: (json['reply_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ForumPostFullModelToJson(_ForumPostFullModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_user_id': instance.authorUserId,
      'author_name': instance.authorName,
      'author_role': instance.authorRole,
      'author_photo_url': instance.authorPhotoUrl,
      'title': instance.title,
      'details': instance.details,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_display_name': instance.categoryDisplayName,
      'like_count': instance.likeCount,
      'reply_count': instance.replyCount,
      'is_liked': instance.isLiked,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_ForumPostsResponseModel _$ForumPostsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ForumPostsResponseModel(
  posts: (json['posts'] as List<dynamic>)
      .map((e) => ForumPostFullModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  hasMore: json['has_more'] as bool,
);

Map<String, dynamic> _$ForumPostsResponseModelToJson(
  _ForumPostsResponseModel instance,
) => <String, dynamic>{
  'posts': instance.posts,
  'total': instance.total,
  'has_more': instance.hasMore,
};
