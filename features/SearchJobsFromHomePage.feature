Feature: Jobs Search from home page
    In order to show the search functionality
    As a user
    I want to search fro jobs

Scenario: Search for jobs from te home page
    Given I am on the jobs home page
    When I search for jobs in london
    Then I should see at least 10 results
