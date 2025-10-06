import 'movie_back_drop_entity.dart';
import 'movie_logo_entity.dart';
import 'movie_poster_entity.dart';

class MovieImagesEntity {
  final List<MovieBackDropEntity> backdrops;
  final List<MoviePosterEntity> posters;
  final List<MovieLogoEntity> logos;

  MovieImagesEntity(
      {required this.backdrops, required this.posters, required this.logos});
}
