class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :amount
      t.date :expense_date

      t.timestamps
    end
  end
end
