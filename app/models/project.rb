class Project < ActiveRecord::Base
  attr_accessible :name, :content

  validates :name, presence: true, length: { maximum: 15 }
  validates :content, presence: true
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug

  def to_param
  	slug 
	end

	def generate_slug
  	self.slug ||= name.parameterize
	end

end
