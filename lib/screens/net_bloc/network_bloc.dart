
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:equatable_testing/helpers/connectivity_helper.dart';
import 'package:equatable_testing/screens/net_bloc/network_event.dart';
import 'package:equatable_testing/screens/net_bloc/network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  factory NetworkBloc() => _instance;

  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();
  final ConnectivityHelper _connectivity = ConnectivityHelper.getInstance();

  void _observe(event, emit) {
    _connectivity.connectionListener.listen((bool hasConnection) {
      if (hasConnection) {
        add(NetworkNotify(isConnected: true));
      } else {
        add(NetworkNotify());
      }
    });
  }

  void _notifyStatus(NetworkNotify event, emit) async {
    if (event.isConnected) {
      emit(NetworkSuccess());
    } else {
      emit(NetworkFailure());
    }
  }
}
