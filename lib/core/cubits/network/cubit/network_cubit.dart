import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription<InternetStatus>? _internetSub;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;

  NetworkCubit() : super(const NetworkState.disconnected()) {
    _init();

    // متابعة الاتصال بالإنترنت
    _internetSub = InternetConnection().onStatusChange.listen((status) async {
      final connectivityResult = await Connectivity().checkConnectivity();
      final type = connectivityResult.isNotEmpty
          ? _mapConnectivityToType(connectivityResult.first)
          : "none";

      if (status == InternetStatus.connected && type != "none") {
        emit(NetworkState.connected(type));
      } else {
        emit(const NetworkState.disconnected());
      }
    });

    // متابعة نوع الاتصال (wifi / mobile)
    _connectivitySub =
        Connectivity().onConnectivityChanged.listen((connectivityResults) {
      final type = connectivityResults.isNotEmpty
          ? _mapConnectivityToType(connectivityResults.first)
          : "none";

      if (state is Connected && type != "none") {
        emit(NetworkState.connected(type));
      }
    });
  }

  Future<void> _init() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final type = connectivityResult.isNotEmpty
        ? _mapConnectivityToType(connectivityResult.first)
        : "none";

    final status = await InternetConnection().hasInternetAccess;

    if (status && type != "none") {
      emit(NetworkState.connected(type));
    } else {
      emit(const NetworkState.disconnected());
    }
  }

  static String _mapConnectivityToType(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return "mobile";
      case ConnectivityResult.wifi:
        return "wifi";
      default:
        return "none";
    }
  }

  @override
  Future<void> close() async {
    await _internetSub?.cancel();
    await _connectivitySub?.cancel();
    return super.close();
  }

  void checkNetwork() {
    if (state is Connected) {
      emit(NetworkState.connected((state as Connected).connectionType));
    }
  }
}
