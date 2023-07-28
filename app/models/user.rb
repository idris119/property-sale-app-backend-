class User < ApplicationRecord
    has_many :vehicles
    has_many :lands
    has_many :houses
    has_many :chat_messages
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :phone_number, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, on: :create

end
