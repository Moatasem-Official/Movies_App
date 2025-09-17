import 'package:bloc/bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/movies_search/domain/usecases/get_searched_movies_use_case.dart';

class MoviesSearchCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSearchedMoviesUseCase getSearchedMoviesUseCase;
  MoviesSearchCubit(this.getSearchedMoviesUseCase) : super(const Idle());

  final List<ResultEntity> _searchedMovies = [];
  int _currentPage = 1;
  String _lastQuery = "";
  bool hasMore = true;

  Future<void> searchMovies({
    required String query,
    bool reset = false,
    required String apiKey,
  }) async {
    if (query.isEmpty) return emitIdle();

    if (reset || _lastQuery != query) {
      _searchedMovies.clear();
      _currentPage = 1;
      _lastQuery = query;
      hasMore = true;
      emit(const Loading());
    } else {
      if (!hasMore) return;
      emit(Paginated(List.unmodifiable(_searchedMovies)));
    }

    final result = await getSearchedMoviesUseCase(
      query: query,
      page: _currentPage,
      apiKey: apiKey,
    );

    result.fold(
      (failure) => emit(Error(failure)),
      (searchedMovies) {
        if (searchedMovies.results.isEmpty) {
          hasMore = false;
        } else {
          _searchedMovies.addAll(searchedMovies.results);
          _currentPage++;
        }
        emit(Loaded(List.unmodifiable(_searchedMovies)));
      },
    );
  }

  void emitIdle() {
    _searchedMovies.clear();
    _currentPage = 1;
    _lastQuery = "";
    hasMore = true;
    emit(const MoviesModuleStates.idle());
  }
}
