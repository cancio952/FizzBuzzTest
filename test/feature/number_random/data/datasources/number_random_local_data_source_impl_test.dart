import 'package:FizzBuzzTest/feature/number_random/data/datasources/local_number_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferebces extends Mock implements SharedPreferences {}

void main() {
  LocalNumberRandomDataSource dataSource;
  MockSharedPreferebces mockSharedPreferebces;

  setUp(() {
    mockSharedPreferebces = MockSharedPreferebces();
    dataSource = LocalNumberRandomDataSourceImpl(
        sharedPreferences: mockSharedPreferebces);
  });

  group("getRandomNumber", () {
    test("should return a Number Random ", () async {
      final result = await dataSource.getRandomNumber();

      expect(result, isInstanceOf<NumberRandom>());
    });
  });
}
