Feature: User API Tests

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json', 'Accept': 'application/json' }
    * def userData = read('classpath:data/users.csv')

  Scenario Outline: Create new user with data from CSV
    Given path '/users'
    And request 
    """
    {
      "name": '<name>',
      "email": '<email>',
      "username": '<username>',
      "profile": {
        "age": '<age>',
        "city": '<city>',
        "occupation": '<occupation>'
      }
    }
    """
    When method post
    Then status 201
    And match response.name == '<name>'
    And match response.email == '<email>'
    And match response.username == '<username>'
    And match response.profile.city == '<city>'
    And match response.id != null

    Examples:
      | userData |

  Scenario Outline: Search users by occupation
    Given path '/users'
    And param occupation = '<occupation>'
    When method get
    Then status 200
    And match response[*].profile.occupation contains '<occupation>'
    And match response[*].email contains '<email>'

    Examples:
      | occupation       | email              |
      | Software Engineer| john@example.com   |
      | Product Manager | jane@example.com   |
      | Data Scientist  | bob@example.com    |

  Scenario Outline: Update user profile by username
    Given path '/users'
    And param username = '<username>'
    And request 
    """
    {
      "profile": {
        "city": '<newCity>',
        "occupation": '<newOccupation>'
      }
    }
    """
    When method put
    Then status 200
    And match response.profile.city == '<newCity>'
    And match response.profile.occupation == '<newOccupation>'

    Examples:
      | username  | newCity     | newOccupation    |
      | johndoe   | San Francisco| Tech Lead       |
      | janesmith | Amsterdam   | Senior PM        |
      | bobwilson | Vancouver   | ML Engineer      |

  Scenario Outline: Filter users by age range
    Given path '/users'
    And param minAge = '<minAge>'
    And param maxAge = '<maxAge>'
    When method get
    Then status 200
    And match each response[*].profile.age >= '<minAge>'
    And match each response[*].profile.age <= '<maxAge>'

    Examples:
      | minAge | maxAge |
      | 25     | 30     |
      | 31     | 35     |
      | 28     | 32     |

  Scenario: Get user by ID
    Given path '/users/1'
    When method get
    Then status 200
    And match response.id == 1
    And match response.name != null
    And match response.email != null

  Scenario: Delete user
    Given path '/users/1'
    When method delete
    Then status 200 