import 'package:bloc/bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/discover_movies/domain/entities/movies_categories_entity.dart';
import 'package:movies_app/features/discover_movies/domain/usecases/get_discover_movies_use_case.dart';

class DiscoverMoviesCubit
    extends Cubit<MoviesModuleStates<MoviesCategoriesEntity>> {
  final GetDiscoverMoviesUseCase getDiscoverMoviesUseCase;
  DiscoverMoviesCubit(this.getDiscoverMoviesUseCase) : super(const Idle());

  Future<void> fetchDiscoverMovies() async {
    final result = await getDiscoverMoviesUseCase();
    result.fold(
      (failure) => emit(Error(failure)),
      (moviesCategories) => emit(Loaded(moviesCategories)),
    );
  }
}
