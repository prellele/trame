class HomeController < ApplicationController
  # GET /projects
  def index
    @greeting = ["Hey there","Bon dia","Aloha","Hallo","Hi","Ola","Hola","Namaste", "Moin Moin"].sample
    @todays_trackings = current_user.trackings.where("start_time >= ?", Date.today)
    @projects = current_user.projects
  end
end
