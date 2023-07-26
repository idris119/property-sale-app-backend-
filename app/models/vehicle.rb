class Vehicle < ApplicationRecord
    belongs_to :user
    def up
      add_column :vehicles, :featured, :boolean, default: false
    end
  
    def down
      remove_column :vehicles, :featured
    end
end
