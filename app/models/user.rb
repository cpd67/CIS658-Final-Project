class User < ApplicationRecord
    has_many :expenses
    has_many :categories

    # https://guides.rubyonrails.org/active_record_validations.html#message
    validates :username, presence: true, uniqueness: { message: "Username is already taken" }
    has_secure_password
end
