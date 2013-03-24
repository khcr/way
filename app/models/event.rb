class Event < ActiveRecord::Base
  attr_accessible :date, :info, :minigroup, :orateur, :president, :remarque, :theme, :image_id, :type_events_id

  belongs_to :type_events, :inverse_of => :events

  validates :date, presence: true
  validates :theme, presence: true, length: { maximum: 55}

  validates :slug, uniqueness: true, presence: true

	before_validation :generate_slug
	
	def to_param
  	slug 
	end

	def generate_slug
  	self.slug ||= theme.parameterize
	end
end
