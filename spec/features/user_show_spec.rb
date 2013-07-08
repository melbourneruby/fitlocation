require 'spec_helper'

feature "show user information" do

	scenario "show a user" do
		@user = Fabricate(:user)
		login(@user)

		visit user_path(@user)

		page.should have_content(@user.name)
	end
end