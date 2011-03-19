require 'spec_helper'

describe User do
  it "requires a name" do
    user = User.new
    user.save
    user.errors.should have_key(:name)
  end
end
