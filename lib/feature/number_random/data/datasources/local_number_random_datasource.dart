import 'dart:math';

import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';

abstract class LocalNumberRandomDataSource {
  ///call last number called
  ///
  /// throws a [CacheException]
  Future<NumberRandom> getRandomNumber();

  Future<void> cacheNumber(NumberRandom numberRandom);
}

class LocalNumberRandomDataSourceImpl implements LocalNumberRandomDataSource {
  @override
  Future<void> cacheNumber(NumberRandom numberRandom) {
    // TODO: implement cacheNumber
    throw UnimplementedError();
  }

  @override
  Future<NumberRandom> getRandomNumber() async {
    final numberRandom = Random();
    return NumberRandom(text: "null", number: numberRandom.nextInt(10000));
  }
}
