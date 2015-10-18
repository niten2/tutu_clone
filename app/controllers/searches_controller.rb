class SearchesController < ApplicationController
  before_action :set_route, only: [:show]

  def new
  end

  def show
  @user = User.all.first
  @found_trains = @routes.search_in_route_train(params[:start_station_id], params[:end_station_id])
  end

private
  def set_route
    @routes = Route.all
  end

end
