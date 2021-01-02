import 'package:FizzBuzzTest/feature/number_random/data/datasources/local_number_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LocalNumberRandomDataSource dataSource;

  setUp(() {
    dataSource = LocalNumberRandomDataSourceImpl();
  });

  group("getRandomNumber", () {
    test("should return a Number Random ", () async {
      final result = await dataSource.getRandomNumber();

      expect(result, isInstanceOf<NumberRandom>());
    });
  });
}
