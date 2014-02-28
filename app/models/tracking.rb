class Tracking < ActiveRecord::Base
  attr_accessible :description, :minutes, :start_time, :billable, :created_at, :project_id, :user_id

  attr_readonly :user_id

  validates_presence_of :description, :start_time, :project_id
  validates :minutes, presence: true, numericality: { only_integer: true, message: "Duration should be a number" }

  belongs_to :project
  belongs_to :user

  scope :by_project, lambda {|project_id| where(:project_id => project_id)}
  scope :by_user, lambda {|user_id| where(:user_id => user_id)}
  scope :by_daterange, lambda { |range| where("start_time >= ? and start_time <= ?", 
      DateTime.strptime(range.split(' - ')[0],I18n.t("date.formats.date_format")),
      DateTime.strptime("#{range.split(' - ')[1]} 23:59",I18n.t("time.formats.datetime"))) }
  scope :billables, lambda {|billable| where(:billable => billable)}

  def end_time
    self.start_time + self.minutes.minutes if self.start_time && self.minutes
  end

  def group_by_criteria
    start_time.to_date
  end
end
