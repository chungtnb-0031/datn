Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, :controllers => { :registrations => :registrations, :omniauth_callbacks => "users/omniauth_callbacks" }
  post "/rate" => "rater#create", :as => "rate"
  notify_to :users
  get "detail/index"
  get "travel_places/list_place"
  get "search/index"
  get "posts/show"
  root "static_pages#home"
  scope :admin do
    root "admin#index"
  end
  resources :users do
    member do
      get :following, :followers, :newfeed
    end
  end
  resources :relationships, only: %i(create destroy)
  resources :reactions, only: %i(show create destroy)
  resources :comments, only: %i(show edit create destroy)
  resources :posts, only: %i(create destroy)
  resources :travel_places, only: :index
  resources :cities, only: :index
end
