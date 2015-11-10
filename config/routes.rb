Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'sessions',registrations: "registrations"  }

  root "welcome#index"
  get "description" => "welcome#description"
  resources :tickets

  resource  :search, only: [:new, :show, :edit]

  namespace :admin do

    get   "welcome"       => "welcome#index"
    resources :routes
    resources :trains_routes
    resources :tickets

    resources :railway_stations do
      patch :update_attributes, on: :member
    end

    resources :trains do
      resources :wagons, shallow: true
      resources :sleeping_wagons, controller: 'wagons', type: 'sleeping_wagons'
      resources :seat_wagons    , controller: 'wagons', type: 'seat_wagon'
      resources :economy_wagons , controller: 'wagons', type: 'economy_wagon'
      resources :coupe_wagons   , controller: 'wagons', type: 'coupe_wagon'
    end
  end




end

# devise_scope :user do
#   # resources :tickets
#   root to: "devise/sessions#new"
# end
