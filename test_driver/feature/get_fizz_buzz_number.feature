Feature : Main screen get fizz buzz number pressing the button
  Scenario: the button get is pressed
    Given I have "FizzBuzzButton" and "FizzBuzzText"
    When I tap the "FizzBuzzButton" button
    Then I should change have the text changed on "FizzBuzzText" text to "Loading ..."
    Then I should have the text changed on "FizzBuzzText" text to random number or "fizz", "buzz", "fizzbuzz"