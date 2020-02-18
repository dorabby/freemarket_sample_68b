class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, unique: true, index: true
      t.bigint :seller, foreign_key: { to_table: :users },null: false
      t.bigint :buyer, foreign_key: { to_table: :users }
      t.string :description, null: false
      t.string :condition, null: false
      t.integer :derivery_chage,null: false
      t.integer :days,null: false
      t.string :prefecture,null: false
      t.integer :price,null: false
      t.references  :category,null: false, foreign_key:true
      t.references  :brand, foreign_key:true
      t.timestamps
    end
  end
end
