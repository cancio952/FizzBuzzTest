import 'dart:convert';

import 'package:FizzBuzzTest/core/failure/exeption.dart';
import 'package:FizzBuzzTest/feature/number_random/data/models/number_random_model.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/entities/number_random.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class NumberRandomRemoteDatasource {
  ///call api http://numbersapi.com/random
  ///
  /// throws a [ServerException]

  Future<NumberRandom> getNumberRandom();
}

class NumberRandomRemoteDataSourceImpl extends NumberRandomRemoteDatasource {
  final http.Client client;

  NumberRandomRemoteDataSourceImpl({@required this.client});

  @override
  Future<NumberRandom> getNumberRandom() async {
    final response = await client.get("http://numbersapi.com/random",
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return NumberRandomModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
