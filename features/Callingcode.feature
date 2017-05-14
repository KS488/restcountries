Feature: As a user I want to be able to search for a  country using the calling code  So that I can then see further details about the country

Scenario: Search by calling code 
     When I search for a  calling code like "44"
     Then I should see the country associated with the calling code 
