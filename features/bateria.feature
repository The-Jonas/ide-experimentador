Feature: Search experiments using bateria
    @javascript
    Scenario: The user search a test using only one tag (Happy)
        When the user is on the experiment test filtering screen
        And the user clicks on "Experimento 1" as the experiment
        And the user select or type '80%' on bateria
        And the user clicks on the filter button
        Then the user should see the tests related to the filter specified

    @javascript
    Scenario: The user search a test using only one tag (Sad)
        When the user is on the experiment test filtering screen
        And the user clicks on "Experimento 1" as the experiment
        And the user select or type '-4%' on bateria
        And the user clicks on the filter button
        Then the user should see a warning message if no tests are associated

     