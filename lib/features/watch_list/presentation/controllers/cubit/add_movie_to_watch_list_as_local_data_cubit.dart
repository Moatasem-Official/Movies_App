import 'package:bloc/bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/watch_list/domain/usecases/add_movie_to_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/clear_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/get_all_watch_list_movies_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/remove_movie_from_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

class AddMovieToWatchListAsLocalDataCubit
    extends Cubit<AddMovieToWatchListAsLocalDataState> {
  final AddMovieToWatchListUseCase addMovieToWatchListUseCase;
  final ClearWatchListUseCase clearWatchListUseCase;
  final GetAllWatchListMoviesUseCase getAllWatchListMoviesUseCase;
  final RemoveMovieFromWatchListUseCase removeMovieFromWatchListUseCase;

  final Set<int> watchlistIds = {};

  AddMovieToWatchListAsLocalDataCubit(
    this.addMovieToWatchListUseCase,
    this.clearWatchListUseCase,
    this.getAllWatchListMoviesUseCase,
    this.removeMovieFromWatchListUseCase,
  ) : super(const AddMovieToWatchListAsLocalDataState.initial());

  bool isMovieInWatchList(int movieId) {
    return watchlistIds.contains(movieId);
  }

  void returnToIdle() =>
      emit(const AddMovieToWatchListAsLocalDataState.initial());

  Future<void> addMovieToWatchList({required ResultEntity movie}) async {
    emit(const AddMovieToWatchListAsLocalDataState.loading());
    try {
      await addMovieToWatchListUseCase(movie: movie);
      watchlistIds.add(movie.id);
      emit(const AddMovieToWatchListAsLocalDataState.movieAddedToWatchlist(
        '',
      ));
      await getAllWatchListMovies();
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }

  Future<void> removeMovieFromWatchList({required int movieId}) async {
    emit(const AddMovieToWatchListAsLocalDataState.loading());
    try {
      await removeMovieFromWatchListUseCase(movieId: movieId);
      watchlistIds.remove(movieId);
      emit(const AddMovieToWatchListAsLocalDataState.movieRemovedFromWatchlist(
        '',
      ));
      await getAllWatchListMovies();
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }

  Future<void> clearAllMoviesFromWatchList() async {
    emit(const AddMovieToWatchListAsLocalDataState.loading());
    try {
      await clearWatchListUseCase();
      watchlistIds.clear();
      emit(const AddMovieToWatchListAsLocalDataState.clearAllWatchlist(
        '',
      ));
      emit(const AddMovieToWatchListAsLocalDataState.getListSuccess([]));
    } on Failure catch (e) {
      emit(AddMovieToWatchListAsLocalDataState.error(e));
    }
  }

  Future<void> getAllWatchListMovies() async {
    emit(const AddMovieToWatchListAsLocalDataState.getListLoading());
    final movies = await getAllWatchListMoviesUseCase();
    movies.fold(
      (failure) => emit(AddMovieToWatchListAsLocalDataState.error(failure)),
      (movies) {
        watchlistIds
          ..clear()
          ..addAll(movies.map((m) => m.id));
        emit(AddMovieToWatchListAsLocalDataState.getListSuccess(movies));
      },
    );
  }

  Future<void> toggleMovieInWatchList(ResultEntity movie) async {
    if (isMovieInWatchList(movie.id)) {
      await removeMovieFromWatchList(movieId: movie.id);
    } else {
      await addMovieToWatchList(movie: movie);
    }
  }
}
