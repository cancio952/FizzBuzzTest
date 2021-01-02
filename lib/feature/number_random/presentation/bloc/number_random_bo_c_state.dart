part of 'number_random_bo_c_bloc.dart';

@immutable
abstract class NumberRandomBoCState extends Equatable {}

class NumberRandomBoCInitial extends NumberRandomBoCState {
  @override
  List<Object> get props => [];
}

class NumberRandomBoCLoading extends NumberRandomBoCState {
  @override
  List<Object> get props => [];
}

class NumberRandomBoCLoaded extends NumberRandomBoCState {
  final NumberRandom numberRandom;

  NumberRandomBoCLoaded(this.numberRandom);

  @override
  List<Object> get props => [numberRandom];
}

class NumberRandomBoCError extends NumberRandomBoCState {
  final String message;

  NumberRandomBoCError(this.message);

  @override
  List<Object> get props => [message];
}
