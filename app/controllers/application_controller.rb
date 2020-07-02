class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_place_type

  def get_place_type
    @travel_place_types = TypeTravelPlace.pluck :name, :id
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up,
      keys: [:username, :date_of_birth, :gender]
    devise_parameter_sanitizer.permit :account_update,
      keys: [:username, :date_of_birth, :gender, :avatar]
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
