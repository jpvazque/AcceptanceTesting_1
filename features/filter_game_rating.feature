# language: en

Feature: Search games by rating

  @gamesByRating
  Scenario: Filter games with ratings: M
    Given a set of games
    | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
    | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
    | Splatoon                   | 2016         | Nintendo             | T      |
    | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
    | The Last of Us             | 2013         | Naughty Dog          | M      |
    Given the user chooses ratings: M
    When user search games by ratings
    Then 2 games will match
    And the list with these games is
    | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
    | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
    | The Last of Us             | 2013         | Naughty Dog          | M      |
    And the following message is displayed: 2 games were found with ratings: M


  @gamesByName
  Scenario: Filter games by rating without finding result
    Given a set of games
    | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
    | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
    | Splatoon                   | 2016         | Nintendo             | T      |
    | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
    | The Last of Us             | 2013         | Naughty Dog          | M      |
    Given the user chooses ratings F
    When user search games by ratings
    Then 0 games will match
    And the following message is displayed: No game with the specified ratings was found.