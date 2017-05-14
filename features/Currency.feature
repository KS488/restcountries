
Feature: As a user I want to be able to see all countries Associated with a particular Currency so that I can then choose which country to see further details about

Scenario: Search by Currency 
     When I search for a currency like "USD" 
     Then I should see all the countries associated with the currency
