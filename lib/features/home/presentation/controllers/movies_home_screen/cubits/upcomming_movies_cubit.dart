import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../domain/usecases/Movies_Home_Screen/get_upcomming__cached_movies_use_case.dart';
import '../../../../domain/usecases/Movies_Home_Screen/get_upcomming_movies_use_case.dart';

class UpcommingMoviesCubit
    extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetUpcommingMoviesUseCase getUpcommingMoviesUseCase;
  final GetUpcommingCachedMoviesUseCase getUpcommingCachedMoviesUseCase;

  UpcommingMoviesCubit(
    this.getUpcommingMoviesUseCase,
    this.getUpcommingCachedMoviesUseCase,
  ) : super(const Idle()) {
    _loadFromCacheIfOffline();
  }

  Future<void> getUpcommingMovies({int page = 1}) async {
    emit(const Loading());
    final result = await getUpcommingMoviesUseCase(page: page);
    result.fold(
      (failure) => emit(Error(failure)),
      (movies) => emit(MoviesModuleStates.loaded(movies.results)),
    );
  }

  Future<void> _loadFromCacheIfOffline() async {
    // هنا تتحقق من الانترنت قبل تحميل الكاش
    // لو offline => نجيب الكاش
    final cachedResult = await getUpcommingCachedMoviesUseCase();
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
