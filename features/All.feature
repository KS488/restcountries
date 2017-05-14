Feature: As a user I want to be able to see all countries in the world So that I can then choose which country to see further details about


# Background:Given I am on the api Home page 

   Scenario: Successfully search all the countires 
     When I search for  all countries 
     Then I should be able to view all the countries 
     And  Its details listed
  

  
   
   