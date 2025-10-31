@albums
Feature: Test for albums endpoint
  Background:
    * url baseUrl
    * def albumSchema = read('classpath:schemas/album-schema.json')
    * def albumData = read('classpath:testdata/albums.json')
    * path 'albums'

  @get
  Scenario: Get all albums
    When method GET
    Then status 200
    And match each response == albumSchema

  @get @single
  Scenario: Get a single album
    Given path '1'
    When method GET
    Then status 200
    And match response == albumSchema
    And match response contains { id: 1 }

  @get @filter
  Scenario: Get albums by user ID
    And param userId = 1
    When method GET
    Then status 200
    And match each response == albumSchema
    And match each response contains { userId: 1 }

  @post
  Scenario: Create a new album
    * def newAlbum = albumData.newAlbum
    
    And request newAlbum
    When method POST
    Then status 201
    And match response contains newAlbum
    And match response.id == '#number'

  @put
  Scenario: Update an existing album
    * def updateData = albumData.updateAlbum
    
    Given path '1'
    And request updateData
    When method PUT
    Then status 200
    And match response contains updateData
    And match response.id == 1

  @patch
  Scenario: Partially update an album
    * def patchData = { title: 'Patched Album Title' }
    Given path '1'
    And request patchData
    When method PATCH
    Then status 200
    And match response contains patchData
    And match response.id == 1

  @delete
  Scenario: Delete an album
    Given path '1'
    When method DELETE
    Then status 200
    And match response == {}

  @negative
  Scenario Outline: Validate error handling for invalid requests
    * def errorData = <data>
    
    And path <path>
    And request errorData
    When method <method>
    Then status <expectedStatus>
    And match response == {}

    Examples:
      | path      | method | data | expectedStatus |
      | '999999'  | GET    | null | 404           |
      | '999999'  | DELETE | null | 200           |

  @negative @title
  Scenario Outline: Validate title validation in requests
    * def invalidData = { userId: 1, title: <title> }
    
    And request invalidData
    When method POST
    Then status 201
    And match response contains invalidData
    And match response.id == '#number'

    Examples:
      | title    |
      | ''       |
      | null     |
      | 123      |
