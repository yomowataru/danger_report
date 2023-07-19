class Report < ApplicationRecord
  geocoded_by :address_city
  after_validation :geocode, if: :address_city_changed?

end
