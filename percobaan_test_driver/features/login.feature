Feature: Main Screen Validates and then Logs in
    Scenario: when email and password are in specified format and login is clicked
        Given I have "emailfield" and "passfield" and "LoginButton"
        When I fill the "emailfield" field with "wizana@gmail.com"
        And I fill the "passfield" field with "password"
        Then I tap the "LoginButton" button
        Then I should have "HomePage" on screen