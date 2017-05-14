
Feature: As a user I want to be able to see all countries in the world Using the country Code So that I can then choose which country to see further details about


 Scenario: Search by code
     When I search for a  country using the code "col"
     Then I should see the country associated with the code 

    Scenario: Search using an incorrect code  
     When I search Using an incorrect code that doesn't exist like"c03"
     Then I should get some sort of an error
