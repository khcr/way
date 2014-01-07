class Gallery < ActiveRecord::Base
  attr_accessible :name, :description, :date, :isPrivate, :key
  has_many :paintings, :dependent => :destroy 

  validates :name, presence: true, length: { maximum: 55 }
  validates :date, presence: true

  validates :slug, uniqueness: true, presence: true

	before_validation :generate_slug
	
	def to_param
  	slug 
	end

	def generate_slug
  	self.slug ||= name.parameterize
	end
end
