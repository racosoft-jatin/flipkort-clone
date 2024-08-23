class Brand < ApplicationRecord
	has_one_attached :image

	validate :image_validation


  private

  def image_validation
    if image.attached?
      unless image.content_type.in?(%('image/png image/jpg image/jpeg'))
        errors.add(:image, 'must be a PNG, JPG, or JPEG')
      end

      if image.byte_size > 5.megabytes
        errors.add(:image, 'size must be less than 5MB')
      end
    end
  end
end
