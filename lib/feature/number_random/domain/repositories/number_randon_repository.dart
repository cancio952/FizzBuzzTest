import 'package:FizzBuzzTest/core/failure/failure.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:dartz/dartz.dart';

abstract class NumberRandomRepository {
  Future<Either<Failure, NumberRandom>> getNumberRandom();
}
