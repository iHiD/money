require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new(:name => "Jeremy Walker",
                     :email => "jez.walker@gmail.com",
                     :password => "asd123",
                     :password_confirmation => "asd123")
  end

  it "should hash the password on save" do
    @user.save!
    @user.password_hash.should_not be_empty
  end

  it "should not change the password hash if the password does not change" do
    @user.save!
    hash = @user.password_hash
    user2 = User.find(@user.id)
    user2.touch
    user2.save!
    user2.password_hash.should == hash
  end
  
  it "should create with valid values" do
    @user.save
    @user.should_not be_new_record
  end
  
  it "requires a name" do
    @user.name = nil
    @user.save
    @user.errors.should have_key(:name)
  end
  it "requires an email" do
    @user.email = nil
    @user.save
    @user.errors.should have_key(:email)
  end
  it "must have a unique email" do
    pending
  end
  
  it "requires a password on create" do
    @user = User.new(:password => nil)
    @user.save
    @user.errors.should have_key(:password)
  end
  
  it "does not require a password on update" do
    @user.save
    @user = User.find(@user.id)
    @user.touch
    @user.errors.should_not have_key(:password)
  end
  
  it "can be authenticated" do
    @user.save
    
    User.authenticate(@user.email, @user.password).should_not == nil
  end
end
