import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movie_Details_Screen/get_movie_videos_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';

class MovieVideosCubti
    extends Cubit<MoviesModuleStates<List<ResultVideoEntity>>> {
  GetMovieVideosUseCase getMovieVideosUseCase;
  MovieVideosCubti(this.getMovieVideosUseCase) : super(const Idle());
}
