import 'dart:convert';

import 'package:FizzBuzzTest/feature/number_random/data/models/number_random_model.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_jsons/file_locator.dart';

void main() {
  final tNumberRandom = NumberRandomModel(text: "test Text", number: 3);

  test('should be a subclass if NumberRandom', () async {
    expect(tNumberRandom, isA<NumberRandom>());
  });

  group('fromJson', () {
    test("should return a valid model when the Json number is  an integer",
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(stringLocator("number_random.json"));

      final result = NumberRandomModel.fromJson(jsonMap);

      expect(result, tNumberRandom);
    });
    test("should return a valid model when the Json number is  an double",
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(stringLocator("double_random.json"));

      final result = NumberRandomModel.fromJson(jsonMap);

      expect(result, tNumberRandom);
    });
  });
}
