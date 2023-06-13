Feature: Post API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedResponse = read("response1.json")
    * def sendRequest = read("request2.json")

  # Simple Post request
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Raghav", "job": "teacher"}
    When method POST
    Then status 201
    And print response

  # Post with Background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name": "Raghav", "job": "teacher"}
    When method POST
    Then status 201
    And print response

  # Post with Assertions
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name": "Raghav", "job": "teacher"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore", "name": "Raghav", "id": "#string", "job": "teacher"}
    And print response

  # Post with read response from file | "$" is equivalent to "response"
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name": "Raghav", "job": "teacher"}
    When method POST
    Then status 201
    And match response == expectedResponse
    And match $ == expectedResponse
    And print response

  # Post with read request from file | "$" is equivalent to "response" || THERE IS AN ERROR WITH THIS TEST SINCE THE OBJECT IS CREATED WITH 2 FIELDS ONLY; 2 FIELDS ARE MISSING
  #Scenario: Post Demo 5
  #  Given path '/users'
  #  And def projectPath = karate.properties['user.dir']
  #  And print projectPath
  #  And def filePath = projectPath+'/src/test/java/data/request1.json'
  #  And print filePath
  #  And def requestBody1 = filePath
  #  And request requestBody1
  #  And print requestBody1
  #  When method POST
  #  Then status 201
  #  And match response == expectedResponse
  #  And print response
    
    # Post with read request from file | "$" is equivalent to "response"
  Scenario: Post Demo 5
    Given path '/users'
    And request sendRequest
    When method POST
    Then status 201
    And match response == expectedResponse
    And match $ == expectedResponse
    And print response
