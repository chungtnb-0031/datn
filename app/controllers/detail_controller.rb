class DetailController < ApplicationController
  def index
    @places = TravelPlace.find_by name: params[:name]
    @recommend_places = RatingCache.recommend_places
    @posts = Post.where(travel_place_id: @places.id)
  end
end
