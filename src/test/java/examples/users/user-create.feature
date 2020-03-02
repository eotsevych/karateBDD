Feature: sample karate test script
  Background:
    * url baseUrl + '/public-api'
    * def auth = call read('auth.feature')
    * header Authorization = 'Bearer ' + auth.result
  Scenario: create user
    * def params =
  """
  {
    "first_name": "karate",
    "last_name": "last",
    "gender": "male",
    "email": "test15@test.com"
  }
  """
    Given path 'users'
    And form fields params
    When method POST
    Then status 200
    # Single assertions
    Then match response..code contains 200
    Then match response..first_name contains 'karate'
    Then match response..last_name contains 'last'
    # Json assertions: non present keys were ignored, assert in common node
    Then match response.result contains params