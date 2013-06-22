class LocationsController < ApplicationController
  def index
    @json = Location.all.to_gmaps4rails
    @location = Location.new
    @locations = Location.all
  end
  
  def create
    # binding.pry
    @location = Location.new params[:location]
    if @location.save
      redirect_to locations_path, notice: 'location created successfully'
    else
      redirect_to locations_path, notice: 'location creation failed'
    end
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
  
  def show
    @location = Location.find(params[:id])
    @json = @location.to_gmaps4rails
  end
end
