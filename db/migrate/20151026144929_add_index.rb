class AddIndex < ActiveRecord::Migration
  def change
    add_index :trains, :route_id
    add_index :wagons, [:id, :type]
    add_index :wagons, :train_id
    add_index :tickets, :train_id
    add_index :tickets, :user_id
    add_index :tickets, :starting_station_id
    add_index :tickets, :end_station_id
    add_index :railway_stations, :route_id
    add_index :railway_stations_routes, :route_id
    add_index :railway_stations_routes, :railway_station_id
  end
end
