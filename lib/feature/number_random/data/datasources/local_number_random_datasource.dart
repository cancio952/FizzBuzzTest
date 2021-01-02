import 'dart:math';

import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalNumberRandomDataSource {
  ///call last number called
  ///
  /// throws a [CacheException]
  Future<NumberRandom> getRandomNumber();

  Future<void> cacheNumber(NumberRandom numberRandom);
}

class LocalNumberRandomDataSourceImpl implements LocalNumberRandomDataSource {
  final SharedPreferences sharedPreferences;

  LocalNumberRandomDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheNumber(NumberRandom numberRandom) {
    // TODO: implement cacheNumber
    throw UnimplementedError();
  }

  @override
  Future<NumberRandom> getRandomNumber() async {
    final numberRandom = Random();
    return NumberRandom(text: "null", number: numberRandom.nextInt(10000));
  }
}
