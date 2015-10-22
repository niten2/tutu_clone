class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }

  def station_name(find_id)
    # binding.pry
     # = railway_station_id
    RailwayStation.find_by(id, find_id).name
  end


end
