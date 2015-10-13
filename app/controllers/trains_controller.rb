class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy, :add_wagon, :remove_wagon ]
  before_action :set_wagon, only: [:add_wagon, :remove_wagon]

  # def add_wagon
  #   add_wagon_method(@train, @wagon)
  #   redirect_to @train, notice: "Вагон #{@wagon.number} прицеплен к поезду"
  # end

  # def remove_wagon_method
  #   remove_wagon(@train, @wagon)
  #   redirect_to @train, notice: "Вагон #{@wagon.number} отсоеденен"
  # end


  def index
    @trains = Train.all
  end

  def show
    @wagons_not_number = Wagon.where(number_in_train: nil)
    @trains = Train.all
  end

  def new
    @wagons = Wagon.all
    @train = Train.new
  end

  def edit
  end

  def create
    @wagons = Wagon.all
    @train = Train.new(train_params)
    if @train.save
      redirect_to @train, notice: 'Поезд создан'
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to @train, notice: 'Поезд обновлен'
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to trains_url, notice: 'Поезд удален'
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def set_wagon
      @wagon = Wagon.find(params[:wagon])
    end

    def train_params
      params.require(:train).permit(:number, :route_id)
    end

end
