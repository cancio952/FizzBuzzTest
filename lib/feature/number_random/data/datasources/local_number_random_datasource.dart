import 'package:FizzBuzzTest/core/failure/exeption.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';

abstract class LocalNumberRandomDataSource {
  ///call last number called
  ///
  /// throws a [CacheExeption]
  Future<NumberRandom> getLastNumber();

  Future<void> cacheNumber(NumberRandom numberRandom);
}
