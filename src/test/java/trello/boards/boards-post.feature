@skipme
Feature: method post about board resource
  Background: config
    * url url

  @create
  Scenario: create a board
    * def params =
    """
    {
      'key': '38e7987a4fa0c6195e8c27df9d27c099',
      'secret-key': 'ded3a4377f5f21610a033dd2248cdf303a01847fd5b2f7d2fbb444a5fb0b4064',
      'token': '25c156a6489e519ab5e799bfbf14601721a4438835ea2c1efbb9cca7c4248ad3'
    }
    """
    Given path 'boards'
    #* params { key: #(key), token: #(token)}
    * form fields params
    And request requestBody
    When method post
    Then status 200
    * assert responseTime <3000
    * match responseType == 'json'
    * assert responseStatus == 200 || responseStatus == 204
    * def contentType = responseHeaders['Content-Type'][0]
    * match contentType contains 'application/json'