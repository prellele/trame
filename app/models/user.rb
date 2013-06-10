class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :prename, :surname, :password, :password_confirmation, 
                  :remember_me, :admin, :weekly_workinghours

  has_many :trackings, dependent: :destroy, order: 'start_time DESC'
  has_many :projects, through: :trackings, order: 'created_at DESC', uniq: true

  def workinghours_week
    (weekly_workinghours || 40.0)
  end

  def name
    "#{prename} #{surname}".presence || email
  end

  def most_used_project_id
    trackings.joins(:project).select("COUNT(*) AS count, projects.name, projects.id AS id")
                             .group('projects.name')
                             .reorder("count DESC")
                             .first.try(:id)
  end

  def workinghours
    trackings.sum(:minutes)
  end

  def billable_workinghours
    trackings.where(billable: true).sum(:minutes)
  end

  def visible_trackings
    (admin? ? Tracking : trackings).scoped
  end

  def visible_projects
    (admin? ? Project : projects).scoped
  end

  def expected_workingtime_minutes(duration)
    day = workinghours_week / 5 * 60
    expected_minutes = case duration
                 when "day" then day
                 when "week"  then day*5
                 when "month" then day*Time.days_in_month(Date.today.month)
                 when "year"  then day*365
                 else return 0
                 end

  end

  def workingtime_minutes(duration, billables=false)
    @trackings = trackings
    if billables
      @trackings = trackings.where("billable = ?", billables)
    end
    start_date = case duration
                 when "day" then :at_beginning_of_day
                 when "week"  then :at_beginning_of_week
                 when "month" then :at_beginning_of_month
                 when "year"  then :at_beginning_of_year
                 else return 0
                 end

    @trackings.where("start_time >= ?", Date.today.send(start_date)).sum(:minutes)
  end

  def workingtime_percentage(duration)
    worked_minutes = workingtime_minutes(duration)
    expected_minutes = expected_workingtime_minutes(duration)
    worked_minutes * 100 / expected_minutes
  end

  def overtime_minutes(duration)
    overtime = workingtime_minutes(duration) - expected_workingtime_minutes(duration)
    overtime > 0 ? overtime : 0
  end

  def percentage_billable(duration)
    billables = workingtime_minutes(duration, true)
    non_billables = workingtime_minutes(duration)
    return billables * 100 / non_billables if non_billables > 0
    return 0
  end

  def daily_worked_hours
    @workinghours = []
    Date.today.at_beginning_of_week.upto(Date.today) { |date| 
      @workinghours<< (self.trackings.where("start_time >= ? AND start_time < ?", date, date+1.day).sum(:minutes)/60.to_f).round(1)
    }
    @workinghours
  end

  def weekly_worked_hours
    @weekly_worked_hours = 0
    Date.today.at_beginning_of_week.upto(Date.today) { |date| 
      @weekly_worked_hours += (self.trackings.where("start_time >= ? AND start_time < ?", date, date+1.day).sum(:minutes))
    }
    @weekly_worked_hours
  end

  def weekly_earliest_tracking_start_time
    trackings_of_week_sorted_by_time.first ? trackings_of_week_sorted_by_time.first.start_time.strftime("%H").to_i - 1 : 1
  end

  def weekly_latest_tracking_start_time
    trackings_of_week_sorted_by_time.last ? trackings_of_week_sorted_by_time.last.start_time.strftime("%H").to_i + 1 : 23
  end

  def trackings_of_week_sorted_by_time
    first_day = Date.today.at_beginning_of_week
    sorted_trackings = self.trackings.where("start_time >= ? AND start_time < ?", first_day, first_day+6.day).sort_by{|a| a.start_time.strftime("%H %M").to_i}
  end

end
