class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :category
  
  validates_presence_of :category, :longitude, :latitude
end
