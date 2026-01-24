// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_replies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumRepliesResponseModelImpl _$$ForumRepliesResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ForumRepliesResponseModelImpl(
  replies: (json['replies'] as List<dynamic>)
      .map((e) => ForumReplyModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$$ForumRepliesResponseModelImplToJson(
  _$ForumRepliesResponseModelImpl instance,
) => <String, dynamic>{'replies': instance.replies, 'total': instance.total};
