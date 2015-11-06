class HomeController < ApplicationController
  # GET /
  def index
    set_data_for_new_tracking()
    @attendance = current_user.attendances.where("start >= ?", Date.today).first
    
    @trackings = current_user.trackings.where("start_time >= ? OR updated_at >= ?", Date.today, Date.today-1.day)
                             .group_by(&:group_by_criteria)
    @weekly_trackings = current_user.trackings.by_daterange(this_week_string())
    @weekly_attendances = current_user.attendances.by_daterange(this_week_string())
  end

  private

  def set_data_for_new_tracking
    @tracking = Tracking.new(project_id: current_user.most_used_project_id)
    @tracking.billable = true
    @projects = Project.where(:archive => false).sort_by { |project| project.name.downcase }
  end

end