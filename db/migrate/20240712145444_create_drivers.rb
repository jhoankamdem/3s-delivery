class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :vehicle
      t.decimal :rating

      t.timestamps
    end
  end
end
