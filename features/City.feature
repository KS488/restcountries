
Feature: As a user I want to be able to search for a  country by the cpital city So that I can then see further details about the country 

Scenario: Search by capital city 
     When I search for a capital city like "London"
     Then I should see the country associated with the capital city 

   Scenario: Search using an incorrect capital city  
     When I search Using a capital city that doesn't exist like"California"
     Then I should get an error message 
