class HomeController < ApplicationController
  # GET /
  def index
    @greeting = ["Hey there","Bon dia","Aloha","Hallo","Hi","Ola","Hola","Namaste", "Moin Moin"].sample
    @show_actions = true
    
    @tracking = Tracking.new(project_id: current_user.most_used_project_id)
    @tracking.billable = true

    @trackings = current_user.trackings.where("start_time >= ? OR updated_at >= ?", Date.today, Date.today-1.day)
                             .group_by(&:group_by_criteria).map { |d,t| [d, t] }
    @projects = Project.all
  end

end