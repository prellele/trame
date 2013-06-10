class HomeController < ApplicationController
  # GET /
  def index
    set_data_for_new_tracking()
    @attendance = current_user.attendances.where("start >= ?", Date.today).first
    
    @show_actions = true
    @trackings = current_user.trackings.where("start_time >= ? OR updated_at >= ?", Date.today, Date.today-1.day)
                             .group_by(&:group_by_criteria)
  end

  private

  def set_data_for_new_tracking
    @tracking = Tracking.new(project_id: current_user.most_used_project_id)
    @tracking.billable = true
    @projects = Project.all 
  end

end