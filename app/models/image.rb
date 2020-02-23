class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item

# 枚数制限
  # validate :images_number_of_items
  # def check_number_of_employees
  #   if images && image.employees.count > 4
  #    errors.add(:images, "枚数OVER")
  #   end
  #  end
   
end
