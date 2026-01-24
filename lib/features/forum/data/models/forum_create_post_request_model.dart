import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_create_post_request_model.freezed.dart';
part 'forum_create_post_request_model.g.dart';

@freezed
class ForumCreatePostRequestModel with _$ForumCreatePostRequestModel {
  const factory ForumCreatePostRequestModel({
    required String title,
    required String details,
    @JsonKey(name: 'category_id') required int categoryId,
  }) = _ForumCreatePostRequestModel;

  factory ForumCreatePostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForumCreatePostRequestModelFromJson(json);
}
