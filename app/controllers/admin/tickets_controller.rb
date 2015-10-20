class Admin::TicketsController  < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def index
    @tickets = Ticket.all
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Билет обновлен'
    else
      render :edit
    end
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket], notice: 'Билет куплен'
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to [:admin, @ticket], notice: 'Билет удален'
  end

private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :surname, :patronymic)
  end

end
