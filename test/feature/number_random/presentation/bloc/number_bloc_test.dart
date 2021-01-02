import 'package:FizzBuzzTest/core/failure/failure.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/usecases/get_number_random.dart';
import 'package:FizzBuzzTest/feature/number_random/presentation/bloc/number_random_bo_c_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetNumberRandom extends Mock implements GetNumberRandom {}

void main() {
  MockGetNumberRandom mockGetNumberRandom;
  NumberRandomBoCBloc bloc;

  setUp(() {
    mockGetNumberRandom = MockGetNumberRandom();
    bloc = NumberRandomBoCBloc(mockGetNumberRandom);
  });

  test("initialState should be Initial", () async {
    expect(bloc.state, equals(NumberRandomBoCInitial()));
  });

  group("getNumberRandom", () {
    final tNumberRandom = NumberRandom(text: "test text", number: 2);
    test("should call the respository when the event is called", () async {
      when(mockGetNumberRandom(null))
          .thenAnswer((_) async => Right(tNumberRandom));
      final expected = [
        NumberRandomBoCInitial(),
        NumberRandomBoCLoading(),
        NumberRandomBoCLoaded(tNumberRandom)
      ];
      expectLater(bloc, emitsInOrder(expected));

      bloc.add(GetNumberRandomBoCEvent());
    });

    test("should call the respository when the event fail", () async {
      when(mockGetNumberRandom(null))
          .thenAnswer((_) async => Left(ServerFailure()));
      final expected = [
        NumberRandomBoCInitial(),
        NumberRandomBoCLoading(),
        NumberRandomBoCError("Error")
      ];
      expectLater(bloc, emitsInOrder(expected));

      bloc.add(GetNumberRandomBoCEvent());
    });
  });
}
