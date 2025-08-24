import 'package:bloc/bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_top_rated_movies_use_case.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/app/service_locator.dart';

class TopRatedMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  TopRatedMoviesCubit(GetTopRatedMoviesUseCase getTopRatedMoviesUseCase)
    : super(const Idle());

  Future<void> getTopRatedMovies() async {
    emit(const Loading());
    final result = await getIt<GetTopRatedMoviesUseCase>().call();
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
