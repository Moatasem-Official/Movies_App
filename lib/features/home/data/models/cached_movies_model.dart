import 'package:hive/hive.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';

part 'cached_movies_model.g.dart';

@HiveType(typeId: 1)
class CachedMoviesModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? posterPath;

  @HiveField(3)
  final String? backdropPath;

  @HiveField(4)
  final String releaseDate;

  CachedMoviesModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
  });

  factory CachedMoviesModel.fromEntity(ResultEntity entity) {
    return CachedMoviesModel(
      id: entity.id,
      title: entity.title,
      posterPath: entity.posterPath,
      backdropPath: entity.backdropPath,
      releaseDate: entity.releaseDate,
    );
  }

  ResultEntity toEntity() {
    return ResultEntity(
      backdropPath: backdropPath,
      genreIds: const [],
      id: id,
      originalLanguage: '',
      originalTitle: title,
      overview: '',
      popularity: 0.0,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      voteAverage: 0.0,
      voteCount: 0,
    );
  }
}
