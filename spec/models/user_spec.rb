require 'spec_helper'

describe User do

  describe "User factories" do

    it "should have a valid factory" do
      Fabricate.build(:user).should be_valid
    end
  end

  describe "model validation" do

    it "should require a username" do
      Fabricate.build(:user, name: "").should_not be_valid
    end

    it "should require an email" do
      Fabricate.build(:user, email: "").should raise_error
    end

    it "should not allow invalid email addresses" do
      invalid_emails = ["@domain.com", "test@domain", "te@st@domain.com", "test.domain.com"] #test coverage could be extended, but this should be enough for now
      invalid_emails.each do |invalid_email|
        Fabricate.build(:user, email: invalid_email).should_not be_valid
      end
    end

    it "should require a password and confirmation" do
      Fabricate.build(:user, password: "", password_confirmation: "").should_not be_valid
    end

    it "should require a matching password and confirmation" do
      Fabricate.build(:user, password_confirmation: "mismatch").should_not be_valid
    end
  end

  describe "model columns" do

    it "should have an email, username, password, password_confirmation and encrypted_password column" do
      @user = User.new

      ensure_model_has_columns(@user, :name, :email, :password, :password_confirmation, :encrypted_password)
    end
  end
end
