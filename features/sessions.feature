Feature: Sessions

    I should be able to login and logout, and not view pages unless I am logged in.
    
    Scenario: Redirect to login unless logged in
      Given I am not logged in
      When I go to the overview page
      Then I should be on the login page
    
    Scenario: I can login
      Given I am not logged in
      When I go to the login page
      And I login with valid details
      Then I should be on the overview page
    
    Scenario: I can logout
    
    
    
    
    