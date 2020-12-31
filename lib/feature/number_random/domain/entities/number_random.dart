import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class NumberRandom extends Equatable {
  final String text;
  final int number;

  NumberRandom({@required this.text, @required this.number});

  @override
  List<Object> get props => [text, number];
}
