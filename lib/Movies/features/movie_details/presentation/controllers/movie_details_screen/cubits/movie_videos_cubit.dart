import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_videos_use_case.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';

class MovieVideosCubit
    extends Cubit<MoviesModuleStates<List<ResultVideoEntity>>> {
  final GetMovieVideosUseCase getMovieVideosUseCase;
  MovieVideosCubit(this.getMovieVideosUseCase) : super(const Idle());

  Future<void> getMovieVideos({required int movieId}) async {
    emit(Loading());
    final result = await getMovieVideosUseCase(movieId: movieId);
    result.fold(
      (failure) => emit(Error(failure)),
      (videos) => emit(Loaded(videos.results)),
    );
  }
}
