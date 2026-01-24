// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumPostModelImpl _$$ForumPostModelImplFromJson(Map<String, dynamic> json) =>
    _$ForumPostModelImpl(
      id: (json['id'] as num).toInt(),
      authorUserId: (json['author_user_id'] as num).toInt(),
      authorName: json['author_name'] as String,
      authorRole: json['author_role'] as String,
      title: json['title'] as String,
      details: json['details'] as String,
      likeCount: (json['like_count'] as num).toInt(),
      replyCount: (json['reply_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ForumPostModelImplToJson(
  _$ForumPostModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'author_user_id': instance.authorUserId,
  'author_name': instance.authorName,
  'author_role': instance.authorRole,
  'title': instance.title,
  'details': instance.details,
  'like_count': instance.likeCount,
  'reply_count': instance.replyCount,
  'is_liked': instance.isLiked,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
