require 'spec_helper'

describe User do

  it "should have a valid factory" do
    Fabricate.build(:user).should be_valid
  end

  it "should require a username" do
    Fabricate.build(:user, name: "").should_not be_valid
  end

  it "should require an email" do
    Fabricate.build(:user, email: "").should raise_error
  end

  it "should require a password and confirmation" do
    Fabricate.build(:user, password: "", password_confirmation: "").should_not be_valid
  end

  it "should require a matching password and confirmation" do
    Fabricate.build(:user, password_confirmation: "mismatch").should_not be_valid
  end

  it "should have an email, username, password, password_confirmation and encrypted_password column" do
    @user = User.new

    model_has_columns(@user, :name, :email, :password, :password_confirmation, :encrypted_password)
  end
end
