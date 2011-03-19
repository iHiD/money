Feature: Bank Account

    So that I can keep track of my balances
    I want to be able to create bank accounts that I can move money in and out of
    
    Scenario: Create a bank account and move some money around
        Given I am a user
        When I create a bank account with a balance of 100
        And credit it by 50
        And debit it by 20
        Then I should have a balance of 130