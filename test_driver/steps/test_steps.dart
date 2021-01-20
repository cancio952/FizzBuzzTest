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
