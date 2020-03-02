Feature: create user
  Background:
    * url baseUrl + '/public-api'
    * def auth = call read('auth.feature')
    * header Authorization = 'Bearer ' + auth.result
  Scenario: create user
    * def getEmail =
    """
    function() {
      var UserHelper = Java.type('utils.UserHelper');
      var helper = new UserHelper();
      return helper.getRandomEmail();
    }
    """

    * def userEmail = call getEmail
    * def params =
    """
    {
      "first_name": "karate",
      "last_name": "last",
      "gender": "male",
      "email": '#(userEmail)'
    }
    """

    Given path 'users'
    And form fields params
    When method POST
    Then status 200
    # Single assertions
    Then match response..code contains 200
    Then match response..first_name contains 'karate'
    Then match response..email contains userEmail
    # Json assertions: non present keys were ignored, assert in common node
    Then match response.result contains params