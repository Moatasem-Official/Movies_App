import 'package:movies_app/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_crew_entity.dart';

class MovieCreditsEntity {
  final List<MovieCastEntity> cast;
  final List<MovieCrewEntity> crew;

  const MovieCreditsEntity({
    required this.cast,
    required this.crew,
  });
}
