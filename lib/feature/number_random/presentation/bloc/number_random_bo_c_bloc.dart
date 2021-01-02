import 'dart:async';

import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'number_random_bo_c_event.dart';
part 'number_random_bo_c_state.dart';

class NumberRandomBoCBloc
    extends Bloc<NumberRandomBoCEvent, NumberRandomBoCState> {
  NumberRandomBoCBloc() : super(NumberRandomBoCInitial());

  @override
  Stream<NumberRandomBoCState> mapEventToState(
    NumberRandomBoCEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
