Feature: some reusable
  Background: config
    * url url
  @deleteBoard
  Scenario: delete a board
    Given path 'boards',boardId
    * params { key: #(key), token: #(token)}
    When method delete
    Then status 200

  @deleteBoardWithTime
  Scenario: delete a board
    Given path 'boards',boardId
    * params { key: #(key), token: #(token)}
    When method delete
    Then status 200
    And responseTime<3000