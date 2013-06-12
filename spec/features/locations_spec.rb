require 'spec_helper'

describe "Locations" do
  before do
     @location = Location.create longitude:-37.7553, latitude:144.9173, category:'pull up bar'
  end
  
  describe "GET /locations" do
    it "display some locations" do
      visit locations_path
      page.should have_content 'pull up bar'
    end
    
    it "creates a new location" do
      visit locations_path
      fill_in 'location_longitude', with: -38.686868
      fill_in 'location_latitude', with: 138.232323
      fill_in 'location_category', with: 'chin up bar'
      click_button 'Create Location'
      
      current_path.should == locations_path
      page.should have_content 'chin up bar'
      
      # save_and_open_page
    end
  end
  
  describe "PUT /locations" do
    it "edits a location" do
      visit locations_path
      click_link "edit"
      current_path.should == edit_location_path(@location)
      find_field('location_category').value.should == 'pull up bar'
      fill_in 'location_longitude', with: -222.222222
      fill_in 'location_latitude', with: 444.444444
      fill_in 'location_category', with: 'no bar'
      click_button 'Update Location'
      
      page.should have_content 'no bar'
    end
    
    it "should not update an empty field" do
      visit locations_path
      click_link 'edit'
      
      fill_in 'location_longitude', with: ""
      click_button 'Update Location'
      
      current_path.should == edit_location_path(@location)
      page.should have_content "Error Updating Empty Fields"
    end
  end
  
  describe "DELETE /locations" do
    it "should delete a location" do
      visit locations_path
      # find ("#location_#{@location.id}").click_link 'delete'
      delete_link = find(:css, "#location_#{@location.id}")
      delete_link.click_link 'delete'
    end
  end
end