class Report < ApplicationRecord
  geocoded_by :address_city
  after_validation :geocode, if: :address_city_changed?

  has_one_attached :image

  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags, dependent: :destroy
end
