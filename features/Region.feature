Feature: As a user I want to be able to see all countries in a particular Region So that I can then choose which country to see further details about


 Scenario: Search by region
     When I search for the region  "Americas"
     Then I should see all  the countries in the Region
