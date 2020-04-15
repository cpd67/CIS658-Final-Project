class Expense < ApplicationRecord
    belongs_to :user
    # https://stackoverflow.com/questions/27589399/add-nullable-foreign-key-in-rails
    belongs_to :category, optional: true
end
