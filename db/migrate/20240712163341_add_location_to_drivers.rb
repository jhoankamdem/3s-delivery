class AddLocationToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :latitude, :float
    add_column :drivers, :longitude, :float
  end
end
