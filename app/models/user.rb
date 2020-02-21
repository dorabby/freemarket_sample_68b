class User < ApplicationRecord
  has_many :items,dependent: :destroy
  has_many :seller_items, class_name: 'Item', foreign_key:'seller_id'
  has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  #バリデーション
  validates :nick_name, presence: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+$\z/}
  validates :name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+$\z/}
  validates :family_name_furigana, presence: true, format: {with: /\A[ぁ-んァ-ン]+$\z/}
  validates :name_furigana, presence: true, format: {with: /\A[ぁ-んァ-ン]+$\z/}
  validates :birthday, presence: true
  


  has_one :address


end
