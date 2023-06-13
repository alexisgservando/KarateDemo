Feature: Config demo

  Background: 
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Config demo
    Given print name

  #Simple Get request
  Scenario: Get Demo 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
