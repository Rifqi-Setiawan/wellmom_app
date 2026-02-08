// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForumCreatePostRequestModel _$ForumCreatePostRequestModelFromJson(
  Map<String, dynamic> json,
) => _ForumCreatePostRequestModel(
  title: json['title'] as String,
  details: json['details'] as String,
  categoryId: (json['category_id'] as num).toInt(),
);

Map<String, dynamic> _$ForumCreatePostRequestModelToJson(
  _ForumCreatePostRequestModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'details': instance.details,
  'category_id': instance.categoryId,
};
