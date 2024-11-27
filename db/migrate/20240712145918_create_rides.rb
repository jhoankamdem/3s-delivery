class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :pickup_location
      t.string :dropoff_location
      t.references :passenger, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.string :status
      t.decimal :price

      t.timestamps
    end
  end
end
