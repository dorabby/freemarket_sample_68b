class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :prefecture_id, null: false
      t.string :city
      t.string :name, null: false, unique: true, index: true
      t.references :saler, foreign_key: { to_table: :users },null: false
      t.references :buyer, foreign_key: { to_table: :users }
      t.string :description, null: false
      t.string :condition, null: false
      t.integer :derivery_chage,null: false
      t.integer :days,null: false
      t.integer :price,null: false
      t.references  :category, foreign_key:true
      # ↑categoryできるまでnull: falseを外しているので注意 category出来次第記入後、db:dropして作り直すこと
      t.references  :brand, foreign_key:true

      t.timestamps
    end
  end
end
