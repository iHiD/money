
When /^I login with valid details$/ do
  user = User.create(:name => "asd", :password => "asd", :password_confirmation => "asd", :email => "asd")
  fill_in(:email, :with => user.email)
  fill_in(:password, :with => user.password)
  click_button("login")
end