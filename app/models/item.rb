class Item < ApplicationRecord
  belong_to :user
  belongs_to :brand
  has_many :categorys
  has_many :comments
  has_many :images
end
