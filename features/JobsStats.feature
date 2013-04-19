@selenium
Feature: Stats handlers
    In order to check the stats are working
    As a user
    I want to search for stats

Scenario Outline: Check stats handlers for range distribution is working
    Given I am on the jobs <country> Rangedistribution stats page
    Then I should be able to see stats

Examples:
     | country |
     | UK      |
     | DE      |

Scenario Outline: Check stats handlers for regional overview
    Given I am on the jobs <country> Regionaloverview stats page
    Then I should be able to see stats

Examples:
     | country |
     | UK      |
     | DE      |


Scenario Outline: Check stats handlers for Historicalavg
    Given I am on the jobs <country> Historicalavg stats page
    Then I should be able to see stats

Examples:
     | country |
     | UK      |
     | DE      |
