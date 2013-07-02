class AddColumnsToLocations < ActiveRecord::Migration
  def change

    add_column :locations, :address, :text 
    add_column :locations, :gmaps, :boolean 

  end
end
