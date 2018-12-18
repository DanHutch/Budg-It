class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.references :user, foreign_key: true
      t.string :ynab_bid
      t.string :name
    end
  end
end
