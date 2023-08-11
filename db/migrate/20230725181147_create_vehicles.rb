class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_type
      t.string :make
      t.string :model
      t.string :colour
      t.integer :capacity
      t.decimal :price
      t.string :image
      t.boolean :is_approved, default: false

      t.timestamps
    end
  end
end