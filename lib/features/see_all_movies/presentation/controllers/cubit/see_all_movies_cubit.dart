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

  SeeAllMoviesCubit(
    this.seeAllMoviesTypes,
    this.getMovieSimilarMoviesUseCase,
    this.getCachedSeeAllMoviesUseCase,
  ) : super(const Idle());

  final List<ResultEntity> _allMovies = [];

  int _currentPage = 1;
  String? _lastMovieType;
  int? _lastMovieId;
  bool _isSimilarMode = false;

  int get currentPage => _currentPage;
  String? get lastMovieType => _lastMovieType;

  Future<void> getSeeAllMovies(
      {required String movieType, bool reset = false}) async {
    _isSimilarMode = false;
    _lastMovieType = movieType;

    if (reset) {
      _reset();
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

  Future<void> getSimilarMovies(
      {required int movieId, bool reset = false}) async {
    _isSimilarMode = true;
    _lastMovieId = movieId;

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

  Future<void> getCachedSeeAllMovies({required String movieType}) async {
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

  Future<void> retryLastRequest() async {
    if (_isSimilarMode && _lastMovieId != null) {
      await getSimilarMovies(movieId: _lastMovieId!, reset: false);
    } else if (_lastMovieType != null) {
      await getSeeAllMovies(movieType: _lastMovieType!, reset: false);
    }
  }

  void _reset() {
    _allMovies.clear();
    _currentPage = 1;
  }
}
