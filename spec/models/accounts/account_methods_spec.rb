require 'spec_helper'

class Accounts::GenericAccount < ActiveRecord::Base
  
  #FIXME - Remove this and make this model just bypass the database
  set_table_name "bank_accounts"
  is_an_account 
end

describe "An account (e.g. Bank Account, Credit Card, Loan)" do
  
  before(:each) do
    @generic_account = Accounts::GenericAccount.new(:user => mock_model("User"),  
                                                    :name => "Test Account",
                                                    :description => "My HSBC Generic Account")
  end
  
  it "should inherit the account's errors" do
    @generic_account = Accounts::GenericAccount.new(:user => nil,  
                                                    :name => "Test Account",
                                                    :description => "My HSBC Generic Account")

    @generic_account.save                                              

    # Check the underlying account has the key as a sanity check
    @generic_account.account.errors.should have_key(:user) 

    # Then check it has been passed into the account
    @generic_account.errors.should have_key(:user)
  end

  it "should call account's methods as its own" do
    @generic_account = Accounts::GenericAccount.new
    
    @generic_account.should_not respond_to(:debit)
    
    #FIXME - Should check that this does not raise an error.
    @generic_account.debit(10)
  end
end