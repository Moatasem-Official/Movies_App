import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/discover_movies/data/models/category_genre_model.dart';
import 'package:movies_app/features/discover_movies/domain/entities/movies_categories_entity.dart';

part 'movies_categories_model.g.dart';

@JsonSerializable()
class MoviesCategoriesModel extends MoviesCategoriesEntity {
  @override
  final List<CategoryGenreModel> genres;

  MoviesCategoriesModel({
    required this.genres,
  }) : super(genres: genres);

  factory MoviesCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesCategoriesModelToJson(this);
}
