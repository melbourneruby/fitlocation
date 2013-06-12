require 'spec_helper'

feature "Locations" do
  scenario "displays locations" do
    visit locations_path
    page.should have_content 'location match'
  end
end