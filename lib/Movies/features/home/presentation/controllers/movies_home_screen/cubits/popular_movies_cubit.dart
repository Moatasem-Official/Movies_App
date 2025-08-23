import 'package:bloc/bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_popular_movies_use_case.dart';
import 'package:movies_app/core/cubit/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/service_locator.dart';

class PopularMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  PopularMoviesCubit(GetPopularMoviesUseCase getPopularMoviesUseCase)
    : super(const Idle());

  Future<void> getPopularMovies() async {
    emit(const Loading());
    final result = await getIt<GetPopularMoviesUseCase>().call();
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
