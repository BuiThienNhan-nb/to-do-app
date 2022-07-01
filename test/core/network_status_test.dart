import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_app/core/platform/network_status.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late NetworkStatusImp networkStatusImp;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkStatusImp = NetworkStatusImp(mockConnectivity);
  });

  group('is connected', () {
    test('connect via wifi', () async {
      // arrange
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) => Future.value(ConnectivityResult.wifi));
      // act
      final result = await networkStatusImp.isConnected;
      // assert
      verify(() => mockConnectivity.checkConnectivity());
      expect(result, true);
    });

    test('connect via ethernet', () async {
      // arrange
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) => Future.value(ConnectivityResult.ethernet));
      // act
      final result = await networkStatusImp.isConnected;
      // assert
      verify(() => mockConnectivity.checkConnectivity());
      expect(result, true);
    });

    test('connect via mobile', () async {
      // arrange
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) => Future.value(ConnectivityResult.mobile));
      // act
      final result = await networkStatusImp.isConnected;
      // assert
      verify(() => mockConnectivity.checkConnectivity());
      expect(result, true);
    });
  });

  test('not connected', () async {
    // arrange
    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) => Future.value(ConnectivityResult.none));
    // act
    final result = await networkStatusImp.isConnected;
    // assert
    verify(() => mockConnectivity.checkConnectivity());
    expect(result, false);
  });
}
