import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_module_states.freezed.dart';

@freezed
abstract class MoviesModuleStates<T> with _$MoviesModuleStates<T> {
  const factory MoviesModuleStates.idle() = Idle<T>;
  const factory MoviesModuleStates.loading() = Loading<T>;
  const factory MoviesModuleStates.loaded(T movies) = Loaded<T>;
  const factory MoviesModuleStates.error(String message) = Error<T>;
}
