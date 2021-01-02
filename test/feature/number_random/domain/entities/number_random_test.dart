import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("getFizzBuzz", () {
    test("get Fizz", () async {
      final tNumber = NumberRandom(text: "test text", number: 3);

      final response = tNumber.getFizzBuzz();

      expect(response, equals("Fizz"));
    });

    test("get Buzz", () async {
      final tNumber = NumberRandom(text: "test text", number: 5);

      final response = tNumber.getFizzBuzz();

      expect(response, equals("Buzz"));
    });

    test("get FizzBuzz", () async {
      final tNumber = NumberRandom(text: "test text", number: 15);

      final response = tNumber.getFizzBuzz();

      expect(response, equals("FizzBuzz"));
    });

    test("get Number", () async {
      final tNumber = NumberRandom(text: "test text", number: 4);

      final response = tNumber.getFizzBuzz();

      expect(response, equals("4"));
    });
  });
}
