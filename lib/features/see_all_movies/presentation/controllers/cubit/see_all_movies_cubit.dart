import 'package:bloc/bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/see_all_movies/domain/usecase/get_see_all_movies_use_case.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';

class SeeAllMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSeeAllMoviesUseCase seeAllMoviesTypes;
  SeeAllMoviesCubit(this.seeAllMoviesTypes) : super(const Idle());

  void getSeeAllMovies(String movieType, int page) async {
    emit(const Loading());
    final result = await seeAllMoviesTypes(movieType: movieType, page: page);
    result.fold(
      (failure) => emit(Error(failure)),
      (movies) => emit(Loaded(movies.results)),
    );
  }
}
