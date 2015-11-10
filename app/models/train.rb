class Train < ActiveRecord::Base
  validates :number,  presence: true
  validates :number,    uniqueness: true

  has_many    :tickets
  has_many    :wagons
  belongs_to  :route


  # def arrival_time
  #   self.route.railway_stations_routes.each do |station_time|
  #     if station_time.arrival_time.present?
  #       return station_time.arrival_time.strftime("%H:%M")
  #     else
  #       return 'Не указано'
  #     end
  #   end

  # end

  # def departure_time
  #   self.route.railway_stations_routes.each do |station_time|
  #     if station_time.departure_time.present?
  #       return station_time.departure_time.strftime("%H:%M")
  #     else
  #       return "Не указано"
  #     end
  #   end
  # end

end
