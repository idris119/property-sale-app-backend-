class Activity < ApplicationRecord
    validates :action, presence: true, length: { maximum: 50 }
    belongs_to :user
end
