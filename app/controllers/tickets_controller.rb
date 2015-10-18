class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @train = Train.find(params[:train_id])
    @user = User.find(params[:user_id])
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @train = Train.find(params[:train_id])
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.new(ticket_params)
    @train.tickets << @ticket

    if @ticket.save
      redirect_to @ticket, notice: 'Билет куплен'
    else
      render :new
    end
  end


  def destroy
    @ticket.destroy
    redirect_to @ticket.user, notice: 'Билет удален'
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:name, :surname, :patronymic)
    end
end
