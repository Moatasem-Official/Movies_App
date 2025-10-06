import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../domain/usecases/get_category_movies_use_case.dart';
import '../../../../movies_search/domain/usecases/get_searched_movies_use_case.dart';

class CategoryMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetCategoryMoviesUseCase getCategoryMoviesUseCase;
  final GetSearchedMoviesUseCase getSearchedMoviesUseCase;

  CategoryMoviesCubit(
    this.getCategoryMoviesUseCase,
    this.getSearchedMoviesUseCase,
  ) : super(const Idle());

  final List<ResultEntity> _movies = [];
  int _currentPage = 1;
  bool _hasMore = true;
  String _lastQuery = "";
  int _lastGenreId = -1;

  final int _pageSize = 20;

  bool get hasMore => _hasMore;

  Future<void> fetchCategoryMovies({
    required int genreId,
    bool reset = false,
  }) async {
    if (reset || _lastGenreId != genreId) {
      _resetState(genreId: genreId, isSearching: false);
    } else {
      if (!_hasMore) return;
      emit(Paginated(List.unmodifiable(_movies)));
    }

    final result =
        await getCategoryMoviesUseCase(genreId: genreId, page: _currentPage);

    result.fold(
      (failure) => emit(Error(failure)),
      (moviesCategories) {
        final newResults = moviesCategories.results;
        if (newResults.isEmpty) {
          _hasMore = false;
        } else {
          _movies.addAll(newResults);
          _hasMore = newResults.length >= _pageSize;
          _currentPage++;
        }

        if (_currentPage == 2) {
          emit(Loaded(List.unmodifiable(_movies)));
        } else {
          emit(Paginated(List.unmodifiable(_movies)));
        }
      },
    );
  }

  Future<void> searchInCategory({
    required int genreId,
    required String query,
    bool reset = false,
  }) async {
    if (reset || _lastQuery != query) {
      _resetState(genreId: genreId, query: query, isSearching: true);
    } else {
      if (!_hasMore) return;
      emit(Paginated(List.unmodifiable(_movies)));
    }

    final result = await getSearchedMoviesUseCase(
      page: _currentPage,
      query: query,
      apiKey: AppConstants.kApiKey,
    );

    result.fold(
      (failure) => emit(Error(failure)),
      (searchResults) {
        final filtered = searchResults.results
            .where((movie) => movie.genreIds.contains(genreId))
            .toList();

        if (filtered.isEmpty) {
          _hasMore = false;
          if (_currentPage == 1) {
            emit(const Empty());
            return;
          }
        } else {
          _movies.addAll(filtered);
          _hasMore = filtered.length >= _pageSize;
          _currentPage++;
        }

        if (_currentPage == 2) {
          emit(Loaded(List.unmodifiable(_movies)));
        } else {
          emit(Paginated(List.unmodifiable(_movies)));
        }
      },
    );
  }

  void emitIdle() {
    _movies.clear();
    _currentPage = 1;
    _lastQuery = "";
    _lastGenreId = -1;
    _hasMore = true;
    emit(const Idle());
  }

  void _resetState({
    required int genreId,
    String query = "",
    bool isSearching = false,
  }) {
    _movies.clear();
    _currentPage = 1;
    _hasMore = true;
    _lastGenreId = genreId;
    _lastQuery = query;
    emit(const Loading());
  }
}
