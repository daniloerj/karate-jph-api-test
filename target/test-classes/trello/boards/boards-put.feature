@skipme
Feature: method put board resource
  Background: config
    * url url
  @put
  Scenario: update a board
    Given path 'boards',boardId
    * params { key: #(key), token: #(token)}
    And request requestBody
    When method put
    Then status 200