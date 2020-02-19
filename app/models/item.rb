class Item < ApplicationRecord
  has_many  :comments,dependent: :destroy
  has_many  :likes,dependent: :destroy
  has_many  :images, dependent: :destroy
  belongs_to :users
  belongs_to :brand,optional: true
  belongs_to :category
  belongs_to :saler_id, class_name: "User"
  belongs_to :buyer_id, class_name: "User", optional: true
  accepts_nested_attributes_for :images,allow_destroy: true
  accepts_nested_attributes_for :brand
  validates :name, presence: true,length:{maximum:40}
  validates :description, presence: true,length:{maximum:1000}
  validates :condition, presence: true
  validates :derivery_chage, presence: true
  validates :days, presence: true
  validates :prifecture_id, presence: true
  validates :price, presence: true,numericality: { only_integer: true,
    greater_than: 300, less_than: 9999999
    }
# あとで追加しろ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
