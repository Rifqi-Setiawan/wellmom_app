import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_like_response_model.freezed.dart';
part 'forum_like_response_model.g.dart';

/// Model for like post response
@freezed
abstract class ForumLikeResponseModel with _$ForumLikeResponseModel {
  const factory ForumLikeResponseModel({
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'is_liked') required bool isLiked,
    @JsonKey(name: 'like_count') required int likeCount,
    required String message,
  }) = _ForumLikeResponseModel;

  factory ForumLikeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForumLikeResponseModelFromJson(json);
}
