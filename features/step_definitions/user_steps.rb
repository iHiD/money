Given /^I am not logged in$/ do
end

Given /^I am logged in$/ do
  session[:user_id] = 1
end

Then /^I am logged in as a new user$/ do
  pending "Not sure how to test this..."
end
