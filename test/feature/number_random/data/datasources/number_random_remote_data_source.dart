import 'dart:convert';

import 'package:FizzBuzzTest/core/failure/exeption.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/remote_numote_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/models/number_random_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../test_jsons/file_locator.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberRandomRemoteDataSourceImpl datasource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = NumberRandomRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("getNumberRandom", () {
    final tNumber = 1;
    final tNumberRandomModel = NumberRandomModel.fromJson(
        json.decode(stringLocator("number_random.json")));

    test("should perform GET request an URL with application/json header",
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(stringLocator("number_random.json"), 200));

      datasource.getNumberRandom();

      verify(mockHttpClient.get("http://numbersapi.com/random",
          headers: {'Content-Type': 'application/json'}));
    });

    test("should return number random when the status code is 200", () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(stringLocator("number_random.json"), 200));

      final result = datasource.getNumberRandom();

      expect(result, equals(tNumberRandomModel));
    });

    test("should throw a server exception when the status code is 404 or other",
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response("", 404));

      final result = datasource.getNumberRandom;

      // ignore: deprecated_member_use
      expect(
          () async => await result(), throwsA(isInstanceOf<ServerException>()));
    });
  });
}
