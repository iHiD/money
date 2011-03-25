Feature: Bank Account

    So that I can keep track of my balances
    I want to be able to create bank accounts that I can move money in and out of
    
    Scenario: Create a bank account and move some money around
        pending "Make this UI based"
        Given I am a user
        When I create a bank account with a balance of 100
        And credit it by 50
        And debit it by 20
        Then I should have a balance of 130
        
    Scenario: Transfer money between two bank accounts
        pending "Make this UI based"
        Given I am a user
        And I have a bank account called "Current Account" with a balance of 500
        And I have a bank account called "Savings Account" with a balance of 8000
        When I transfer 700 from the bank account called "Savings Account" to the bank account called "Current Account"
        Then the bank account called "Current Account" should have a balance of 1200
        And the bank account called "Current Account" should be a transaction of 700
        And the bank account called "Savings Account" should have a balance of 7300
        And the bank account called "Savings Account" should be a transaction of -700