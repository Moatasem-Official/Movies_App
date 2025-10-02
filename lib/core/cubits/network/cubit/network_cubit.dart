import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkCubit extends Cubit<bool> {
  late StreamSubscription subscription;

  NetworkCubit() : super(true) {
    subscription = InternetConnection().onStatusChange.listen(
      (InternetStatus status) {
        if (status == InternetStatus.connected) {
          emit(true);
        } else {
          emit(false);
        }
      },
    );
  }
  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
