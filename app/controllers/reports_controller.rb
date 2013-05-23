class ReportsController < ApplicationController
  respond_to :html, :csv
 
  # GET /reports
  def index
    @show_actions = true

    @selectable_projects = current_user.projects
    @projects = current_user.projects
    @projects = @projects.where(id: params[:project_ids]) if params[:project_ids]
    @projects_data = @projects.map do |project|
      trackings = project.trackings
      trackings = trackings.where(user_id: current_user.id)
      if params[:daterange].present?
        trackings = trackings_in_daterange(trackings, params[:daterange])
      end
      [project, trackings]
    end
    set_csv_filename(current_user.name)
  end
 
  def admin
    csv_usernames = "All"
    @selectable_projects = current_user.visible_projects
    @selectable_users = User.all
    @projects = Project.all
    @projects = @projects.where(id: params[:project_ids]) if params[:project_ids]
    @projects_data = @projects.map do |project|
      trackings = project.trackings
      if params[:user_ids]
        csv_usernames = User.where(id: params[:user_ids]).map(&:name).join('-')
        trackings = trackings.where(user_id: params[:user_ids])
      end
      if params[:daterange].present?
        trackings = trackings_in_daterange(trackings, params[:daterange])
      end
      [project, trackings]
    end
 
    set_csv_filename(csv_usernames)
  end
 
  private

  def trackings_in_daterange(trackings, daterange)
    trackings.where("start_time >= ? and start_time <= ?", 
      DateTime.strptime(params[:daterange].split(' - ')[0],t("date.formats.date_format")),
      DateTime.strptime("#{params[:daterange].split(' - ')[1]} 23:59",t("time.formats.datetime")))
  end
 
  def set_csv_filename(names)
    components = [t("reports.report")]
    components << names
    components << @projects.map(&:name).join('-')
    components << Date.today.to_formatted_s(:db)
    components.map! {|component| component.delete(' ')[0, 50] }
    @filename = "#{components.join('_')}.csv"
  end
end