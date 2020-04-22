class User < ApplicationRecord
    has_many :expenses
    has_many :categories

    validates :username, presence: true, uniqueness: { message: "Username is already taken" }
    has_secure_password
end
