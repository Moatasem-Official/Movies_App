import 'package:movies_app/features/movie_details/data/models/movie_cast_model.dart';

class MovieCreditsEntity {
  final List<Cast> cast;

  const MovieCreditsEntity({
    required this.cast,
  });
}
