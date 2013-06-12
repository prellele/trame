class Role < ActiveRecord::Base
  attr_accessible :name, :description, :right_ids

  has_and_belongs_to_many :rights
  has_and_belongs_to_many :users


end