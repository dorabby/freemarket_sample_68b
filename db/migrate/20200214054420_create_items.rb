class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,null:false
      t.string :description,null:false
      t.string :condition,null:false
      t.integer :derivery_charge,null:false
      t.integer :price ,null:false
      t.integer :size ,null:false
      t.integer :days,null:false
      t.integer :buyer_id
      t.integer :saler_id

      t.references :user,foreign_key: true
      t.references :item_images,foreign_key: true
      t.references :brand,foreign_key: true
        # カテゴリあとでいれる
      t.timestamps
    end
  end
end
