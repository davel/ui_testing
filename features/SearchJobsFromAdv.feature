@selenium
Feature: Advanced Jobs Search
    In order to show the advanced search functionality
    As a user
    I want to search for jobs

Scenario Outline: Search for jobs from the advanced search page
    Given I am on the jobs <country> advanced search page
    When I search for jobs with this criteria: <radious> from <location>, <contract_type>, <hours>, <freshness_days>
    Then I should see at least <results> results

Examples:
      |country | radious | location |contract_type | hours      | freshness_days | results |
      | UK     | 5       | london   |permanent     | fulltime   | 1              |   1000  |
      | UK     | 25      | london   |permanent     | fulltime   | 1              |   2000  |
      | UK     | 10      | london   |contract      | OFF        | 3              |   2000  |
      | DE     | 5       | berlin   |permanent     | fulltime   | 7              |   500   |
      | DE     | 0       | OFF      |permanent     | fulltime   | 7              |   500   |
