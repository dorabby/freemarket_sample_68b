class Item < ApplicationRecord
  # has_many  :comments,dependent: :destroy
  has_many  :images, dependent: :destroy
  accepts_nested_attributes_for :images,allow_destroy: true
  belongs_to :brand
  accepts_nested_attributes_for :brand
  has_many  :likes,dependent: :destroy
  belongs_to :saler, class_name: "User", foreign_key: "saler_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :category, optional: true
  # category出来次第optional:trueを外すこと（ストロングパラメータとマイグレーションファイルも修正すること）


  validates :name, presence: true,length:{maximum:40}
  validates :description, presence: true,length:{maximum:1000}
  validates :condition, presence: true
  validates :derivery_chage, presence: true
  validates :days, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true,numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
