class City < ApplicationRecord
  has_many :travel_places

  scope :order_by_name, ->(_name){order :name}
  scope :search_by_name, ->(name){where "name like ?", name}

  validates :name, presence: true
end
