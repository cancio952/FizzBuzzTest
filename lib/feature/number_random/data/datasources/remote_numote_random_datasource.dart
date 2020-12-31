import 'package:FizzBuzzTest/core/failure/exeption.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';

abstract class NumberRandomRemoteDatasource {
  ///call api http://numbersapi.com/random
  ///
  /// throws a [ServerException]

  Future<NumberRandom> getNumberRandom();
}
