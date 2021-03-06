class ReportsController < ApplicationController
  respond_to :html, :csv
 
  # GET /reports
  def index
    @selectable_projects = current_user.projects
    @projects = current_user.projects.sort_by { |project| project.name.downcase }
    @projects = @projects.where(id: params[:project_ids], archive: false) if params[:project_ids]
    @projects_data = @projects.map do |project|
      trackings = project.trackings
      trackings = trackings.where(user_id: current_user.id)
      if params[:daterange].present?
        trackings = trackings.by_daterange(params[:daterange])
      end
      [project, trackings]
    end
    set_csv_filename(current_user.name)
  end
 
  def admin
    csv_usernames = "All"
    @selectable_projects = Project.where(archive: false).sort_by { |project| project.name.downcase }
    @selectable_users = User.all
    @projects = Project.where(archive: false).sort_by { |project| project.name.downcase }
    @projects = Project.where(id: params[:project_ids],archive: false).sort_by { |project| project.name.downcase } if params[:project_ids]
    @projects_data = @projects.map do |project|
      trackings = project.trackings
      if params[:user_ids]
        csv_usernames = User.where(id: params[:user_ids]).map(&:name).join('-')
        trackings = trackings.by_user(params[:user_ids])
      end
      if params[:daterange].present?
        trackings = trackings.by_daterange(params[:daterange])
      end
      [project, trackings]
    end
 
    set_csv_filename(csv_usernames)
  end
 
  private
 
  def set_csv_filename(names)
    components = [t("reports.report")]
    components << names
    components << @projects.map(&:name).join('-')
    components << Date.today.to_formatted_s(:db)
    components.map! {|component| component.delete(' ')[0, 50] }
    @filename = "#{components.join('_')}.csv"
  end
end