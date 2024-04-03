abstract class NetworkEvent {}

class NetworkObserve extends NetworkEvent {}

class NetworkNotify extends NetworkEvent {
  NetworkNotify({this.isConnected = false});
  final bool isConnected;
}
