Feature: Jobs Search from home page
    In order to show the search functionality
    As a user
    I want to search fro jobs

Scenario Outline: Search for jobs from te home page
    Given I am on the jobs search result page
    When I search for jobs in <location>
    Then I should see at least <expected number of> results
    Scenarios:
      | location     | expected number of  |
      | london       | 400000              |
      | scotland     | 20000               |
