class Vehicle < ApplicationRecord

    scope :search_by_location, -> (location) {
        where("location LIKE ?", "%#{location}%")
      }
      
end