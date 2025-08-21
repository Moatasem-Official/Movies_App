import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movie_Details_Screen/get_similar_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/movies_injection.dart';

class SimilarMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  SimilarMoviesCubit(this.getSimilarMoviesUseCase)
    : super(MoviesModuleStates.idle());

  Future<void> getSimilarMovies({required int movieId}) async {
    emit(const Loading());
    final failureOrSimilarMovies = await getIt<GetSimilarMoviesUseCase>().call(
      movieId: movieId,
    );
    emit(
      failureOrSimilarMovies.fold(
        (failure) => Error(failure),
        (movies) => Loaded(movies.results),
      ),
    );
  }
}
