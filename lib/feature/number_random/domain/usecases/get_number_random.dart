import 'package:FizzBuzzTest/core/failure/failure.dart';
import 'package:FizzBuzzTest/core/usercases/usercases.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/repositories/number_randon_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetNumberRandom implements UserCase<NumberRandom, NoParams> {
  final NumberRandomRepository repository;

  GetNumberRandom(this.repository);

  @override
  Future<Either<Failure, NumberRandom>> call(NoParams params) async {
    return await repository.getNumberRandom();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
