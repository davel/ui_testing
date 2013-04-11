@selenium
Feature: Advanced Jobs Search
    In order to show the advanced search functionality
    As a user
    I want to search for jobs

Scenario: Search for jobs from the advanced search page
    Given I am on the jobs UK advanced search page
    When I search for jobs with the criteria:
      | Contract type | permanent |
      | Hours         | part time |
      | Radious       | 5 miles   |
    Then I should see at least 500 results
