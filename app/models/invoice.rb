class Invoice < ActiveRecord::Base
  attr_accessible :created_at,:user_id, :client_id, :tracking_ids, :client

  has_and_belongs_to_many :trackings
  belongs_to :client

  def projects
    projects = []
    projects = self.trackings.collect { |t| t.project.name }.uniq.join(', ')
  end

end