import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:to_do_app/core/injection/injection_container.dart';
import 'package:to_do_app/core/platform/network_status.dart';

class NetworkInjectionContainer extends InjectionContainer {
  NetworkInjectionContainer._internal();

  static final NetworkInjectionContainer instance =
      NetworkInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    getIt.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImp(getIt()),
    );
  }
}
