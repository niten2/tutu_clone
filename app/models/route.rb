class Route < ActiveRecord::Base
  validates :name, presence: true
  validate  :stations_count
  # validates :name, uniqueness: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, -> { order('railway_stations_routes.position') }, through: :railway_stations_routes

  # scope :position, -> { order "position" }

  before_validation :set_name


  def self.search_in_route_train(start_station_id, end_station_id)
    found_routes = []
    found_train = []

    self.all.each do |route|
      if route.railway_stations.find_by(id: start_station_id) && route.railway_stations.find_by(id: end_station_id)
        found_routes << route
      end
    end

    found_routes.each do |found_route|
      found_route.trains.each do |train|
        found_train << train
      end
    end
    return found_train
  end

private

  def set_name
    self.name ||= "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end

end

