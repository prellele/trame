class Project < ActiveRecord::Base
  attr_accessible :id, :name

  validates_uniqueness_of :name, presence: true

  has_many :trackings, :dependent => :destroy
  has_many :users, through: :trackings

  def trackings_for(user)
    user.admin? ? trackings : trackings.where(user_id: user.id)
  end

  def workinghours_for(user)
    trackings.where(user_id: user.id).sum(:minutes)
  end

  def sum_workingtime
    trackings.sum(:minutes)
  end

  def sum_workingtime_hours
    sum_workingtime / 60
  end

  def members
    trackings.map { |t| t.user.name }.uniq
  end

end
