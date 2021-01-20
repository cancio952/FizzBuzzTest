Feature : Main screen get fizz buzz number pressing the button
  Scenario: the button get is pressed
    Given I have "FizzBuzzButton" and "FizzBuzzText"
    Then I tap the "FizzBuzzButton" button
    Then I should have the "NumberRandomPage" page
