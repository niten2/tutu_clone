class RailwayStation < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  def update_position(route, position)

    join_table = route.railway_stations_routes.find_by(railway_station_id: id)
    join_table.position = position.to_i
    join_table.save
  end
end
