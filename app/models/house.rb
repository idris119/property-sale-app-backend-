class House < ApplicationRecord
  def up
    add_column :houses, :featured, :boolean, default: false
  end

  scope :search_by_location, -> (location) {
    where("location LIKE ?", "%#{location}%")
  }

  def down
    remove_column :houses, :featured
  end  
end