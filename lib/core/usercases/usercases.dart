import 'package:FizzBuzzTest/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
