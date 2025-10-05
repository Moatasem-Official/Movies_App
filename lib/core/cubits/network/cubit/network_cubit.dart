import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription<InternetStatus>? _internetSub;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;

  NetworkCubit() : super(const NetworkState.disconnected()) {
    _initialize();
  }

  Future<void> _initialize() async {
    // ✅ نضيف تأخير بسيط لضمان استقرار الاتصالات أول التشغيل
    await Future.delayed(const Duration(milliseconds: 500));

    // ✅ تحقق فعلي من الحالة الحالية قبل أي listeners
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

    // ✅ بعد معرفة الحالة الحقيقية، نبدأ نتابع التغييرات
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
