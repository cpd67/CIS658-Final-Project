class User < ApplicationRecord
    has_many :expenses
    has_many :categories

    validates :name, presence: true, uniqueness: true
    has_secure_password
end
