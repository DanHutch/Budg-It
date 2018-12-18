class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :ynab_cid
      t.string :name
      t.references :budget, foreign_key: true
    end
  end
end
