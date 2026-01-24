// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumCreatePostRequestModelImpl _$$ForumCreatePostRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForumCreatePostRequestModelImpl(
  title: json['title'] as String,
  details: json['details'] as String,
  categoryId: (json['category_id'] as num).toInt(),
);

Map<String, dynamic> _$$ForumCreatePostRequestModelImplToJson(
  _$ForumCreatePostRequestModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'details': instance.details,
  'category_id': instance.categoryId,
};
