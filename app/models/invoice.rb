class Invoice < ActiveRecord::Base
  attr_accessible :start_range, :end_range

  has_and_belongs_to_many :trackings
  has_one :client
  
end