@ignore
Feature: get auth token
  Background:
    * url baseUrl
  Scenario: get token
    * def getToken =
    """
    function(args) {
      var ResponseParserUtil = Java.type('utils.ResponseParserUtil');
      var parser = new ResponseParserUtil();
      return parser.getToken(args);
    }
    """
    Given path 'rest-console.html'
    When method get
    Then status 200
    * def result = call getToken response
    Then print 'Created token - ', result
    And match result == '#notnull'