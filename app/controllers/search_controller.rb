class SearchController < ApplicationController
  def index
    if params[:search_place_name].blank? && params[:location].blank? && params[:type].blank?
      redirect_to root_path
    else
      @travel_places = TravelPlace
                       .get_places(params[:search_place_name],
                         params[:type])
    end
  end
end
