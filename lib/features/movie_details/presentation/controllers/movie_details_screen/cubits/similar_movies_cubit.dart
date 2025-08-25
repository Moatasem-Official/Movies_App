import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_similar_movies_use_case.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';

class SimilarMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  SimilarMoviesCubit(this.getSimilarMoviesUseCase)
    : super(MoviesModuleStates.idle());

  Future<void> getSimilarMovies({required int movieId}) async {
    emit(const Loading());
    final failureOrSimilarMovies = await getSimilarMoviesUseCase(
      movieId: movieId,
    );
    failureOrSimilarMovies.fold(
      (failure) => emit(Error(failure)),
      (movies) => emit(Loaded(movies.results)),
    );
  }
}
