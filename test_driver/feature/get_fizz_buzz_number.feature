Feature: Multiple site support.
  Scenario: the button get is pressed
    Given I have "FizzBuzzButton" and "FizzBuzzText"
    When I tap the "FizzBuzzButton" button
    Then I should have the "NumberRandomPage" page

