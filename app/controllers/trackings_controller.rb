class TrackingsController < ApplicationController

  # GET /trackings/1
  def show
    @tracking = current_resource
  end

  # GET /trackings/new
  def new
    set_tracking_new_data()
    @tracking = Tracking.new(project_id: current_user.most_used_project_id)
    @tracking.billable = true
  end

  # GET /trackings/1/edit
  def edit
    @tracking = current_resource
    @tracking.start_time = l(@current_resource.start_time, format: t("time.formats.datetime"))
    @projects = Project.all
  end

  # POST /trackings
  def create
    @tracking = current_user.trackings.build(params[:tracking])

    respond_to do |format|
      if @tracking.save
        format.html { redirect_to home_index_path, notice: t("flash.notice.successfully_created", class: t("trackings.tracking")) }
        format.js   {}
        format.json { render json: @tracking, status: :created, location: @tracking }
      else
        set_tracking_new_data()
        format.html { render action: "new" }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trackings/1
  def update
    @tracking = current_resource
    if @tracking.update_attributes(params[:tracking])
      redirect_to root_path, notice: t("flash.notice.successfully_updated", class: t("trackings.tracking") )
    else
      render action: "edit"
    end
  end

  # DELETE /trackings/1
  def destroy
    @tracking = current_resource
    @tracking.destroy
    redirect_to root_path
  end

  def current_resource
    @current_resource ||= Tracking.where(id: params[:id]).first
  end

  private

  def set_tracking_new_data
    @todays_trackings = current_user.trackings.where("start_time >= ?", Date.today).paginate(:page => params[:page], :per_page => 20)
    @projects = Project.all
  end
end
