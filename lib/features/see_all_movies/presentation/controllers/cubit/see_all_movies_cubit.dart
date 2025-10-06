import 'package:bloc/bloc.dart';
import '../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../domain/usecase/get_cached_see_all_movies_use_case.dart';
import '../../../domain/usecase/get_movie_similar_movies_use_case.dart';
import '../../../domain/usecase/get_see_all_movies_use_case.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';

class SeeAllMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSeeAllMoviesUseCase seeAllMoviesTypes;
  final GetMovieSimilarMoviesUseCase getMovieSimilarMoviesUseCase;
  final GetCachedSeeAllMoviesUseCase getCachedSeeAllMoviesUseCase;
  SeeAllMoviesCubit(this.seeAllMoviesTypes, this.getMovieSimilarMoviesUseCase,
      this.getCachedSeeAllMoviesUseCase)
      : super(const Idle());

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

  /// 📌 الحالة الثانية: get similar movies by id
  void getSimilarMovies({
    required int movieId,
    bool reset = false,
  }) async {
    if (reset) {
      _reset();
      emit(const Loading());
    } else {
      emit(Paginated(List.unmodifiable(_allMovies)));
    }

    final result = await getMovieSimilarMoviesUseCase(
        movieId: movieId, page: _currentPage);

    result.fold(
      (failure) => emit(Error(failure)),
      (movies) {
        _allMovies.addAll(movies.results);
        _currentPage++;
        emit(Loaded(List.unmodifiable(_allMovies)));
      },
    );
  }

  void getCachedSeeAllMovies({required String movieType}) async {
    emit(const Loading());
    final result = await getCachedSeeAllMoviesUseCase(movieType: movieType);
    result.fold(
      (failure) => emit(Error(failure)),
      (movies) {
        _allMovies
          ..clear()
          ..addAll(movies.results);
        emit(Loaded(List.unmodifiable(_allMovies)));
      },
    );
  }

  void _reset() {
    _allMovies.clear();
    _currentPage = 1;
  }
}
