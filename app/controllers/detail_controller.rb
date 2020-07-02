class DetailController < ApplicationController
  def index
    @places = TravelPlace.find_by name: params[:name]
    @popular_places = TravelPlace.popular_places
    @posts = Post.where(travel_place_id: @places.id)
  end
end
