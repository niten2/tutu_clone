class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def index
    @tickets = current_user.tickets
  end

  def edit
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @train.tickets << @ticket

    if @ticket.save
      redirect_to @ticket, notice: 'Билет куплен'
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy

    redirect_to @ticket, notice: 'Билет удален'
  end

private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :surname, :patronymic)
  end

end
