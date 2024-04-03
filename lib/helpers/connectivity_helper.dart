import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper {
  ConnectivityHelper._internal();

  //This creates the single instance by calling the `_internal` constructor specified below
  static final _singleton = ConnectivityHelper._internal();

  //This is what's used to retrieve the instance through the app
  static ConnectivityHelper getInstance() => _singleton;

  final Connectivity _connectivity = Connectivity();

  StreamSubscription? _connectivitySubscription;

  //Add this Stream that return true if internet connections is availbale
  final _connectionStream = StreamController<bool>();

  //Add this to access to _connectionSteam with other classes
  Stream<bool> get connectionListener => _connectionStream.stream;

  //This tracks the current connection status
  bool hasConnection = false;

  //This tracks if "_connectionStream" has already a Listener
  //to be sure that no other liestener is being created.
  bool _hasListener = false;

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];

  //Functiona to check if there is any internet connection available
  Future<bool> checkHasConnection() async {
    final connection = await _connectivity.checkConnectivity();
    _updateConnectionStatus(connection);
    return connection != ConnectivityResult.none;
  }

  //INitializ methos to initialize the connectivity
  void initialize() {
    if (!_hasListener) {
      //We only neeed to call _connectivity.onConnectivityChanged once
      _hasListener = true;
      _connectivity.onConnectivityChanged.listen((result) {
        _connectionStream.add(result != ConnectivityResult.none);
      });
    }
    checkConnection();
  }

  void subscribe(void Function(ConnectivityResult) callback) {
    _connectivitySubscription ??= _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result;
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    return hasConnection;
  }

  //A clean up method to close our StreamController
  //   Because this is meant to exist through the entire application life cycle this isn't
  //   really an issue
  void dispose() {
    _connectionStream.close();
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }
}
