import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_module_states.freezed.dart';

@freezed
abstract class MoviesModuleStates<T, E> with _$MoviesModuleStates {
  const factory MoviesModuleStates.idle() = _Idle;
  const factory MoviesModuleStates.loading() = _Loading;
  const factory MoviesModuleStates.loaded(T movies) = _Loaded;
  const factory MoviesModuleStates.error(E message) = _Error;
}
