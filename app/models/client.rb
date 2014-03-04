class Client < ActiveRecord::Base
  attr_accessible :name

  validates_uniqueness_of :name, presence: true

  has_many :projects
  has_many :trackings, through: :projects
end