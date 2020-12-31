import 'package:FizzBuzzTest/core/platform/network_info.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/local_number_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/remote_numote_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/repositories/number_random_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements NumberRandomRemoteDatasource {}

class MockLocalDataSource extends Mock implements LocalNumberRandomDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberRandomRepositoryImpl repositoryImpl;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    repositoryImpl = NumberRandomRepositoryImpl(
      networkInfo: mockNetworkInfo,
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group("get Number Random", () {
    test("should check if the device is online", () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repositoryImpl.getNumberRandom();

      verify(mockNetworkInfo.isConnected);
    });

    group("device online",(){
      setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((realInvocation) async=> true);
      });

      test("should retrunr remote data  when the device is online",(){

        when (mockRemoteDataSource.getNumberRandom()).thenAnswer((_) async => tn)

      });

    });
    group("device offline",(){});
  });
}
