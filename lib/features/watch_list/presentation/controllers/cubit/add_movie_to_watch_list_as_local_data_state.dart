import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

part 'add_movie_to_watch_list_as_local_data_state.freezed.dart';

@freezed
class AddMovieToWatchListAsLocalDataState
    with _$AddMovieToWatchListAsLocalDataState {
  const factory AddMovieToWatchListAsLocalDataState.initial() = _Initial;
  const factory AddMovieToWatchListAsLocalDataState.loading() = _Loading;
  const factory AddMovieToWatchListAsLocalDataState.success() = _Success;
  const factory AddMovieToWatchListAsLocalDataState.error(Failure failure) =
      _Error;
  const factory AddMovieToWatchListAsLocalDataState.getListLoading() =
      _GetListLoading;
  const factory AddMovieToWatchListAsLocalDataState.getListSuccess(
      List<ResultEntity> result) = _GetListSuccess;
  const factory AddMovieToWatchListAsLocalDataState.getListError(
      Failure failure) = _GetListError;
}
