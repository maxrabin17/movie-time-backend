class User < ApplicationRecord
    has_secure_password
    has_many :watch_laters
    validate :username, uniquness: true, presence: true
    validates :username, length: { minimum: 2 }
    validates :password, presence: true
    validates :password, length: { minimum: 4 }
    validates :password_confirmation, presence: true
end
