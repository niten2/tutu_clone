class RailwayStation < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  def update(route, position)
      join_table = railway_stations_routes.find_by(route: route)
      join_table.position = position.to_i
      join_table.save
  end
end


# join_table = route.railway_stations_routes.find_by(railway_station_id: id)
