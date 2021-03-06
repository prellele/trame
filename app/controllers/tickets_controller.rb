class TicketsController < ApplicationController
  # GET /tickets
  def index
    @tickets = Ticket.where(closed: false).order(:deadline)
    if (params[:closed] == "1")
      @tickets = Ticket.where(closed: true).order(:deadline)
    end
  end

  # GET /tickets/1
  def show
    @ticket = Ticket.find(params[:id])
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @projects = Project.all
    @users = User.all
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @projects = Project.all
    @users = User.all
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      redirect_to @ticket, notice: t("flash.notice.successfully_created", class: t("tickets.ticket") )
    else
      render action: "new"
    end
  end

  # PUT /tickets/1
  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to @ticket, notice: t("flash.notice.successfully_updated", class: t("tickets.ticket") )
    else
      render action: "edit"
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
  end
end
