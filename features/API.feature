Feature: As a user I want to be able to see all countries in the world


# Background:Given I am on the api Home page 

  Scenario: Successfully search all the countires 
    When  I search for  all countries 
    Then  I should be able to view all the countries 
    And   Its details listed

  Scenario: Search for a particular country
     When I search for "angola"
     Then I should see a the countrys information

   Scenario: Search for a particular country that doesn't exist 
     When I search for a country that doesn't exist like "England"
     Then I should get an error