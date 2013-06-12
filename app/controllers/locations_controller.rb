class LocationsController < ApplicationController
  def index
    @location = Location.new
    @locations = Location.all
  end
  
  def create
    Location.create params[:location]
    redirect_to locations_path
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    location = Location.find params[:id]
    if location.update_attributes params[:location]
      redirect_to locations_path, notice: "Successfully Updated Location"
    else
      redirect_to :back, notice: "Error Updating Empty Fields"
    end
  end
  
  def destroy
    Location.destroy params[:id]
    redirect_to locations_path, notice: "Deleted"
  end
end
