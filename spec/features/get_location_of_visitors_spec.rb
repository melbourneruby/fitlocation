require 'spec_helper'

describe "GetLocationOfVisitors" do
  it "displays users' location" do
    visit locations_path
    click_button 'Find my Location'
    page.should have_content 'Your Location is'
    
  end
end
