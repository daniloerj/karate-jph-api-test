@skipme
Feature: get method board resource
  Background: config
    * url url

  @get
  Scenario: get a board
    Given path 'boards',boardId
    * params { key: #(key), token: #(token)}
    When method get
    Then status 200