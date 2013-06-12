class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :longitude, :precision => 10, :scale => 6
      t.decimal :latitude, :precision => 10, :scale => 6
      t.string :category

      t.timestamps
    end
  end
end
