import 'package:FizzBuzzTest/di/inyector.dart' as di;
import 'package:FizzBuzzTest/feature/number_random/presentation/pages/NumberRandomPage.dart';
import 'package:flutter/material.dart';

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FizzBuzzTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NumberRandomPage(),
    );
  }
}
