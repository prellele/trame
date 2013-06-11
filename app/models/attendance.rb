class Attendance < ActiveRecord::Base
  attr_accessible :start, :end, :duration, :user_id

  validates_presence_of :start, :duration

  belongs_to :user

  def end
    self.start + self.duration.minutes if self.start && self.duration
  end

  def end=(date)
    self.duration = ((Time.zone.parse(date) - self.start.to_time) / 60).to_i
  end

end
