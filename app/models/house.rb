class House < ApplicationRecord
    def up
      add_column :houses, :featured, :boolean, default: false
    end
  
    def down
      remove_column :houses, :featured
    end  
end
