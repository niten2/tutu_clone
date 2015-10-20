class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy, :remove_station, :add_station]

  def remove_station
    @station = RailwayStation.find(params[:station])
    @route.railway_stations.delete(@station)
    redirect_to [:admin, @route], notice: "Станция #{@station.name} удалена из маршрута"
  end

  def add_station
    @station = RailwayStation.find(params[:station])
    @route.railway_stations << @station
    redirect_to [:admin, @route], notice: "Станция #{@station.name} добавлена в маршрут"
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
        redirect_to [:admin, @route], notice: 'Маршрут создан'
      else
        render :new
      end
  end

  def update
      if @route.update(route_params)
        redirect_to [:admin, @route], notice: 'Маршрут обновлен'
      else
        render :edit
      end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_url, notice: 'Маршрут удален'
  end

  private
    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:name, railway_station_ids: [])
    end
end
