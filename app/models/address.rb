class Address < ApplicationRecord
  belongs_to :user, optional: true
  #validates :family_name, :name, :family_name_furigana, :name_furigana, :potalcode, :address, :prefectures,  :municipalities, presence: true
end
