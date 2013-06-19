class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :category, :address
  
  validates_presence_of :category, :address
  
  acts_as_gmappable :process_geocoding => :geocode?
  
  def geocode?
    (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
  end

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, Australia" 
  end
  
end
