import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../domain/entities/movie_credits_entity.dart';
import '../../../../domain/usecases/Movie_Details_Screen/get_movie_credits_use_case.dart';

class MovieCreditsCubit extends Cubit<MoviesModuleStates<MovieCreditsEntity>> {
  final GetMovieCreditsUseCase getMovieCreditsUseCase;
  MovieCreditsCubit(this.getMovieCreditsUseCase) : super(const Idle());

  Future<void> getMovieCredits({required int movieId}) async {
    emit(const Loading());
    final failureOrMovieCredits = await getMovieCreditsUseCase(
      movieId: movieId,
    );
    failureOrMovieCredits.fold(
      (failure) => emit(Error(failure)),
      (movieCredits) => emit(Loaded(movieCredits)),
    );
  }
}
