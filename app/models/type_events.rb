class TypeEvents < ActiveRecord::Base
  attr_accessible :name

  has_many :events, :inverse_of => :type_events
end
