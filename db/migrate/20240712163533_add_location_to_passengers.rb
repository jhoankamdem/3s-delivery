class AddLocationToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :latitude, :float
    add_column :passengers, :longitude, :float
  end
end
