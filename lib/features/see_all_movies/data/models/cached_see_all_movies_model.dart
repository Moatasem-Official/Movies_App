import 'package:hive_flutter/adapters.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';

part 'cached_see_all_movies_model.g.dart';

@HiveType(typeId: 2)
class CachedSeeAllMoviesModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String? backdropPath;

  @HiveField(2)
  final String? posterPath;

  @HiveField(3)
  final int id;

  @HiveField(4)
  final String releaseDate;

  @HiveField(5)
  final double voteAverage;

  @HiveField(6)
  final String overview;

  CachedSeeAllMoviesModel(this.title, this.backdropPath, this.posterPath,
      this.id, this.releaseDate, this.voteAverage, this.overview);

  factory CachedSeeAllMoviesModel.fromEntity(ResultEntity movie) {
    return CachedSeeAllMoviesModel(
      movie.title,
      movie.backdropPath,
      movie.posterPath,
      movie.id,
      movie.releaseDate,
      movie.voteAverage,
      movie.overview,
    );
  }

  ResultEntity toEntity() {
    return ResultEntity(
      backdropPath: backdropPath,
      genreIds: const [],
      id: id,
      originalLanguage: '',
      originalTitle: title,
      overview: overview,
      popularity: 0.0,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage,
      voteCount: 0,
    );
  }
}
