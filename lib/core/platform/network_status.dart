import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImp implements NetworkStatus {
  Connectivity connectivity;

  NetworkStatusImp(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) return false;

    return true;
  }
}
