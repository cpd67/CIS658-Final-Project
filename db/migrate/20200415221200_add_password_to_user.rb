# https://medium.com/@tpstar/password-digest-column-in-user-migration-table-871ff9120a5
class AddPasswordToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
  end
end
