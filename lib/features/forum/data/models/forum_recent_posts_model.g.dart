// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_recent_posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumRecentPostsModelImpl _$$ForumRecentPostsModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForumRecentPostsModelImpl(
  posts: (json['posts'] as List<dynamic>)
      .map((e) => ForumPostModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  hasMore: json['has_more'] as bool,
);

Map<String, dynamic> _$$ForumRecentPostsModelImplToJson(
  _$ForumRecentPostsModelImpl instance,
) => <String, dynamic>{
  'posts': instance.posts,
  'total': instance.total,
  'has_more': instance.hasMore,
};
