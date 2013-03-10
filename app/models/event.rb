class Event < ActiveRecord::Base
  attr_accessible :date, :info, :minigroup, :orateur, :president, :remarque, :theme, :image_id, :type_events_id

  belongs_to :type_events, :inverse_of => :events

  validates :date, presence: true
  validates :theme, presence: true, length: { maximum: 55}
end
