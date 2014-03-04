class ClientsController < ApplicationController
  # GET /clients
  def index
    @clients = Client.all
  end

  # GET /clients/1
  def show
    @client = Client.find(params[:id])
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to @client, notice: t("flash.notice.successfully_created", class: t("clients.client") )
    else
      render action: "new"
    end
  end

  # PUT /clients/1
  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      redirect_to @client, notice: t("flash.notice.successfully_updated", class: t("clients.client") )
    else
      render action: "edit"
    end
  end

  # DELETE /clients/1
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end
end
