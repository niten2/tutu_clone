class Admin::TicketsController  < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]
  before_action :set_train, only: [:create]

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
    @ticket = Ticket.new(ticket_params)
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

  def set_user
    @user = User.find(params[:ticket][:user_id])
  end

  def set_train
    @train = Train.find(params[:ticket][:train_id])
  end


  def ticket_params
    params.require(:ticket).permit(:name, :surname, :patronymic, :train_id, :user_id)
  end

end
