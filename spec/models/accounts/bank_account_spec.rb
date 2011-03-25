require 'spec_helper'

describe Accounts::BankAccount do
  
  before(:each) do
    @bank_account = Accounts::BankAccount.new(:user => mock_model("User"),  
                                              :name => "Test Account",
                                              :description => "My HSBC Bank Account")
  end
  
  describe "A new bank account" do
    it "should save with default values" do
      @bank_account.save
      @bank_account.should_not be_new_record
    end

    it "requires a user" do
      @bank_account.user = nil
      @bank_account.save
      @bank_account.errors.should have_key(:user)
  
      @bank_account.user_id = 0
      @bank_account.save
      @bank_account.errors.should have_key(:user)
  
      @bank_account.user_id = nil
      @bank_account.save
      @bank_account.errors.should have_key(:user)
  
      @bank_account.user = User.new
      @bank_account.save
      @bank_account.errors.should have_key(:user_id)
    end

   it "requires a name" do
      @bank_account.name = nil
      @bank_account.save
      @bank_account.errors.should have_key(:name)
    end

    it "requires a description" do
      @bank_account.description = nil
      @bank_account.save
      @bank_account.errors.should have_key(:description)
    end

    it "has a default balance of 0" do
      @bank_account.save
      @bank_account.balance.should == 0
    end
  end
  
  describe "A bank account" do
    
    before(:each) do
      @bank_account.save!
    end
  
    it "should keep a record of any manual balance changes" do
      @bank_account.balance = 1234
      @bank_account.save
      @bank_account.balance.should == 1234
      @bank_account.transactions.length.should == 1
      @bank_account.transactions[0].amount.should == 1234
    end
  
    describe "can only have 2dp in the balance" do
      it "which should round up >= 0.5" do
        @bank_account.balance = 1111.115
        @bank_account.save
        @bank_account.balance.to_f.should == 1111.12
      end
    
      it "and should round down < 0.5" do
        @bank_account.balance = 1111.1149
        @bank_account.save
        @bank_account.balance.should == 1111.11
      end
    end
  
    it "can have money credited into it" do
      @bank_account.balance = 10
      @bank_account.credit(3)
      @bank_account.balance.should == 13
    end

    it "can have money debited from it" do
      @bank_account.balance = 10
      @bank_account.debit(3)
      @bank_account.balance.should == 7
    end
  end
end