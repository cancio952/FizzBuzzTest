import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class NumberRandom extends Equatable {
  final String text;
  final int number;

  NumberRandom({@required this.text, @required this.number});

  @override
  List<Object> get props => [text, number];

  String getFizzBuzz() {
    final isDivicibleBy3 = number % 3 == 0;
    final isDivicibleBy5 = number % 5 == 0;
    if (isDivicibleBy3 && isDivicibleBy5)
      return "FizzBuzz";
    else if (isDivicibleBy3)
      return "Fizz";
    else if (isDivicibleBy5)
      return "Buzz";
    else
      return number.toString();
  }
}
