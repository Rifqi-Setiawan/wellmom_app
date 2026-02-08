// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_replies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForumRepliesResponseModel _$ForumRepliesResponseModelFromJson(
  Map<String, dynamic> json,
) => _ForumRepliesResponseModel(
  replies: (json['replies'] as List<dynamic>)
      .map((e) => ForumReplyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$ForumRepliesResponseModelToJson(
  _ForumRepliesResponseModel instance,
) => <String, dynamic>{'replies': instance.replies, 'total': instance.total};
