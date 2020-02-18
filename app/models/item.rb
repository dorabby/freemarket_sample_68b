class Item < ApplicationRecord
  has_many  :comments,dependent: :destroy
  has_many  :likes,dependent: :destroy
  has_many  :images, dependent: :destroy
  belongs_to :users
  belongs_to :brand,optional: true
  belongs_to :category
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  accepts_nested_attributes_for :images,allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :condition, presence: true
  validates :size, presence: true
  validates :derivery_chage, presence: true
  validates :days, presence: true
  validates :prifecture, presence: true
  validates :price, presence: true


  enum condition:  { "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}, _prefix: true
  enum size: {L:1,M:2,S:3},_prefix: true
  enum derivery_chage: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  enum days: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3},_prefix: true
# あとで追加しろ
end
