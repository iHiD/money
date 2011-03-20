Feature: User
    
    If I do not have an account and am not logged in, I can signup
    
    Scenario: Signup
        Given I am not logged in      
        When I am on the signup page
        And I fill in the following:
            | user_name | Jeremy Walker|
            | user_email | jez.walker@gmail.com |
            | user_password | asd123 |
            | user_password_confirmation | asd123 |
        And I press "user_submit"
        Then I should be on the overview page