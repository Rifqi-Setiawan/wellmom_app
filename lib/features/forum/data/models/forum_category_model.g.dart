// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForumCategoryModel _$ForumCategoryModelFromJson(Map<String, dynamic> json) =>
    _ForumCategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      displayName: json['display_name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String?,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ForumCategoryModelToJson(_ForumCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'description': instance.description,
      'icon': instance.icon,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_ForumCategoriesResponseModel _$ForumCategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => _ForumCategoriesResponseModel(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => ForumCategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ForumCategoriesResponseModelToJson(
  _ForumCategoriesResponseModel instance,
) => <String, dynamic>{'categories': instance.categories};
