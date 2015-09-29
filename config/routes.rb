Rails.application.routes.draw do
  resources :users
  resources :tickets
  resources :users
  resources :trains_routes
  resources :trains
  resources :railway_stations
  resources :routes

  root "welcome#index"

  post "remove_station" => "routes#remove_station"
  get "remove_station" => "routes#remove_station"

  post "add_station" => "routes#add_station"
  get "add_station" => "routes#add_station"

end
