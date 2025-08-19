import 'package:bloc/bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/movies_injection.dart';

class MoviesHomeScreenCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  MoviesHomeScreenCubit() : super(const Idle());

  Future<void> getNowPlayingMovies() async {
    emit(const Loading());
    final result = await getIt<GetNowPlayingMoviesUseCase>().call();

    result.fold(
      (failure) {
        emit(Error(failure));
      },
      (movies) {
        emit(MoviesModuleStates.loaded(movies.results));
      },
    );
  }

  Future<void> getPopularMovies() async {}

  Future<void> getTopRatedMovies() async {}
}
