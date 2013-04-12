@selenium
Feature: Advanced Jobs Search
    In order to show the advanced search functionality
    As a user
    I want to search for jobs

Scenario Outline: Search for jobs from the advanced search page
    Given I am on the jobs <country> advanced search page
    When I search for jobs with this criteria: <radious>, <contract_type>, <hours>
    Then I should see at least <results> results

Examples:
      |country | radious | contract_type | hours | results |
      | UK     | 5       | permanent     | full  | 500     |
      | DE     | 5       | permanent     | full  | 500     |
