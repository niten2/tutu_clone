class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create

    # binding.pry
    @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @wagon, notice: 'Вагон создан'
    else
      render :new
    end
  end

  def update
    # binding.pry
    if @wagon.update(wagon_params)
      redirect_to @wagon, notice: 'Вагон обновлен'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Вагон удален'
  end

  private
    def set_wagon
      @wagon = Wagon.find(params[:id])
    end

    def wagon_params
      # binding.pry
      params.require(find_type).permit(:number, :train_id, :count_top_places, :count_lower_places, :type, :count_side_top_places, :count_side_lower_places, :count_seat_places)
    end

    def find_type
      # binding.pry
      params[:wagon].nil? ? params[:type] : :wagon
    end

end



# @sleeping_wagons = SleepingWagon.all
# @seat_wagons = SeatWagon.all
# @economy_wagons = EconomyWagon.all
# @coupe_wagons = CoupeWagon.all

# if :wagon.nil?
#   :type
# else
#   :wagon
# end

# if params[:type].nil?
#   params[:type] = "wagon"
# end

# Wagon.type.include?(params[:type]) ? params[:type] : "wagon"
# end

# params.require(:wagon).permit(:number, :train_id, :count_top_places, :count_lower_places, :type, :count_side_top_places, :count_side_lower_places, :count_seat_places)
