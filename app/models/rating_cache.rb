class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, polymorphic: true

  scope :recommend_places, ->{order(avg: :desc).take Settings.popular_posts}
end
