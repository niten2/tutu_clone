Rails.application.routes.draw do
  resources :users
  resources :tickets
  resources :users
  resources :trains_routes
  resources :trains
  resources :railway_stations
  resources :routes

  root "welcome#index"
end
