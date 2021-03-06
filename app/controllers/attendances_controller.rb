class AttendancesController < ApplicationController

  # GET /attendances
  def index
    @attendances = current_user.attendances
  end

  # GET /attendances/1
  def show
    @attendance = current_resource
  end

  # GET /attendances/new
  def new
    @attendance = current_user.attendances.new()
  end

  # GET /attendances/1/edit
  def edit
    @attendance = current_resource
  end

  # POST /attendances
  def create
    @attendance = current_user.attendances.build(params[:attendance])

    if @attendance.save
      redirect_to attendances_path, notice: t("flash.notice.successfully_created", class: t("attendances.attendance") )
    else
      set_attendance_new_data()
      render action: "new"
    end
  end

  # PUT /attendances/1
  def update
    @attendance = current_resource

    if @attendance.update_attributes(params[:attendance])
      redirect_to attendances_path, notice: t("flash.notice.successfully_updated", class: t("attendances.attendance") )
    else
      render action: "edit"
    end
  end

  # DELETE /attendances/1
  def destroy
    @attendance = current_resource
    @attendance.destroy
    redirect_to attendances_path
  end

  def current_resource
    @current_resource ||= Attendance.where(id: params[:id]).first
  end

  def toggle
    if @attendance = Attendance.where("start >= ?",Date.today).first
      @attendance.duration = ((Time.now - @attendance.start) / 60).to_i if @attendance.duration == 0
    else
      @attendance = current_user.attendances.new()
      @attendance.start = Time.now
      @attendance.duration = 0
    end
    if @attendance.save
      redirect_to home_index_path, notice: t("flash.notice.successfully_created", class: t("attendances.attendance") )
    else
      redirect_to home_index_path, notice: t("flash.notice.failed_creating", class: t("attendances.attendance") )
    end
  end

end
