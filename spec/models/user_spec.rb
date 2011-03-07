require 'spec_helper'

describe User do

  before(:each) do
    @valid_attributes = {
      :login => "NewUser",
      :password => "12345678",
      :password_confirmation => "12345678",
      :email => "newuser@newuser.com",
    }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
