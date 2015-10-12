class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy, :add_wagon, :remove_wagon]
  before_action :set_wagon, only: [:add_wagon, :remove_wagon]

  before_action :add_wagon_number_train, only: [:add_wagon]
  before_action :delete_wagon_number_train, only: [:remove_wagon]
  after_action  :check_wagons, only: [:remove_wagon]

  def add_wagon
    @train.wagons << @wagon
    redirect_to @train, notice: "Вагон #{@wagon.number} прицеплен к поезду"
  end

  def remove_wagon
    @train.wagons.delete(@wagon)
    redirect_to @train, notice: "Вагон #{@wagon.number} отсоеденен"
  end

  def index
    @trains = Train.all
  end

  def show
    @wagons_not_number = Wagon.where(number_in_train: nil)
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


    def add_wagon_number_train



      @wagon.number_in_train = @train.wagons.length + 1



    end

    def delete_wagon_number_train


      @wagon.number_in_train = nil
      @wagon.save
    end

    def check_wagons
      # binding.pry
    end



end


# @train = Train.find(params[:id])
# @wagon = Wagon.find(params[:wagon])
# @wagon.number_in_train = @train.wagons.length+1
# binding.pry
# @train = Train.find(params[:id])
# @wagon = Wagon.find(params[:wagon])
# binding.pry
# @train = Train.find(params[:id])
# @wagon = Wagon.find(params[:wagon])
# binding.pry
# @wagons = Wagon.all

