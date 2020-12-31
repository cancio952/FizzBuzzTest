import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:flutter/foundation.dart';

class NumberRandomModel extends NumberRandom {
  NumberRandomModel({@required String text, @required int number})
      : super(text: text, number: number);

  factory NumberRandomModel.fromJson(Map<String, dynamic> json) {
    return NumberRandomModel(
        text: json["text"], number: (json["number"] as num).toInt());
  }
}
