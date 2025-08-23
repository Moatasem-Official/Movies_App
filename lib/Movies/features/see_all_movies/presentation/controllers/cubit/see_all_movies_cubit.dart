import 'package:bloc/bloc.dart';
import 'package:movies_app/core/cubit/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/features/see_all_movies/domain/usecase/get_see_all_movies_use_case.dart';
import 'package:movies_app/Movies/service_locator.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';

class SeeAllMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSeeAllMoviesUseCase seeAllMoviesTypes;
  SeeAllMoviesCubit(this.seeAllMoviesTypes) : super(const Idle());

  void getSeeAllMovies(String movieType, int page) async {
    emit(const Loading());
    final result = await getIt<GetSeeAllMoviesUseCase>().call(
      movieType: movieType,
      page: page,
    );
    result.fold(
      (failure) => emit(Error(failure)),
      (movies) => emit(Loaded(movies.results)),
    );
  }
}
