class Level < ActiveRecord::Base
  attr_accessible :name

  has_many :users, :inverse_of => :level
end