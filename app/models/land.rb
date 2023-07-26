class Land < ApplicationRecord
    def up
      add_column :lands, :featured, :boolean, default: false
    end
  
    def down
      remove_column :lands, :featured
    end
end
