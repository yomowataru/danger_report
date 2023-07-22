class Report < ApplicationRecord
  # geocoded_by :address_city
  # after_validation :geocode, if: :address_city_changed?

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  
  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags, dependent: :destroy
end
