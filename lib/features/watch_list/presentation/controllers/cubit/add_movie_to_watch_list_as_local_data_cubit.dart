import 'package:bloc/bloc.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/models/result_model.dart';
import 'package:movies_app/features/watch_list/domain/usecases/add_movie_to_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/clear_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/get_all_watch_list_movies_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/is_movie_in_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/remove_movie_from_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

class AddMovieToWatchListAsLocalDataCubit
    extends Cubit<AddMovieToWatchListAsLocalDataState> {
  final AddMovieToWatchListUseCase addMovieToWatchListUseCase;
  final ClearWatchListUseCase clearWatchListUseCase;
  final GetAllWatchListMoviesUseCase getAllWatchListMoviesUseCase;
  final IsMovieInWatchListUseCase isMovieInWatchListUseCase;
  final RemoveMovieFromWatchListUseCase removeMovieFromWatchListUseCase;
  AddMovieToWatchListAsLocalDataCubit(
      this.addMovieToWatchListUseCase,
      this.clearWatchListUseCase,
      this.getAllWatchListMoviesUseCase,
      this.isMovieInWatchListUseCase,
      this.removeMovieFromWatchListUseCase)
      : super(const AddMovieToWatchListAsLocalDataState.initial());

  Future<void> addMovieToWatchList({required ResultModel movie}) async {
    try {
      await addMovieToWatchListUseCase(movie: movie);
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }

  Future<void> removeMovieFromWatchList({required ResultModel movie}) async {
    try {
      await removeMovieFromWatchListUseCase(movieId: movie.id);
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }

  Future<void> clearWatchList() async {
    try {
      await clearWatchListUseCase();
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }

  Future<void> isMovieInWatchList({required ResultModel movie}) async {
    try {
      await isMovieInWatchListUseCase(movieId: movie.id);
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }

  Future<void> getAllWatchListMovies() async {
    try {
      await getAllWatchListMoviesUseCase();
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }
}
