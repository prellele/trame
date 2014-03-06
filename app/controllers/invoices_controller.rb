class InvoicesController < ApplicationController
  # GET /invoices
  def index
    @invoices = Invoice.find(:all, :order => "created_at DESC")
  end

  # GET /invoices/1
  def show
    @invoice = Invoice.find(params[:id])
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @clients = Client.all
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
    @clients = Client.all
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(params[:invoice])
    if @invoice.save
      respond_to do |format|
        format.html { redirect_to @invoice, notice: t("flash.notice.successfully_created", class: t("invoices.invoice")) }
        format.json { render json: @invoice, status: :created, location: @invoice }
        format.js { render :js => %(window.location.href='#{invoices_path}') }
      end
    else
      render action: "new"
    end
  end

  # PUT /invoices/1
  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update_attributes(params[:invoice])
      redirect_to @invoice, notice: t("flash.notice.successfully_updated", class: t("invoices.invoice") )
    else
      render action: "edit"
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end
end
