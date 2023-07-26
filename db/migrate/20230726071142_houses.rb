class Houses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :type
      t.integer :bedrooms
      t.integer :price
      t.integer :distance
      t.string  :description
      t.string :image 

      t.timestamps
    end
  end 
end
