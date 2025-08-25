import 'package:bloc/bloc.dart';
import 'package:movies_app/Movies/features/movie_videos/domain/usecases/get_all_movie_videos_use_case.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';

class AllMovieVideosCubit
    extends Cubit<MoviesModuleStates<List<ResultVideoEntity>>> {
  final GetAllMovieVideosUseCase getAllMovieVideosUseCase;
  AllMovieVideosCubit(this.getAllMovieVideosUseCase) : super(const Idle());

  List<ResultVideoEntity> videos = [];

  Future<void> getMovieVideos({required int movieId, required int page}) async {
    emit(const Loading());
    final failureOrMovieVideos = await getAllMovieVideosUseCase(
      movieId: movieId,
      page: page,
    );
    failureOrMovieVideos.fold((failure) => emit(Error(failure)), (movieVideos) {
      emit(Loaded(movieVideos.results));
      videos.addAll(movieVideos.results);
    });
  }
}
