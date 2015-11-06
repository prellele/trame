class ProjectsController < ApplicationController

  # GET /projects
  def index
    @project_filter = params[:filter] && params[:filter][:archive].to_i || 0
    @projects = Project.where("archive = ?", @project_filter)
    @projects_usage = @projects
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = Project.new
    @clients = Client.all
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @clients = Client.all
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, notice: t("flash.notice.successfully_created", class: t("projects.project") )
    else
      render action: "new"
    end
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: t("flash.notice.successfully_updated", class: t("projects.project") )
    else
      render action: "edit"
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
end
