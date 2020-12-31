import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl({@required this.dataConnectionChecker});

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected async =>
      await dataConnectionChecker.hasConnection;
}
