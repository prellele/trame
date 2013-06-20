class Attendance < ActiveRecord::Base
  attr_accessible :start, :end, :duration, :user_id

  validates_presence_of :start, :duration

  belongs_to :user

  default_scope :order => "start DESC"
  scope :by_daterange, lambda { |range| where("start >= ? and start <= ?", 
      DateTime.strptime(range.split(' - ')[0],I18n.t("date.formats.date_format")),
      DateTime.strptime("#{range.split(' - ')[1]} 23:59",I18n.t("time.formats.datetime"))) }

  def end
    self.start + self.duration.minutes if self.start && self.duration
  end

  def end=(date)
    self.duration = ((Time.zone.parse(date) - self.start.to_time) / 60).to_i if date.present?
  end

end
