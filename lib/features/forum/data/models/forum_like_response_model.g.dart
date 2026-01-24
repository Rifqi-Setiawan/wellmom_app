// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_like_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumLikeResponseModelImpl _$$ForumLikeResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForumLikeResponseModelImpl(
  postId: (json['post_id'] as num).toInt(),
  isLiked: json['is_liked'] as bool,
  likeCount: (json['like_count'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$$ForumLikeResponseModelImplToJson(
  _$ForumLikeResponseModelImpl instance,
) => <String, dynamic>{
  'post_id': instance.postId,
  'is_liked': instance.isLiked,
  'like_count': instance.likeCount,
  'message': instance.message,
};
