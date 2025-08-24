import 'package:bloc/bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_now_playing_movies_use_case.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';

class NowPlayingMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  NowPlayingMoviesCubit(this.getNowPlayingMoviesUseCase) : super(const Idle());

  Future<void> getNowPlayingMovies() async {
    emit(const Loading());
    final result = await getNowPlayingMoviesUseCase();

    result.fold(
      (failure) {
        emit(Error(failure));
      },
      (movies) {
        emit(MoviesModuleStates.loaded(movies.results));
      },
    );
  }
}
