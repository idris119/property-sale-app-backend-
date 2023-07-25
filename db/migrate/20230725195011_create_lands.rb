class CreateLands < ActiveRecord::Migration[7.0]
  def change
    create_table :lands do |t|
      t.string :name
      t.string :location
      t.integer :size
      t.integer :price
      t.text :description
      t.string :amenities
      t.string :proximity_to_road
      t.boolean :messaging

      t.timestamps
    end
  end
end
