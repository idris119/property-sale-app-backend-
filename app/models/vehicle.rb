class Vehicle < ApplicationRecord
<<<<<<< HEAD
=======
    belongs_to :user
    def up
      add_column :vehicles, :featured, :boolean, default: false
    end
  
    def down
      remove_column :vehicles, :featured
    end
>>>>>>> 213689b205304a7a81d5266011c628df5d76be67
end
