class TravelPlaceImage < ApplicationRecord
  belongs_to :travel_place

  validates :travel_place_id, presence: true
end
