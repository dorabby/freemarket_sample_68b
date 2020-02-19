class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      # t.integer :card_number, null: false
      # t.integer :token, null: false
      # t.integer :expiration_date_year, null: false
      # t.integer :expiration_date_manth, null: false
      t.integer :user_id, null: false
      t.string :customer_id, null: false
      t.string :card_id, null: false
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
