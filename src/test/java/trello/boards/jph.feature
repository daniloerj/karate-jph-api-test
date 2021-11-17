@skipme
Feature: jph test
  Background:
    * url 'https://jsonplaceholder.typicode.com/'
  @getUsers
  Scenario: get a users
    Given path 'users'
    When method get
    Then status 200

  @getPosts
  Scenario: get posts
    Given path 'posts'
    When method get
    Then status 200