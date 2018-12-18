class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.references :notification, foreign_key: true
      t.string :day
    end
  end
end
