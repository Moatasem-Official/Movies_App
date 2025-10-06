import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../domain/entities/movie_images_entity.dart';
import '../../../../domain/usecases/Movie_Details_Screen/get_movie_images_use_case.dart';

class MovieImagesCubit extends Cubit<MoviesModuleStates<MovieImagesEntity>> {
  final GetMovieImagesUseCase getMovieImagesUseCase;
  MovieImagesCubit(this.getMovieImagesUseCase) : super(const Idle());

  Future<void> getMovieImages({required int movieId}) async {
    emit(const Loading());
    final failureOrMovieImages = await getMovieImagesUseCase(
      movieId: movieId,
    );
    failureOrMovieImages.fold(
      (failure) => emit(Error(failure)),
      (movieImages) => emit(Loaded(movieImages)),
    );
  }
}
