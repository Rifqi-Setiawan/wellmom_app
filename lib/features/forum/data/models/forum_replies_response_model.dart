import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wellmom_app/features/forum/data/models/forum_reply_model.dart';

part 'forum_replies_response_model.freezed.dart';
part 'forum_replies_response_model.g.dart';

/// Model for replies response
@freezed
abstract class ForumRepliesResponseModel with _$ForumRepliesResponseModel {
  const factory ForumRepliesResponseModel({
    required List<ForumReplyModel> replies,
    required int total,
  }) = _ForumRepliesResponseModel;

  factory ForumRepliesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForumRepliesResponseModelFromJson(json);
}
