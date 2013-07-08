require 'spec_helper'

feature "User signup" do

	scenario "user signs up with valid input" do
		visit new_user_registration_path

		fill_in "user[name]", with: "Test User"
		fill_in "user[email]", with: "test@domain.com"
		fill_in "user[password]", with: "testtest"
		fill_in "user[password_confirmation]", with: "testtest"

		click_button "Sign up"
		page.should have_content('Welcome! You have signed up successfully.')
	end
end