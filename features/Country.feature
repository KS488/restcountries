
Feature: As a user I want to be able to search for a particular country  So that I can see further details about the country 

Scenario: Search for a particular country
     When I search for "angola"
     Then I should see a the countrys information

   Scenario: Search for a particular country that doesn't exist 
     When I search for a country that doesn't exist like"England"
     Then I should get an error