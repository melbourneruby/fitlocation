require 'spec_helper'

feature "user sign in" do

	scenario "user signs in with valid information" do
		@user = Fabricate(:user)

		visit new_user_session_path

		fill_in 'user[email]', with: @user.email
		fill_in 'user[password]', with: @user.password

		click_button 'Sign in'
		page.should have_content('Signed in successfully.')
	end
end