import 'package:bloc/bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movies_Home_Screen/get_popular_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/movies_injection.dart';

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
