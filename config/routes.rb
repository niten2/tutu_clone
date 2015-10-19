Rails.application.routes.draw do

  devise_for :users do
  end

  namespace :admin do

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

    resources :routes
    resources :trains_routes

  end

  resource  :search,        only: [:new, :show, :edit]

  resources :tickets, shallow: true do
    patch :buy, on: :member
  end

  root "welcome#index"

  post  "remove_station"  => "routes#remove_station"
  get   "remove_station"  => "routes#remove_station"

  post  "add_station"     => "routes#add_station"
  get   "add_station"     => "routes#add_station"

  post  "add_wagon"       => "trains#add_wagon"
  get   "add_wagon"       => "trains#add_wagon"

  post  "remove_wagon"    => "trains#remove_wagon"
  get   "remove_wagon"    => "trains#remove_wagon"

  get   "back_train"      => "wagons#back_train"
  post  "sort_wagons"     => "trains#sort_wagons"

end

# resources :sleeping_wagons, controller: 'wagons'
# resources :seat_wagons    , controller: 'wagons'
# resources :economy_wagons , controller: 'wagons'
# resources :coupe_wagons   , controller: 'wagons'
# resources :sleeping_wagons, controller: 'wagons', type: 'SleepingWagons'
# resources :seat_wagons    , controller: 'wagons', type: 'SeatWagon'
# resources :economy_wagons , controller: 'wagons', type: 'EconomyWagon'
# resources :coupe_wagons   , controller: 'wagons', type: 'CoupeWagon'
# post "update_position" => "railway_stations#update_position"
# resources :trains
# resources :users
# resources :users
