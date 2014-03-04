class Ticket < ActiveRecord::Base
  attr_accessible :name, :description, :priority, :deadline, :closed, :project_id, :user_id

  belongs_to :project
  belongs_to :user
  
end