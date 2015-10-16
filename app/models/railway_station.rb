class RailwayStation < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end

# join_table = route.railway_stations_routes.find_by(railway_station_id: id)
# def update(route, position)
#     join_table = railway_stations_routes.find_by(route: route)
#     join_table.position = position.to_i
#     join_table.save
# end
