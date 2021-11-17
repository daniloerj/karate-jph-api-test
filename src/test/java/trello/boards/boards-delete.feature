@skipme
Feature: delete method of the board resource
  Background: config
    * url url
  @delete
  Scenario: delete a board
    Given path 'boards',boardId
    * params { key: #(key), token: #(token)}
    When method delete
    Then status 200