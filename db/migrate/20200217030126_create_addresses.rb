class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name, null: false
      t.string :name, null: false
      t.string :family_name_furigana,   null: false                   
      t.string :name_furigana,          null: false   
      t.integer :potalcode, null: false
      t.string :prefectures, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building_name
      t.integer :tel
      t.references :user
      t.timestamps
    end
  end
end

