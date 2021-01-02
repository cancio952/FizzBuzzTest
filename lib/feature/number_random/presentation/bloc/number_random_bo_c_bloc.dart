import 'dart:async';

import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/usecases/get_number_random.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'number_random_bo_c_event.dart';
part 'number_random_bo_c_state.dart';

class NumberRandomBoCBloc
    extends Bloc<NumberRandomBoCEvent, NumberRandomBoCState> {
  final GetNumberRandom getNumberRandom;

  NumberRandomBoCBloc(this.getNumberRandom) : super(NumberRandomBoCInitial());

  @override
  Stream<NumberRandomBoCState> mapEventToState(
    NumberRandomBoCEvent event,
  ) async* {
    if (event is GetNumberRandomBoCEvent) {
      yield NumberRandomBoCLoading();
      final result = await getNumberRandom.call(null);
      yield result.fold((l) => NumberRandomBoCError("Error"),
          (r) => NumberRandomBoCLoaded(r));
    }
  }
}
