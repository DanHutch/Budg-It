class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.string :refresh_token
    end
  end
end
