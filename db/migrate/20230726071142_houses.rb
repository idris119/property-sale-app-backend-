class Houses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :location
      t.integer :size
      t.integer :price
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :amenities
      t.string :image

      t.integer :distance
      t.string  :description
      t.boolean :is_approved, default: false

      t.timestamps
    end
  end 
end