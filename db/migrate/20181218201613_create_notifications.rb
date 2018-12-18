class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :category, foreign_key: true
      t.time :time
      t.boolean :email_notice
      t.boolean :text_notice
    end
  end
end
