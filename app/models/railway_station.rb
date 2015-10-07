class RailwayStation < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  # has_many :tickets

end
