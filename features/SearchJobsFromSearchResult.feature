@selenium
Feature: Jobs Search from result page
    In order to show the search functionality
    As a user
    I want to search for jobs

Scenario Outline: Search for jobs from the result page
    Given I am on the jobs <country> search result page
    When I search for jobs in <location>
    Then I should see at least <expected number of> results

Examples:
      |country  | location     | expected number of  |
      | UK      | london       | 80000               |
      | UK      | scotland     | 20000               |
      | DE      | bayern       | 25000               |
