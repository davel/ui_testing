@selenium
Feature: Advanced Jobs Search
    In order to show the advanced search functionality
    As a user
    I want to search for jobs

Scenario Outline: Search for jobs from the advanced search page
    Given I am on the jobs <country> advanced search page
    When I search for jobs with this criteria: <radious>, <contract_type>, <hours>, <freshness_days>
    Then I should see at least <results> results

Examples:
      |country | radious | contract_type | hours      | freshness_days | results |
      | UK     | 5       | permanent     | fulltime   | 1              |   500   |
      | UK     | 5       | contract      | OFF        | 3              |   500   |
      | DE     | 5       | permanent     | fulltime   | 7              |   500   |
