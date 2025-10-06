import 'package:bloc/bloc.dart';
import '../../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../domain/usecases/Movies_Home_Screen/get_now_playing_cached_movies_use_case.dart';
import '../../../../domain/usecases/Movies_Home_Screen/get_now_playing_movies_use_case.dart';

class NowPlayingMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetNowPlayingCachedMoviesUseCase getNowPlayingCachedMoviesUseCase;

  NowPlayingMoviesCubit(
    this.getNowPlayingMoviesUseCase,
    this.getNowPlayingCachedMoviesUseCase,
  ) : super(const Idle()) {
    _loadFromCacheIfOffline();
  }

  Future<void> getNowPlayingMovies({int page = 1}) async {
    emit(const Loading());
    final result = await getNowPlayingMoviesUseCase(page: page);
    result.fold(
      (failure) => emit(Error(failure)),
      (movies) => emit(MoviesModuleStates.loaded(movies.results)),
    );
  }

  Future<void> _loadFromCacheIfOffline() async {
    // هنا تتحقق من الانترنت قبل تحميل الكاش
    // لو offline => نجيب الكاش
    final cachedResult = await getNowPlayingCachedMoviesUseCase();
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
