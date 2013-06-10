require 'spec_helper'

describe "Locations" do
  describe "GET /locations" do
    it "displays locations"
    visit locations_path
    page.should have_content 'location match'
  end
end
