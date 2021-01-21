import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets extends Given2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2) async {
    final text = find.byValueKey(input1);
    final button = find.byValueKey(input2);

    await FlutterDriverUtils.isPresent(world.driver, text);
    await FlutterDriverUtils.isPresent(world.driver, button);
  }

  @override
  RegExp get pattern => RegExp(r"I have {string} and {string}");
}

class ClickFizzBuzzButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String fizzBuzzButton) async {
    final button = find.byValueKey(fizzBuzzButton);
    await FlutterDriverUtils.tap(world.driver, button);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckIfRandomNumberPageIsPresent
    extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final homeFinder = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(world.driver, homeFinder);
  }

  @override
  RegExp get pattern => RegExp("I should have the {string} page");
}
