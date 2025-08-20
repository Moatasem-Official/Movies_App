import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/get_upcomming_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/movies_injection.dart';

class UpcommingMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  UpcommingMoviesCubit(GetUpcommingMoviesUseCase getUpcommingMoviesUseCase)
    : super(const Idle());

  Future<void> getTopRatedMovies() async {
    emit(const Loading());
    final result = await getIt<GetUpcommingMoviesUseCase>().call();
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
