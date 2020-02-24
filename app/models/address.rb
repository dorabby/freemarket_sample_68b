class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+$\z/}
  validates :name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+$\z/}
  validates :family_name_furigana, presence: true, format: {with: /\A[ぁ-んァ-ン]+$\z/}
  validates :name_furigana, presence: true, format: {with: /\A[ぁ-んァ-ン]+$\z/}
  validates :potalcode, presence: true, format: {with: /\A\d{7}$\z/}
  validates :prefectures, presence: true
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :tel, format: {with: /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}, on: :tel_hoge

end
