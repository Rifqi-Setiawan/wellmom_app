// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumReplyModelImpl _$$ForumReplyModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForumReplyModelImpl(
  id: (json['id'] as num).toInt(),
  postId: (json['post_id'] as num).toInt(),
  authorUserId: (json['author_user_id'] as num).toInt(),
  authorName: json['author_name'] as String,
  authorRole: json['author_role'] as String,
  replyText: json['reply_text'] as String,
  parentReplyId: (json['parent_reply_id'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$ForumReplyModelImplToJson(
  _$ForumReplyModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'post_id': instance.postId,
  'author_user_id': instance.authorUserId,
  'author_name': instance.authorName,
  'author_role': instance.authorRole,
  'reply_text': instance.replyText,
  'parent_reply_id': instance.parentReplyId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
