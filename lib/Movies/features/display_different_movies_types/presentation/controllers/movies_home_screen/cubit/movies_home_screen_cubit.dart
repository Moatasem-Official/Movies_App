import 'package:bloc/bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/models/result_model.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';

class MoviesHomeScreenCubit
    extends Cubit<MoviesModuleStates<ResultModel, String>> {
  MoviesHomeScreenCubit() : super(MoviesModuleStates.idle());

  Future<void> getNowPlayingMovies() async {}

  Future<void> getPopularMovies() async {}

  Future<void> getTopRatedMovies() async {}
}
