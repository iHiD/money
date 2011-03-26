require 'spec_helper'

describe Account do
  
  before(:each) do
    @account = Account.new(:owner => mock_model(Accounts::BankAccount),
                           :user => mock_model(User),  
                           :name => "Test Account",
                           :description => "My HSBC Bank Account")
  end
  
  describe "A new account" do
    
    it "should save with default values" do
      @account.save
      @account.should_not be(:new_record)
    end
    
    it "must have an owner" do
      @account.owner = nil
      @account.save
      @account.errors.should have_key(:owner)
    end  
    
    it "must have a user" do
      @account.user = nil
      @account.save
      @account.errors.should have_key(:user)
  
      @account.user_id = 0
      @account.save
      @account.errors.should have_key(:user)
  
      @account.user_id = nil
      @account.save
      @account.errors.should have_key(:user)
  
      @account.user = User.new
      @account.save
      @account.errors.should have_key(:user_id)
    end

   it "must have a name" do
      @account.name = nil
      @account.save
      @account.errors.should have_key(:name)
    end

    it "must have a description" do
      @account.description = nil
      @account.save
      @account.errors.should have_key(:description)
    end

    it "can have a balance specified" do
      @account.balance = 54321
      @account.save
      @account.balance.should == 54321
    end

    it "should have a default balance of 0 if none is specified" do
      @account.save!
      @account.balance.should == 0
    end
  end
  
  describe "An account" do
    
    before(:each) do
      @account.save!
    end
  
    it "should keep a record of any manual balance changes" do
      @account.balance = 1234
      @account.save
      @account.balance.should == 1234
      @account.transactions.length.should == 1
      @account.transactions[0].amount.should == 1234
    end
  
    describe "can only have 2dp in the balance" do
      it "which should round up >= 0.5" do
        @account.balance = 1111.115
        @account.save!
        @account.balance.to_f.should == 1111.12
      end
    
      it "and should round down < 0.5" do
        @account.balance = 1111.1149
        @account.save!
        @account.balance.should == 1111.11
      end
    end
  
    it "can have money credited into it" do
      @account.balance = 10
      @account.credit(3)
      @account.balance.should == 13
    end

    it "can have money debited from it" do
      @account.balance = 10
      @account.debit(3)
      @account.balance.should == 7
    end
  end
end