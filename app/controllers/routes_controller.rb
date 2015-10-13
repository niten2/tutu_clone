class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :remove_station, :add_station, :action_position]

  def action_position
    @station = RailwayStation.find(params[:station_id])
    @station.update_position(@route, params[:position])
    redirect_to @route
  end

  def remove_station
    @station = RailwayStation.find(params[:station])
    @route.railway_stations.delete(@station)
    redirect_to @route, notice: "Станция #{@station.name} удалена из маршрута"
  end

  def add_station
    @station = RailwayStation.find(params[:station])
    @route.railway_stations << @station
    redirect_to @route, notice: "Станция #{@station.name} добавлена в маршрут"
  end

  def index
    @routes = Route.all
  end

  def show
    @railway_stations = RailwayStation.all
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
      if @route.save
        redirect_to @route, notice: 'Маршрут создан'
      else
        render :new
      end
  end

  def update
      if @route.update(route_params)
        redirect_to @route, notice: 'Маршрут обновлен'
      else
        render :edit
      end
  end

  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Маршрут удален'
  end

  private
    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:name, railway_station_ids: [])
    end
end
