import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/discover_movies/domain/usecases/get_category_movies_use_case.dart';
import 'package:movies_app/features/movies_search/domain/usecases/get_searched_movies_use_case.dart';

class CategoryMoviesCubit
    extends Cubit<MoviesModuleStates<DisplayDifferentMoviesTypesEntity>> {
  final GetCategoryMoviesUseCase getCategoryMoviesUseCase;
  final GetSearchedMoviesUseCase getSearchedMoviesUseCase;

  CategoryMoviesCubit(
    this.getCategoryMoviesUseCase,
    this.getSearchedMoviesUseCase,
  ) : super(const Idle());

  Future<void> fetchCategoryMovies(int genreId, int page) async {
    emit(const Loading());
    final result = await getCategoryMoviesUseCase(genreId, page);
    result.fold(
      (failure) => emit(Error(failure)),
      (moviesCategories) => emit(Loaded(moviesCategories)),
    );
  }



  Future<void> searchInCategory(int genreId, String query, int page) async {
    emit(const Loading());
    final result = await getSearchedMoviesUseCase(
        page: page, query: query, apiKey: AppConstants.kApiKey);
    result.fold(
      (failure) => emit(Error(failure)),
      (searchResults) {
        final filtered = searchResults.results
            .where((movie) => movie.genreIds.contains(genreId))
            .toList();

        final entity = DisplayDifferentMoviesTypesEntity(
          page: searchResults.page,
          results: filtered,
          dates: searchResults.dates,
        );

        emit(Loaded(entity));
      },
    );
  }
}
