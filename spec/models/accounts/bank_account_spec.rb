require 'spec_helper'

describe Accounts::BankAccount do
  
  before(:each) do
    @bank_account = Accounts::BankAccount.new(:user => mock_model("User"),  
                                              :name => "Test Account",
                                              :description => "My HSBC Bank Account")
  end
end