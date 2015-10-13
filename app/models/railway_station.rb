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



# binding.pry
# route.railways_stations.position
# position
# @route
# position.update(positions)
# .update_attribute(:position, position)
# .update(:position, position)
# route.railway_stations_routes.where(railway_station_id: id)
# Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = ?", id])
# Route.joins(:railway_stations_routes).where(["railway_stations_routes.position = ?", id])
# position
# route.railway_stations_routes.find_by(railway_station_id: id).save
# binding.pry
