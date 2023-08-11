class AddFeaturedToVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :featured, :boolean
  end
end
