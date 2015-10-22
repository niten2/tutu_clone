class Admin::WagonsController < Admin::BaseController

  before_action :set_train, only: [:new, :create]

  def new
    @wagon = Wagon.new
  end

  def show
    @wagon = Wagon.find(params[:id])
  end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  protected

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:number, :train_id, :count_top_places, :count_lower_places, :type, :count_side_top_places, :count_side_lower_places, :count_seat_places, :number_in_train)
  end
end
