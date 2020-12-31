import 'package:FizzBuzzTest/core/failure/exeption.dart';
import 'package:FizzBuzzTest/core/failure/failure.dart';
import 'package:FizzBuzzTest/core/platform/network_info.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/local_number_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/remote_numote_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/models/number_random_model.dart';
import 'package:FizzBuzzTest/feature/number_random/data/repositories/number_random_repository_impl.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:dartz/dartz.dart';
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
    final tNumber = 3;
    final tNumberRandomModel =
        NumberRandomModel(text: "test text", number: tNumber);
    final NumberRandom tNumberRandom = tNumberRandomModel;

    test("should check if the device is online", () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repositoryImpl.getNumberRandom();

      verify(mockNetworkInfo.isConnected);
    });

    group("device online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((realInvocation) async => true);
      });

      test("should return remote data  when the device is online", () async {
        when(mockRemoteDataSource.getNumberRandom())
            .thenAnswer((_) async => tNumberRandomModel);

        final result = await repositoryImpl.getNumberRandom();
        verify(mockRemoteDataSource.getNumberRandom());
        expect(result, equals(Right(tNumberRandom)));
      });

      test("should cache the data when the data source is successful",
          () async {
        when(mockRemoteDataSource.getNumberRandom())
            .thenAnswer((_) async => tNumberRandomModel);

        await repositoryImpl.getNumberRandom();
        verify(mockRemoteDataSource.getNumberRandom());
        verify(mockLocalDataSource.cacheNumber(tNumberRandomModel));
      });

      test(
          "should return Server exception  when the call to remote data is unsuccessful",
          () async {
        when(mockRemoteDataSource.getNumberRandom())
            .thenThrow(ServerException());

        final result = await repositoryImpl.getNumberRandom();
        verify(mockRemoteDataSource.getNumberRandom());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });
    group("device offline", () {});
  });
}
