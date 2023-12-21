Feature: Search experiments using ativos
    @javascript
    Scenario: The user search a test using only one tag (Happy)
        When the user is on the experiment test filtering screen
        And the user clicks on "Experimento 1" as the experiment
        And the user select 'habilitado' on ativos
        And the user clicks on the filter button
        Then the user should see the tests related to the filter specified

    @javascript
    Scenario: The user search a test using only one tag (Sad)
        When the user is on the experiment test filtering screen
        And the user clicks on "Experimento 1" as the experiment
        And the user select 'desabilitado' on ativos
        And the user clicks on the filter button
        Then the user should see a warning message if no tests are associated

     