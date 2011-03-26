
###############
# Given Steps #
###############
Given /^I am a user$/ do
  @user = User.create!(:name => "Jeremy Walker",
                       :email => "jez.walker@gmail.com",
                       :password => "asdqwe123",
                       :password_confirmation => "asdqwe123")
end

Given /^I have a bank account called "([^"]*)" with a balance of (\d+)$/ do |name, balance|
  @bank_accounts ||= {}
  @bank_accounts["name"] = Accounts::BankAccount.create!(:user => @user,
                                                        :name => name,
                                                        :description => "My new bank account called #{name}",
                                                        :balance => balance)
end

##############
# When Steps #
##############
When /^I create a bank account with a balance of (\d+)$/ do |balance|
  @bank_account = Accounts::BankAccount.create!(:user => @user,
                                                :name => "New Bank Account",
                                                :description => "My new bank account",
                                                :balance => balance)
end

When /^credit it by (\d+)$/ do |amount|
  @bank_account.credit(amount)
end

When /^debit it by (\d+)$/ do |amount|
  @bank_account.debit(amount)
end

When /^I transfer (\d+) from the bank account called "([^"]*)" to the bank account called "([^"]*)"$/ do |amount, name1, name2|
  account1 = @bank_accounts[name1]
  account2 = @bank_accounts[name2]
  account1.transfer(amount, account2)
end

##############
# Then Steps #
##############
Then /^I should have a balance of (\d+)$/ do |expected_balance|
  @bank_account.balance.should == expected_balance.to_f
end

Then /^the bank account called "([^"]*)" should have a balance of (\d+)$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^the bank account called "([^"]*)" should be a transaction of (\d+)$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^the bank account called "([^"]*)" should be a transaction of \-(\d+)$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
