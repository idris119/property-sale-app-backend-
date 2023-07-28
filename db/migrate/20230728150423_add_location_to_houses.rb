class AddLocationToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :location, :string
  end
end
