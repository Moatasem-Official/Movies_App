import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/Movies/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_details_use_case.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';

class MovieDetailsCubit extends Cubit<MoviesModuleStates<MovieDetailsEntity>> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsCubit(this.getMovieDetailsUseCase) : super(const Idle());

  Future<void> getMovieDetails({required int movieId}) async {
    emit(const Loading());
    final failureOrMovieDetails = await getMovieDetailsUseCase(
      movieId: movieId,
    );
    failureOrMovieDetails.fold(
      (failure) => emit(Error(failure)),
      (movieDetails) => emit(Loaded(movieDetails)),
    );
  }
}
