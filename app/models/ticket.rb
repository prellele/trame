class Ticket < ActiveRecord::Base
  attr_accessible :name, :description, :priority, :deadline, :active

  belongs_to :project
  belongs_to :user
  
end