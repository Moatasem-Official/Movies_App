import 'package:bloc/bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/movies_search/domain/usecases/get_searched_movies_use_case.dart';

class MoviesSearchCubit extends Cubit<MoviesModuleStates<List<ResultEntity>>> {
  final GetSearchedMoviesUseCase getSearchedMoviesUseCase;
  MoviesSearchCubit(this.getSearchedMoviesUseCase) : super(const Idle());

  Future<void> searchMovies({
    required String query,
    required int page,
    required String apiKey,
  }) async {
    if (query.isEmpty) return emitIdle();
    emit(const Loading());
    final result = await getSearchedMoviesUseCase(
      query: query,
      page: page,
      apiKey: apiKey,
    );
    result.fold(
      (failure) => emit(Error(failure)),
      (searchedMovies) => emit(Loaded(searchedMovies.results)),
    );
  }

  void emitIdle() {
    emit(const MoviesModuleStates.idle());
  }
}
