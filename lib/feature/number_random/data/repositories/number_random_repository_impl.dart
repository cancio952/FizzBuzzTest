import 'package:FizzBuzzTest/core/failure/exeption.dart';
import 'package:FizzBuzzTest/core/failure/failure.dart';
import 'package:FizzBuzzTest/core/platform/network_info.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/local_number_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/remote_numote_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/repositories/number_randon_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class NumberRandomRepositoryImpl implements NumberRandomRepository {
  final NumberRandomRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalNumberRandomDataSource localDataSource;

  NumberRandomRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.networkInfo,
      @required this.localDataSource});

  @override
  Future<Either<Failure, NumberRandom>> getNumberRandom() async {
    try {
      if (await networkInfo.isConnected) {
        final remote = await remoteDataSource.getNumberRandom();
        localDataSource.cacheNumber(remote);
        return Right(remote);
      } else {
        final local = await localDataSource.getLastNumber();
        return Right(local);
      }
    } on ServerException {
      return Left(ServerFailure());
    } on CacheExeption {
      return Left(CacheFailure());
    }
  }
}
