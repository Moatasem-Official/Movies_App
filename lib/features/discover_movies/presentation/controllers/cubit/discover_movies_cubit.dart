import 'package:bloc/bloc.dart';
import '../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/movies_categories_entity.dart';
import '../../../domain/usecases/get_cached_discover_movies_use_case.dart';
import '../../../domain/usecases/get_discover_movies_use_case.dart';

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
      (failure) => emit(const Error(
          CacheFailure("No Internet and No Cached Data"))), // مفيش كاش
      (categories) {
        if (categories.genres.isNotEmpty) {
          emit(MoviesModuleStates.loaded(categories));
        } else {
          emit(const Error(CacheFailure("No Internet and No Cached Data")));
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
