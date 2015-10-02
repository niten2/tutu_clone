class RailwayStation < ActiveRecord::Base
  validates :name, presence: true
  # belongs_to :route
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

end
