import 'package:bloc/bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/see_all_movies/domain/usecase/get_see_all_movies_use_case.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';

class SeeAllMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSeeAllMoviesUseCase seeAllMoviesTypes;
  SeeAllMoviesCubit(this.seeAllMoviesTypes) : super(const Idle());

  final List<ResultEntity> _allMovies = [];
  int _currentPage = 1;

  void getSeeAllMovies({required String movieType, bool reset = false}) async {
    if (reset) {
      _allMovies.clear();
      _currentPage = 1;
      emit(const Loading());
    } else {
      emit(Paginated(List.unmodifiable(_allMovies)));
    }

    final result =
        await seeAllMoviesTypes(movieType: movieType, page: _currentPage);

    result.fold(
      (failure) => emit(Error(failure)),
      (movies) {
        _allMovies.addAll(movies.results);
        _currentPage++;
        emit(Loaded(List.unmodifiable(_allMovies)));
      },
    );
  }
}
