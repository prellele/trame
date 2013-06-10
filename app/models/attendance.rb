class Attendance < ActiveRecord::Base
  attr_accessible :start, :duration, :user_id

  validates_presence_of :start, :duration

  belongs_to :user

  def end
    self.start + self.duration.minutes if self.start && self.duration
  end

end
