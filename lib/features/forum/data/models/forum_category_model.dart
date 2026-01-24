import 'package:freezed_annotation/freezed_annotation.dart';

part 'forum_category_model.freezed.dart';
part 'forum_category_model.g.dart';

@freezed
class ForumCategoryModel with _$ForumCategoryModel {
  const factory ForumCategoryModel({
    required int id,
    required String name,
    @JsonKey(name: 'display_name') required String displayName,
    required String description,
    String? icon, // nullable karena API bisa mengembalikan null
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ForumCategoryModel;

  factory ForumCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ForumCategoryModelFromJson(json);
}

@freezed
class ForumCategoriesResponseModel with _$ForumCategoriesResponseModel {
  const factory ForumCategoriesResponseModel({
    required List<ForumCategoryModel> categories,
  }) = _ForumCategoriesResponseModel;

  factory ForumCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForumCategoriesResponseModelFromJson(json);
}
