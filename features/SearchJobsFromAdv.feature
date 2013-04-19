@selenium
Feature: Advanced Jobs Search
    In order to show the advanced search functionality
    As a user
    I want to search for jobs

Scenario Outline: Search for jobs from the advanced search page
    Given I am on the jobs <country> advanced search page
    When I search for jobs with this criteria: <radious> from <location>, <contract_type>, <hours>, <freshness_days>, <all_words>, <exact_match>, <or_matches>, <exclude_match>, <include_in_title>, <company>
    Then I should see at least <results> results

Examples:
   |country | radious | location |contract_type| hours      |freshness_days|all_words|exact_match|or_matches|exclude_match|include_in_title|company |results|
   | UK     | 5       | london   |permanent    | fulltime   | 1            | perl    | OFF       | ruby     | java        | manager        | google | 1000 |
   | UK     | 25      | london   |permanent    | fulltime   | 1            | OFF     | ruby      | senior   | perl        | OFF            | OFF    | 2000 |
   | UK     | 10      | london   |contract     | OFF        | 3            | java    | OFF       | junior   | OFF         | project        | OFF    | 2000 |
   | UK     | 100     | london   |OFF          | OFF        | 0            | java    | OFF       | junior   | OFF         | project        | OFF    | 1    |
   | DE     | 5       | berlin   |permanent    | fulltime   | 7            | OFF     | OFF       | mid      | C           | OFF            | IBM    | 500  |
   | DE     | 0       | OFF      |permanent    | fulltime   | 7            | C       | python    | OFF      | perl        | OFF            | OFF    | 500  |
