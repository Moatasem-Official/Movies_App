import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../core/errors/failure.dart';

part 'add_movie_to_watch_list_as_local_data_state.freezed.dart';

@freezed
class AddMovieToWatchListAsLocalDataState
    with _$AddMovieToWatchListAsLocalDataState {
  const factory AddMovieToWatchListAsLocalDataState.initial() = _Initial;
  const factory AddMovieToWatchListAsLocalDataState.loading() = _Loading;
  const factory AddMovieToWatchListAsLocalDataState.error(Failure failure) =
      _Error;
  const factory AddMovieToWatchListAsLocalDataState.getListLoading() =
      _GetListLoading;
  const factory AddMovieToWatchListAsLocalDataState.getListSuccess(
      List<ResultEntity> result) = _GetListSuccess;
  const factory AddMovieToWatchListAsLocalDataState.getListError(
      Failure failure) = _GetListError;
  const factory AddMovieToWatchListAsLocalDataState.movieAddedToWatchlist(
    String message,
  ) = _MovieAddedToWatchlist;
  const factory AddMovieToWatchListAsLocalDataState.movieRemovedFromWatchlist(
    String message,
  ) = _MovieRemovedFromWatchlist;
  const factory AddMovieToWatchListAsLocalDataState.clearAllWatchlist(
    String message,
  ) = _ClearAllWatchlist;
}
