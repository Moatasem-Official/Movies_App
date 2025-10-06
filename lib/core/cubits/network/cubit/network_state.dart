import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_state.freezed.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.initializing() = Initializing;
  const factory NetworkState.connected(String connectionType) = Connected;
  const factory NetworkState.disconnected() = Disconnected;
}
