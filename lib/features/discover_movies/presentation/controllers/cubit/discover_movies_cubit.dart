import 'package:bloc/bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/discover_movies/domain/entities/movies_categories_entity.dart';
import 'package:movies_app/features/discover_movies/domain/usecases/get_cached_discover_movies_use_case.dart';
import 'package:movies_app/features/discover_movies/domain/usecases/get_discover_movies_use_case.dart';

class DiscoverMoviesCubit
    extends Cubit<MoviesModuleStates<MoviesCategoriesEntity>> {
  final GetDiscoverMoviesUseCase getDiscoverMoviesUseCase;
  final GetCachedDiscoverMoviesUseCase getCachedDiscoverMoviesUseCase;
  DiscoverMoviesCubit(
      this.getDiscoverMoviesUseCase, this.getCachedDiscoverMoviesUseCase)
      : super(const Idle()) {
    _loadFromCacheIfOffline();
  }

  Future<void> _loadFromCacheIfOffline() async {
    // هنا تتحقق من الانترنت قبل تحميل الكاش
    // لو offline => نجيب الكاش
    final cachedResult = await getCachedDiscoverMoviesUseCase();
    cachedResult.fold(
      (failure) => emit(const Idle()), // مفيش كاش
      (categories) {
        if (categories.genres.isNotEmpty) {
          emit(MoviesModuleStates.loaded(categories));
        }
      },
    );
  }

  Future<void> fetchDiscoverMovies() async {
    emit(const Loading());
    final result = await getDiscoverMoviesUseCase();
    result.fold(
      (failure) => emit(Error(failure)),
      (moviesCategories) => emit(Loaded(moviesCategories)),
    );
  }
}
