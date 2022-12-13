Feature: Posts feature

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * header Accept = 'application/json'

  Scenario: Get all the post
    And path '/posts'
    When method GET
    Then status 200
    And match response == '#array'

  Scenario: Get the first post
    And path '/posts/1'
    When method GET
    Then status 200
    And match response.id == 1

  Scenario: Create a post using the user 1
    And path '/posts'
    And request { "title": "FirstPost", "body": "This is a post test",  "userId": 1}
    When method post
    Then status 201
    And match response == { "id": "#number","title": "FirstPost", "body": "This is a post test",  "userId": 1}

  Scenario: Create and update a post
    And path '/posts'
    Given request { "title": "New Post", "body": "This is a post test",  "userId": 1}
    And method post
    And status 201
    And def postId = response.id
    When path '/posts/' + postId
    And request { "title": "New Updated Post"}
    And method patch
    Then status 200

  Scenario: Create and delete a post
    And path '/posts'
    Given request { "title": "New Post", "body": "This is a post test",  "userId": 1}
    And method post
    And status 201
    And def postId = response.id
    When path '/posts/' + postId
    And method delete
    Then status 200

