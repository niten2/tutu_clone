class RailwayStation < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  def update(route, position)
    if route.present?
      join_table = railway_stations_routes.find_by(route: route)
      join_table.position = position.to_i
      join_table.save
    end
  end
end

# binding.pry
# join_table = route.railway_stations_routes.find_by(railway_station_id: id)
