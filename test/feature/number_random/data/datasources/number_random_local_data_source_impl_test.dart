import 'package:FizzBuzzTest/feature/number_random/data/datasources/local_number_random_datasource.dart';
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
}
