Feature: get users
  Background:
    * url baseUrl + '/public-api'
    * def auth = call read('auth.feature')
    * header Authorization = 'Bearer ' + auth.result
  Scenario: get users
    # path 'documents/' + documentId is equivalent to path 'documents', documentId,
    Given path 'users'
    When method get
    Then status 200
    # Then match responseStatus == 200 || responseStatus == 204
    * assert responseTime < 10000
    # Check response headers via 'header'
    And match header Server == 'nginx'
    # Check response headers via 'responseHeaders' -> return each value as an array/map-like/JSON-like
    # OR And match responseHeaders['Server'][0] == 'nginx' OR match responseHeaders['Server'] contains 'nginx'
    * print responseHeaders['Date'][0]
    * print responseCookies
    And match response._meta.success == true
    # Check array size via 'match' and '==' and '#[expected_size]'
    And match response.result == '#[20]'
    # Check for any node in array -> [*]
    # Then match response.result[*]._links.self.href contains 'https://gorest.co.in/public-api/users/57'
    # Check matches nodes at any depth -> ..
    # Then match response.result[*]..href contains 'https://lorempixel.com/250/250/people/?36504'