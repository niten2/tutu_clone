Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes

  root "welcome#index"
end
