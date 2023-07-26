class AddFeaturedToHouses < ActiveRecord::Migration[7.0]
  def up
    add_column :houses, :featured, :boolean, default: false
  end

  def down
    remove_column :houses, :featured
  end
end
