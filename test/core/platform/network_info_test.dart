import 'package:FizzBuzzTest/core/platform/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl netWorkInfoImpl;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    netWorkInfoImpl =
        NetworkInfoImpl(dataConnectionChecker: mockDataConnectionChecker);
  });

  group('isConnected', () {
    test("should forward the call to DataConnectionChecker has a connection",
        () async {
      final tHasConnectionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      final results = netWorkInfoImpl.isConnected;

      verify(mockDataConnectionChecker.hasConnection);
      expect(results, tHasConnectionFuture);
    });
  });
}
