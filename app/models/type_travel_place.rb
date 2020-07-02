class TypeTravelPlace < ApplicationRecord
  has_many :travel_places

  validates :name, presence: true
end
