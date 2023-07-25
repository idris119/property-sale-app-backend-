class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :make
      t.string :model
      t.string :colour
      t.integer :capacity
      t.decimal :price

      t.timestamps
    end
  end
end