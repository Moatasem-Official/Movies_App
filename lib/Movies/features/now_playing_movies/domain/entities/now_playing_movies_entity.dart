class NowplayingMoviesEntity {
  final DatesEntity dates;
  final List<ResultEntity> results;

  const NowplayingMoviesEntity({required this.dates, required this.results});
}

class DatesEntity {
  final String maximum;
  final String minimum;

  const DatesEntity({required this.maximum, required this.minimum});
}

class ResultEntity {
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  const ResultEntity({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });
}
