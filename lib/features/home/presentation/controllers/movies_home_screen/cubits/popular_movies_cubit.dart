import 'package:bloc/bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_popular_cached_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_popular_movies_use_case.dart';

class PopularMoviesCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetPopularCachedMoviesUseCase getPopularCachedMoviesUseCase;

  PopularMoviesCubit(
    this.getPopularMoviesUseCase,
    this.getPopularCachedMoviesUseCase,
  ) : super(const Idle()) {
    _loadFromCacheIfOffline();
  }

  Future<void> getPopularMovies({int page = 1}) async {
    emit(const Loading());
    final result = await getPopularMoviesUseCase(page: page);
    result.fold(
      (failure) => emit(Error(failure)),
      (movies) => emit(MoviesModuleStates.loaded(movies.results)),
    );
  }

  Future<void> _loadFromCacheIfOffline() async {
    // هنا تتحقق من الانترنت قبل تحميل الكاش
    // لو offline => نجيب الكاش
    final cachedResult = await getPopularCachedMoviesUseCase();
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
