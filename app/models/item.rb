class Item < ApplicationRecord
  # has_many  :comments,dependent: :destroy
  # has_many  :likes,dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user
  has_many  :images, dependent: :destroy
  validates :images, presence: true,length: { minimum: 1, maximum: 5}
  accepts_nested_attributes_for :images,allow_destroy: true

  belongs_to :brand, optional: true

  belongs_to :saler, class_name: "User", foreign_key: "saler_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :category
  
  validates :name, presence: true,length:{maximum:40}
  validates :description, presence: true,length:{maximum:1000}
  validates :condition, presence: true
  validates :derivery_charge, presence: true
  validates :days, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true,inclusion: 300..9999999
  validates :category_id, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


end
