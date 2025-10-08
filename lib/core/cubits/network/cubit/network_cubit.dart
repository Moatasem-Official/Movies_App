import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription<InternetStatus>? _internetSub;
  Timer? _debounceTimer;
  String _lastConnectionType = "none";

  NetworkCubit() : super(const NetworkState.initializing()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(milliseconds: 300));

    await _checkAndEmitStatus();

    _internetSub = InternetConnection().onStatusChange.listen((status) async {
      // ⏳ Debounce لتجنب التغييرات اللحظية
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 800), () async {
        await _checkAndEmitStatus();
      });
    });
  }

  Future<void> _checkAndEmitStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final type = connectivityResult.isNotEmpty
        ? _mapConnectivityToType(connectivityResult.first)
        : "none";
    _lastConnectionType = type;

    final hasInternet = await InternetConnection().hasInternetAccess;

    final newState = hasInternet && type != "none"
        ? NetworkState.connected(type)
        : const NetworkState.disconnected();

    // ✅ منعملش emit لنفس الحالة لتجنب تكرار SnackBars
    if (state.runtimeType != newState.runtimeType ||
        (state is Connected && (state as Connected).connectionType != type)) {
      emit(newState);
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
    _debounceTimer?.cancel();
    return super.close();
  }

  Future<void> checkNetwork() async {
    await _checkAndEmitStatus();
  }
}
