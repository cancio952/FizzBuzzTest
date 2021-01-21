import 'dart:async';

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/feature/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      CheckGivenWidgets(),
      ClickFizzBuzzButton(),
      CheckIfRandomNumberPageIsPresent(),
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/main.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}