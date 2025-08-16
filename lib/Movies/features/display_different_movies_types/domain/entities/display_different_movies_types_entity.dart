import 'package:equatable/equatable.dart';

class DisplayDifferentMoviesTypesEntity extends Equatable {
  final DatesEntity dates;
  final List<ResultEntity> results;

  const DisplayDifferentMoviesTypesEntity({
    required this.dates,
    required this.results,
  });

  @override
  List<Object?> get props => [dates, results];
}

class DatesEntity extends Equatable {
  final String maximum;
  final String minimum;

  const DatesEntity({required this.maximum, required this.minimum});

  @override
  List<Object?> get props => [maximum, minimum];
}

class ResultEntity extends Equatable {
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

  @override
  List<Object?> get props => [
    backdropPath,
    genreIds,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    voteAverage,
    voteCount,
  ];
}
