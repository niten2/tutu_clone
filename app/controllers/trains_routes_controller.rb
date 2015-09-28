class TrainsRoutesController < ApplicationController
  before_action :set_trains_route, only: [:show, :edit, :update, :destroy]

  # GET /trains_routes
  # GET /trains_routes.json
  def index
    @trains_routes = TrainsRoute.all
  end

  # GET /trains_routes/1
  # GET /trains_routes/1.json
  def show
  end

  # GET /trains_routes/new
  def new
    @trains_route = TrainsRoute.new
  end

  # GET /trains_routes/1/edit
  def edit
  end

  # POST /trains_routes
  # POST /trains_routes.json
  def create
    @trains_route = TrainsRoute.new(trains_route_params)

    respond_to do |format|
      if @trains_route.save
        format.html { redirect_to @trains_route, notice: 'Trains route was successfully created.' }
        format.json { render :show, status: :created, location: @trains_route }
      else
        format.html { render :new }
        format.json { render json: @trains_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains_routes/1
  # PATCH/PUT /trains_routes/1.json
  def update
    respond_to do |format|
      if @trains_route.update(trains_route_params)
        format.html { redirect_to @trains_route, notice: 'Trains route was successfully updated.' }
        format.json { render :show, status: :ok, location: @trains_route }
      else
        format.html { render :edit }
        format.json { render json: @trains_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains_routes/1
  # DELETE /trains_routes/1.json
  def destroy
    @trains_route.destroy
    respond_to do |format|
      format.html { redirect_to trains_routes_url, notice: 'Trains route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trains_route
      @trains_route = TrainsRoute.find(params[:id])
    end

    def trains_route_params
      params[:trains_route]
    end
end
