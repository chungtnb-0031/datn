class TravelPlace < ApplicationRecord
  ratyrate_rateable "quality"

  belongs_to :type_travel_place
  belongs_to :city

  has_many :travel_place_images, dependent: :destroy
  scope :order_by_name, ->(_name){order :name}

  scope :get_places, ->(name, type){where("name like ?", "%#{name}%") | where(type_travel_place_id: type)}
  scope :search_by_name, ->(name){where "name like ?", name}
  scope :get_type, ->(type){where "type_travel_place_id = ?", type}

  validates :name, presence: true
  validates :city_id, presence: true

  delegate :name, to: :city, prefix: :city, allow_nil: true
  delegate :name, to: :type_travel_place, prefix: :type_travel_place
end
