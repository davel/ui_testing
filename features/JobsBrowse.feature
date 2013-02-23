Feature: Jobs browse pages
    In order to show the browse functionality
    As a user
    I want to browse through jobs

Scenario Outline: Browse through jobs category from the home page
    Given I am on the jobs home page
    When I browse jobs category <category>
    Then I should get the browse <category> page
    Scenarios:
      | category          |
      | it-jobs           |
      | engineering-jobs  |
