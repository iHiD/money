
Given /^I am a user$/ do
  @user = User.create(:name => "Jeremy Walker")
end

When /^I create a bank account with a balance of (\d+)$/ do |balance|
  @bank_account = BankAccount.create(:user => @user,
                                     :balance => balance)
end

When /^credit it by (\d+)$/ do |amount|
  @bank_account.credit(amount)
end

When /^debit it by (\d+)$/ do |amount|
  @bank_account.debit(amount)
end

Then /^I should have a balance of (\d+)$/ do |expected_balance|
  @bank_account.balance.should == expected_balance.to_f
end
