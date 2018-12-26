class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :ynab_cid
      t.string :name
      t.string :budget_id
      t.boolean :tracked, default: false
      t.references :user, foreign_key: true
    end
  end
end
