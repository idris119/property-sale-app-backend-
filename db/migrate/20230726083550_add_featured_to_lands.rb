class AddFeaturedToLands < ActiveRecord::Migration[7.0]
  def change
    add_column :lands, :featured, :boolean
  end
end
