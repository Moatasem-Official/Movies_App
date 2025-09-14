// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_genre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryGenreModel _$CategoryGenreModelFromJson(Map<String, dynamic> json) =>
    CategoryGenreModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryGenreModelToJson(CategoryGenreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
