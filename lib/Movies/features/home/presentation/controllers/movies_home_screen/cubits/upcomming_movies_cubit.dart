import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_upcomming_movies_use_case.dart';
import 'package:movies_app/core/cubit/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/movies_injection.dart';

class UpcommingMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  UpcommingMoviesCubit(GetUpcommingMoviesUseCase getUpcommingMoviesUseCase)
    : super(const Idle());

  Future<void> getUpcommingMovies() async {
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
