class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, unique: true, index: true
      t.references :saler, foreign_key: { to_table: :users },null: false
      t.references :buyer, foreign_key: { to_table: :users }
      t.string :description, null: false
      t.string :condition, null: false
      t.string :derivery_charge,null: false
      t.string :days,null: false
      t.integer :price,null: false
      t.integer :prefecture_id, null: false
      t.references  :category,foreign_key:true,null: false
      t.references  :brand, foreign_key:true

      t.timestamps
    end
  end
end
