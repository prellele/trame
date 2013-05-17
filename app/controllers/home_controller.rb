class HomeController < ApplicationController
  # GET /projects
  def index
    @greeting = ["Hey there","Bon dia","Aloha","Hallo","Hi","Ola","Hola","Namaste", "Moin Moin"].sample

    @tracking = Tracking.new(project_id: current_user.most_used_project_id)
    @tracking.billable = true

    @todays_trackings = current_user.trackings.where("start_time >= ?", Date.today)
    @yesterdays_trackings = current_user.trackings.where("start_time > ? AND start_time < ?", Date.today-1.day, Date.today)
    @newest_trackings = current_user.trackings.where("created_at >= ? AND start_time < ?", Date.today-1.day, Date.today-1.day)
    @projects = current_user.projects
  end
end
