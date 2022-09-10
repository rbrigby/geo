class Address < ApplicationRecord
  # validations
  # after_validation :set_geo, on: [ :create, :update ]

  # scopes
  scope :within, -> (latitude, longitude, distance_in_mile = 1) {
    where(%{
     ST_Distance(lonlat, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_mile * 1609.34]) # approx
  }

end
