class Event < ActiveRecord::Base
  attr_accessible :date, :info, :minigroup, :orateur, :president, :remarque, :theme, :type_soiree

  validates :date, presence: true
  validates :minigroup, presence: true
  validates :type_soiree, presence: true
  validates :theme, presence: true, length: { maximum: 10}

end
