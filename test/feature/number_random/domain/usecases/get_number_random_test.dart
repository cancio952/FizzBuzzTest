import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/repositories/number_randon_repository.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/usecases/get_number_random.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberRandomRepository extends Mock
    implements NumberRandomRepository {}

void main() {
  GetNumberRandom usecase;
  MockNumberRandomRepository mockNumberRandomRepository;
  setUp(() {
    mockNumberRandomRepository = MockNumberRandomRepository();
    usecase = GetNumberRandom(mockNumberRandomRepository);
  });

  final tNumberRandom = NumberRandom(text: "test", number: 1);

  test('should get number random for the repository', () async {
    when(mockNumberRandomRepository.getNumberRandom())
        .thenAnswer((realInvocation) async => Right(tNumberRandom));

    final result = await usecase(NoParams());

    expect(result, Right(tNumberRandom));
    verify(mockNumberRandomRepository.getNumberRandom());
    verifyNoMoreInteractions(mockNumberRandomRepository);
  });
}
