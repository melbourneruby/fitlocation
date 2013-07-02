class LocationsController < ApplicationController
  def index
    @json = Location.all.to_gmaps4rails
    @location = Location.new
    @locations = Location.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    # binding.pry
    @location = Location.new params[:location]
    if @location.save
      redirect_to locations_path, notice: 'location created successfully'
    else
      flash[:error] = @location.errors.full_messages 
      @locations = Location.all
      render 'index'
    end
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find params[:id]
    if @location.update_attributes params[:location]
      redirect_to locations_path, notice: "Successfully Updated Location"
    else
      flash[:error] = @location.errors.full_messages 
      render 'edit'
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
