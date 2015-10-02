class TrainsRoutesController < ApplicationController
  before_action :set_trains_route, only: [:show, :edit, :update, :destroy]

  def index
    @trains_routes = TrainsRoute.all
  end

  def show
  end

  def new
    @trains_route = TrainsRoute.new
  end

  def edit
  end

  def create
    @trains_route = TrainsRoute.new(trains_route_params)

    if @trains_route.save
      redirect_to @trains_route, notice: 'Поезд создан'
    else
      render :new
    end
  end

  def update
    if @trains_route.update(trains_route_params)
      redirect_to @trains_route, notice: 'Поезд обновлен'
    else
      render :edit
    end
  end

  def destroy
    @trains_route.destroy
    redirect_to trains_routes_url, notice: 'Поезд удален'
  end

  private
    def set_trains_route
      @trains_route = TrainsRoute.find(params[:id])
    end

    def trains_route_params
      params[:trains_route]
    end
end
