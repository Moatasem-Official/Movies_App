import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription<InternetStatus>? _internetSub;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;

  NetworkCubit() : super(const NetworkState.initializing()) {
    _initialize();
  }

  Future<void> _initialize() async {
    // تأخير بسيط لضمان استقرار الشبكة في بداية التشغيل
    await Future.delayed(const Duration(milliseconds: 400));

    final connectivityResult = await Connectivity().checkConnectivity();
    final type = connectivityResult.isNotEmpty
        ? _mapConnectivityToType(connectivityResult.first)
        : "none";

    final hasInternet = await InternetConnection().hasInternetAccess;

    if (hasInternet && type != "none") {
      emit(NetworkState.connected(type));
    } else {
      emit(const NetworkState.disconnected());
    }

    // نبدأ نتابع التغييرات بعد التهيئة
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

  Future<void> checkNetwork() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final type = connectivityResult.isNotEmpty
        ? _mapConnectivityToType(connectivityResult.first)
        : "none";

    final hasInternet = await InternetConnection().hasInternetAccess;

    if (hasInternet && type != "none") {
      emit(NetworkState.connected(type));
    } else {
      emit(const NetworkState.disconnected());
    }
  }
}
