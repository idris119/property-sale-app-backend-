class Land < ApplicationRecord
  def up
    add_column :lands, :featured, :boolean, default: false
  end
  
  scope :search_by_location, -> (location) {
    where("location LIKE ?", "%#{location}%")
  }
  
  def down
    remove_column :lands, :featured
  end
end