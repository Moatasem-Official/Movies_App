import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/discover_movies/domain/usecases/get_category_movies_use_case.dart';

class CategoryMoviesCubit
    extends Cubit<MoviesModuleStates<DisplayDifferentMoviesTypesEntity>> {
  final GetCategoryMoviesUseCase getCategoryMoviesUseCase;
  CategoryMoviesCubit(this.getCategoryMoviesUseCase) : super(const Idle());

  Future<void> fetchCategoryMovies(int movieId, int page) async {
    emit(const Loading());
    final result = await getCategoryMoviesUseCase(
      movieId,
      page,
    );
    result.fold(
      (failure) => emit(Error(failure)),
      (moviesCategories) => emit(Loaded(moviesCategories)),
    );
  }
}
