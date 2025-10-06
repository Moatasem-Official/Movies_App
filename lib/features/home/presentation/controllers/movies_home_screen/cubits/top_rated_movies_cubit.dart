import 'package:bloc/bloc.dart';
import '../../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../domain/usecases/Movies_Home_Screen/get_top_rated_cached_movies_use_case.dart';
import '../../../../domain/usecases/Movies_Home_Screen/get_top_rated_movies_use_case.dart';

class TopRatedMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetTopRatedCachedMoviesUseCase getTopRatedCachedMoviesUseCase;

  TopRatedMoviesCubit(
    this.getTopRatedMoviesUseCase,
    this.getTopRatedCachedMoviesUseCase,
  ) : super(const Idle()) {
    _loadFromCacheIfOffline();
  }

  Future<void> getTopRatedMovies({int page = 1}) async {
    emit(const Loading());
    final result = await getTopRatedMoviesUseCase(page: page);
    result.fold(
      (failure) => emit(Error(failure)),
      (movies) => emit(MoviesModuleStates.loaded(movies.results)),
    );
  }

  Future<void> _loadFromCacheIfOffline() async {
    // هنا تتحقق من الانترنت قبل تحميل الكاش
    // لو offline => نجيب الكاش
    final cachedResult = await getTopRatedCachedMoviesUseCase();
    cachedResult.fold(
      (failure) => emit(const Idle()), // مفيش كاش
      (movies) {
        if (movies.results.isNotEmpty) {
          emit(MoviesModuleStates.loaded(movies.results));
        }
      },
    );
  }
}
