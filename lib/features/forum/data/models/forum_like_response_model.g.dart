// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_like_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForumLikeResponseModel _$ForumLikeResponseModelFromJson(
  Map<String, dynamic> json,
) => _ForumLikeResponseModel(
  postId: (json['post_id'] as num).toInt(),
  isLiked: json['is_liked'] as bool,
  likeCount: (json['like_count'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$ForumLikeResponseModelToJson(
  _ForumLikeResponseModel instance,
) => <String, dynamic>{
  'post_id': instance.postId,
  'is_liked': instance.isLiked,
  'like_count': instance.likeCount,
  'message': instance.message,
};
