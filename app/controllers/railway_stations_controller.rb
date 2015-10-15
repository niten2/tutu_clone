class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy]

  before_action :set_route, only: [:update_position]

  def update_position
    @station = RailwayStation.find(params[:station_id])
    @station.update(@route, params[:position])
    redirect_to @route
  end

  def index
    @railway_station = RailwayStation.new
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)
      if @railway_station.save
        redirect_to @railway_station, notice: 'Станция создана'
      else
        render :new
      end
  end

  # def create
  #   @railway_station = RailwayStation.new(railway_station_params)

  #   respond_to do |format|
  #     if @railway_station.save
  #       format.json { render json: @railway_station, status: :created}
  #     else
  #       format.json { render json: @railway_station.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to @railway_station, notice: 'Станция обновлена'
    else
      render :edit
    end
  end

  def destroy
    @railway_station.destroy
      redirect_to railway_stations_url, notice: 'Станция удалена'
  end

  private
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def set_route
      @route = Route.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:name)
    end
end
