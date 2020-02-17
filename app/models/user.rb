class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #バリデーション
  validates :nick_name, :family_name, :name, :family_name_furigana, :name_furigana, :birthday, presence: true
  has_one :address
end
