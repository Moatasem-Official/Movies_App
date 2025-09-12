import 'package:movies_app/features/movie_details/domain/entities/movie_cast_entity.dart';

class MovieCreditsEntity {
  final List<MovieCastEntity> cast;

  const MovieCreditsEntity({
    required this.cast,
  });
}
