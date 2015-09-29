class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :remove_station, :add_station]

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
      params.require(:route).permit(:name)
    end
end

# @route = Route.find(params[:id])
# params[:id] = params[:format]
    # # p @station
    # p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    # p params[:station]
    # p params
    # @route.railway_stations - @station
    # puts "!!!!"
    # redirect_to @route, notice: 'Станция удалена из Маршрута'
# p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
#     p params



    # @route.railway_stations.each_with_index do |row, row_i |
    #   @route.railway_stations.delete_at(row_i) if row == @station
    # end

    # index_station = @route.railway_stations.find_index(@station)
    # @route.railway_stations.delete_at(index_station)


    # (i = @route.railway_stations.find_index(@station)) &&  @route.railway_stations.delete_at(i)
