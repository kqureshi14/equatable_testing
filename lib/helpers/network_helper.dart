import 'package:equatable_testing/screens/net_bloc/network_bloc.dart';
import 'package:equatable_testing/screens/net_bloc/network_event.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
