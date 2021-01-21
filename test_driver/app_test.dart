import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Number random App', () {
    final text = find.byValueKey('FizzBuzzText');
    final getButton = find.byValueKey('FizzBuzzButton');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at "push the button to get a FizzBuzz"', () async {
      expect(await driver.getText(text),
          equals("push the button to get a FizzBuzz"));
    });

    test('change', () async {
      await driver.tap(getButton);

      expect(await driver.getText(text),
          isNot(equals("push the button to get a FizzBuzz")));
    });
  });
}
