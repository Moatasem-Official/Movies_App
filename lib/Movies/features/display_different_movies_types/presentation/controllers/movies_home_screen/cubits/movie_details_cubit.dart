import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_details_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movie_Details_Screen/get_movie_details_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/movies_injection.dart';

class MovieDetailsCubit extends Cubit<MoviesModuleStates<MovieDetailsEntity>> {
  MovieDetailsCubit(GetMovieDetailsUseCase getMovieDetailsUseCase)
    : super(const Idle());

  Future<void> getMovieDetails({required int movieId}) async {
    emit(const Loading());
    final failureOrMovieDetails = await getIt<GetMovieDetailsUseCase>().call(
      movieId: movieId,
    );
    emit(
      failureOrMovieDetails.fold(
        (failure) => Error(failure),
        (movieDetails) => Loaded(movieDetails),
      ),
    );
  }
}
